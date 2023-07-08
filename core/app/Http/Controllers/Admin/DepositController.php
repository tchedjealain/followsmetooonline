<?php

namespace App\Http\Controllers\Admin;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Gateway\PaymentController;
use App\Models\Deposit;
use App\Models\Gateway;
use Illuminate\Http\Request;

class DepositController extends Controller
{
    public function pending()
    {
        $pageTitle = 'Dépôts En Ettente ';
        $deposits  = $this->depositData('pending');
        return view('admin.deposit.log', compact('pageTitle', 'deposits'));
    }

    public function approved()
    {
        $pageTitle = 'Dépôts Approuvés';
        $deposits  = $this->depositData('approved');
        return view('admin.deposit.log', compact('pageTitle', 'deposits'));
    }

    public function successful()
    {
        $pageTitle = 'Dépôts Réussis';
        $deposits  = $this->depositData('successful');
        return view('admin.deposit.log', compact('pageTitle', 'deposits'));
    }

    public function rejected()
    {
        $pageTitle = 'Dépôts Rejetés';
        $deposits  = $this->depositData('rejected');
        return view('admin.deposit.log', compact('pageTitle', 'deposits'));
    }

    public function initiated()
    {
        $pageTitle = 'Dépôts Initiés';
        $deposits  = $this->depositData('initiated');
        return view('admin.deposit.log', compact('pageTitle', 'deposits'));
    }

    public function deposit()
    {
        $pageTitle   = 'Historique Dépôts';
        $depositData = $this->depositData($scope = null, $summery = true);
        $deposits    = $depositData['data'];
        $summery     = $depositData['summery'];
        $successful  = $summery['successful'];
        $pending     = $summery['pending'];
        $rejected    = $summery['rejected'];
        $initiated   = $summery['initiated'];
        return view('admin.deposit.log', compact('pageTitle', 'deposits', 'successful', 'pending', 'rejected', 'initiated'));
    }

    protected function depositData($scope = null, $summery = false)
    {

        if ($scope) {
            $deposits = Deposit::$scope()->with(['user', 'gateway']);
        } else {
            $deposits = Deposit::with(['user', 'gateway']);
        }

        //search
        $deposits = $deposits->searchable(['trx', 'user:username'])->dateFilter();

        $request = request();

        //vai method
        if ($request->method) {
            $method   = Gateway::where('alias', $request->method)->firstOrFail();
            $deposits = $deposits->where('method_code', $method->code);
        }

        if (!$summery) {
            return $deposits->orderBy('id', 'desc')->paginate(getPaginate());
        } else {
            $successful = clone $deposits;
            $pending    = clone $deposits;
            $rejected   = clone $deposits;
            $initiated  = clone $deposits;

            $successfulSummery = $successful->where('status', Status::PAYMENT_SUCCESS)->sum('amount');
            $pendingSummery    = $pending->where('status', Status::PAYMENT_PENDING)->sum('amount');
            $rejectedSummery   = $rejected->where('status', Status::PAYMENT_REJECT)->sum('amount');
            $initiatedSummery  = $initiated->where('status', Status::PAYMENT_INITIATE)->sum('amount');

            return [
                'data'    => $deposits->orderBy('id', 'desc')->paginate(getPaginate()),
                'summery' => [
                    'successful' => $successfulSummery,
                    'pending'    => $pendingSummery,
                    'rejected'   => $rejectedSummery,
                    'initiated'  => $initiatedSummery,
                ],
            ];
        }
    }

    public function details($id)
    {
        $general   = gs();
        $deposit   = Deposit::where('id', $id)->with(['user', 'gateway'])->firstOrFail();
        $pageTitle = $deposit->user->username . ' requested ' . showAmount($deposit->amount) . ' ' . $general->cur_text;
        $details   = ($deposit->detail != null) ? json_encode($deposit->detail) : null;
        return view('admin.deposit.detail', compact('pageTitle', 'deposit', 'details'));
    }

    public function approve($id)
    {
        $deposit = Deposit::where('id', $id)->where('status', Status::PAYMENT_PENDING)->firstOrFail();

        PaymentController::userDataUpdate($deposit, true);

        $notify[] = ['success', 'Demande de dépôt approuvée avec succès'];

        return to_route('admin.deposit.pending')->withNotify($notify);
    }

    public function reject(Request $request)
    {
        $request->validate([
            'id'      => 'required|integer',
            'message' => 'required|string|max:255',
        ]);
        $deposit = Deposit::where('id', $request->id)->where('status', Status::PAYMENT_PENDING)->firstOrFail();

        $deposit->admin_feedback = $request->message;
        $deposit->status         = Status::PAYMENT_REJECT;
        $deposit->save();

        notify($deposit->user, 'DEPOSIT_REJECT', [
            'method_name'       => $deposit->gatewayCurrency()->name,
            'method_currency'   => $deposit->method_currency,
            'method_amount'     => showAmount($deposit->final_amo),
            'amount'            => showAmount($deposit->amount),
            'charge'            => showAmount($deposit->charge),
            'rate'              => showAmount($deposit->rate),
            'trx'               => $deposit->trx,
            'rejection_message' => $request->message,
        ]);

        $notify[] = ['success', 'Demande de dépôt rejetée avec succès'];
        return to_route('admin.deposit.pending')->withNotify($notify);
    }
}
