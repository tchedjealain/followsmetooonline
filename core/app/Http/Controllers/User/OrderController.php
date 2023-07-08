<?php

namespace App\Http\Controllers\User;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Models\AdminNotification;
use App\Models\Order;
use App\Models\Service;
use App\Models\Transaction;
use Illuminate\Http\Request;

class OrderController extends Controller
{
	public function order(Request $request, $serviceId)
	{
		$user    = auth()->user();
		$service = Service::with('category')->active()->findOrFail($serviceId);
		$request->validate([
			'link'     => 'required|url',
			'quantity' => 'required|integer|gte:' . $service->min . '|lte:' . $service->max,
		]);
		$price = ($service->price_per_k / 1000) * $request->quantity;

		if ($user->balance < $price) {
			$notify[] = ["error", 'Solde insuffisant. Veuillez recharger votre compte'];
			return to_route('user.deposit.index')->withNotify($notify);
		}

		$user->balance -= $price;
		$user->save();
		//Create Transaction
		$transaction               = new Transaction();
		$transaction->user_id      = $user->id;
		$transaction->amount       = $price;
		$transaction->post_balance = $user->balance;
		$transaction->trx_type     = '-';
		$transaction->details      = 'Order for ' . $service->name;
		$transaction->trx          = getTrx();
		$transaction->remark       = 'order';
		$transaction->save();

		//Make order
		$order                  = new Order();
		$order->user_id         = $user->id;
		$order->category_id     = $service->category->id;
		$order->service_id      = $serviceId;
		$order->api_service_id  = $service->api_service_id ?? Status::NO;
		$order->api_provider_id = $service->api_provider_id ?? Status::NO;
		$order->link            = $request->link;
		$order->quantity        = $request->quantity;
		$order->price           = $price;
		$order->remain          = $request->quantity;
		$order->api_order       = $service->api_service_id ? Status::YES : Status::NO;
		$order->save();

		//Create admin notification
		$adminNotification            = new AdminNotification();
		$adminNotification->user_id   = $user->id;
		$adminNotification->title     = 'Nouvelle commande pour' . $service->name;
		$adminNotification->click_url = urlPath('admin.orders.details', $order->id);
		$adminNotification->save();

		notify($user, 'PENDING_ORDER', [
			'service_name' => $service->name,
			'category'     => $service->category->name,
			'username'     =>  $user->username,
			'full_name'     => $user->fullname,
			'price'        => $price,
			'post_balance' => getAmount($user->balance),
		]);
		$notify[] = ['success', 'Votre commande a été passée avec succès !'];
		return back()->withNotify($notify);
	}

	public function history()
	{
		$pageTitle = 'Historiques Des Commandes';
		$orders    = $this->orderData();
		return view($this->activeTemplate . 'user.orders.history', compact('pageTitle', 'orders'));
	}

	public function pending()
	{
		$pageTitle = "Commandes En Attentes";
		$orders    = $this->orderData('pending');
		return view($this->activeTemplate . 'user.orders.history', compact('pageTitle', 'orders'));
	}

	public function processing()
	{
		$pageTitle = "Commandes Encours";
		$orders    = $this->orderData('processing');
		return view($this->activeTemplate . 'user.orders.history', compact('pageTitle', 'orders'));
	}

	public function completed()
	{
		$pageTitle = "Commandes Terminées";
		$orders    = $this->orderData('completed');
		return view($this->activeTemplate . 'user.orders.history', compact('pageTitle', 'orders'));
	}

	public function cancelled()
	{
		$pageTitle = "Commandes Annulées";
		$orders    = $this->orderData('cancelled');
		return view($this->activeTemplate . 'user.orders.history', compact('pageTitle', 'orders'));
	}

	public function refunded()
	{
		$pageTitle = "Commandes Retournées";
		$orders    = $this->orderData('refunded');
		return view($this->activeTemplate . 'user.orders.history', compact('pageTitle', 'orders'));
	}

	protected function orderData($scope = null)
	{

		if ($scope) {
			$orders = Order::$scope();
		} else {
			$orders = Order::query();
		}

		return $orders->where('user_id', auth()->id())->searchable(['category:name', 'service:name'])->with(['category', 'user', 'service'])->orderBy('id', 'desc')->paginate(getPaginate());
	}

	public function massOrder()
	{
		$pageTitle = 'Cmd en Masse';
		return view($this->activeTemplate . 'user.orders.mess', compact('pageTitle'));
	}

	public function massOrderStore(Request $request)
	{

		if (substr_count($request->mass_order, '|') < 4) {
			$notify[] = ['error', 'Les structures de service ne sont pas correctes. Veuillez retaper !'];
			return back()->withNotify($notify);
		}

		$separateNewLine = explode(PHP_EOL, $request->mass_order);

		foreach ($separateNewLine as $item) {
			$serviceArray = explode('|', $item);

			//Start Validations
			if (count($serviceArray) != 3) {
				$notify[] = ['error', 'Les structures de service ne sont pas correctes. Veuillez retaper !'];
				return back()->withNotify($notify)->withInput();
			}

			$service = Service::find($serviceArray[0]);
			if (!$service) {
				$notify[] = ['error', 'ID de service introuvable !'];
				return back()->withNotify($notify)->withInput();
			}

			if (filter_var($serviceArray[2], FILTER_VALIDATE_INT) == false) {
				$notify[] = ['error', 'La quantité doit être une valeur entière !'];
				return back()->withNotify($notify)->withInput();
			}

			if ($serviceArray[2] < $service->min) {
				$notify[] = ['error', 'La quantité doit être supérieure ou égale à ' . $service->min];
				return back()->withNotify($notify)->withInput();
			}

			if ($serviceArray[2] > $service->max) {
				$notify[] = ['error', 'La quantité doit être inférieure ou égale à ' . $service->max];
				return back()->withNotify($notify)->withInput();
			}

			// End validation

			$price = getAmount(($service->price_per_k / 1000) * $serviceArray[2]);
			$user  = auth()->user();

			if ($user->balance < $price) {
				$notify[] = ['error', 'Solde insuffisant. Veuillez recharger et réessayer !'];
				return back()->withNotify($notify);
			}

			$user->balance -= $price;
			$user->save();

			//Make order
			$order              = new Order();
			$order->user_id     = $user->id;
			$order->category_id = $service->category->id;
			$order->service_id  = $service->id;
			$order->link        = $serviceArray[1];
			$order->quantity    = $serviceArray[2];
			$order->price       = $price;
			$order->remain      = $serviceArray[2];
			$order->save();

			//Create Transaction
			$transaction               = new Transaction();
			$transaction->user_id      = $user->id;
			$transaction->amount       = $price;
			$transaction->post_balance = getAmount($user->balance);
			$transaction->trx_type     = '-';
			$transaction->details      = 'Order for ' . $service->name;
			$transaction->trx          = getTrx();
			$transaction->remark       = "Order";
			$transaction->save();

			//Create admin notification
			$adminNotification            = new AdminNotification();
			$adminNotification->user_id   = $user->id;
			$adminNotification->title     = 'Nouvelle commande pour' . $service->name;
			$adminNotification->click_url = urlPath('admin.orders.details', $order->id);
			$adminNotification->save();

			//Send email to user

			notify($user, 'PENDING_ORDER', [
				'service_name' => $service->name,
				'price'        => $price,
				'currency'     => gs()->cur_text,
				'post_balance' => getAmount($user->balance),
			]);
		}

		$notify[] = ['success', 'Votre commande a été passée avec succès!'];
		return back()->withNotify($notify);
	}
}
