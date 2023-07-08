<?php

namespace App\Http\Controllers\User\Auth;

use App\Http\Controllers\Controller;
use App\Models\PasswordReset;
use App\Models\User;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
     */

    use SendsPasswordResetEmails;

    public function __construct()
    {
        parent::__construct();
        $this->middleware('guest');
    }

    public function showLinkRequestForm()
    {
        $pageTitle = "Récupération Du Compte";
        return view($this->activeTemplate . 'user.auth.passwords.email', compact('pageTitle'));
    }

    public function sendResetCodeEmail(Request $request)
    {
        $request->validate([
            'value' => 'required',
        ]);
        $fieldType = $this->findFieldType();
        $user      = User::where($fieldType, $request->value)->first();

        if (!$user) {
            $notify[] = ['error', 'Aucun compte n\'a été trouvé avec ces informations'];
            return back()->withNotify($notify);
        }

        PasswordReset::where('email', $user->email)->delete();
        $code                 = verificationCode(6);
        $password             = new PasswordReset();
        $password->email      = $user->email;
        $password->token      = $code;
        $password->created_at = \Carbon\Carbon::now();
        $password->save();

        $userIpInfo      = getIpInfo();
        $userBrowserInfo = osBrowser();
        notify($user, 'PASS_RESET_CODE', [
            'code'             => $code,
            'operating_system' => @$userBrowserInfo['os_platform'],
            'browser'          => @$userBrowserInfo['browser'],
            'ip'               => @$userIpInfo['ip'],
            'time'             => @$userIpInfo['time'],
        ], ['email']);

        $email = $user->email;
        session()->put('pass_res_mail', $email);
        $notify[] = ['success', 'E-mail de réinitialisation du mot de passe envoyé avec succès'];
        return to_route('user.password.code.verify')->withNotify($notify);
    }

    public function findFieldType()
    {
        $input = request()->input('value');

        $fieldType = filter_var($input, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
        request()->merge([$fieldType => $input]);
        return $fieldType;
    }

    public function codeVerify()
    {
        $pageTitle = 'Verifié Email';
        $email     = session()->get('pass_res_mail');

        if (!$email) {
            $notify[] = ['error', 'Oops! la session a expiré'];
            return to_route('user.password.request')->withNotify($notify);
        }

        return view($this->activeTemplate . 'user.auth.passwords.code_verify', compact('pageTitle', 'email'));
    }

    public function verifyCode(Request $request)
    {
        $request->validate([
            'code'  => 'required',
            'email' => 'required',
        ]);
        $code = str_replace(' ', '', $request->code);

        if (PasswordReset::where('token', $code)->where('email', $request->email)->count() != 1) {
            $notify[] = ['error', 'Le code de vérification ne correspond pas'];
            return to_route('user.password.request')->withNotify($notify);
        }

        $notify[] = ['success', 'Vous pouvez changer votre mot de passe.'];
        session()->flash('fpass_email', $request->email);
        return to_route('user.password.reset', $code)->withNotify($notify);
    }
}
