<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Rules\FileTypeValidate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class ProfileController extends Controller
{
    public function profile()
    {
        $pageTitle = "Réglage Du Profil";
        $user      = auth()->user();
        return view($this->activeTemplate . 'user.profile_setting', compact('pageTitle', 'user'));
    }

    public function submitProfile(Request $request)
    {

        $request->validate([
            'firstname' => 'required|string',
            'lastname'  => 'required|string',
            'image'     => ['nullable', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
        ], [
            'firstname.required' => 'Le Champ nom est obligatoire',
            'lastname.required'  => 'Le champ prénom est obligatoire',
        ]);

        $user = auth()->user();

        if ($request->hasFile('image')) {
            try {
                $old         = $user->image;
                $user->image = fileUploader($request->image, getFilePath('userProfile'), getFileSize('userProfile'), $old);
            } catch (\Exception $exp) {
                $notify[] = ['error', 'Impossible de télécharger votre image'];
                return back()->withNotify($notify);
            }
        }

        $user->firstname = $request->firstname;
        $user->lastname  = $request->lastname;
        $user->address   = [
            'address' => $request->address,
            'state'   => $request->state,
            'zip'     => $request->zip,
            'city'    => $request->city,
        ];

        $user->save();
        $notify[] = ['success', 'Mise à jour du profil réussie'];
        return back()->withNotify($notify);
    }

    public function changePassword()
    {
        $pageTitle = 'Changer Le Mot De Passe';
        $user      = auth()->user();
        return view($this->activeTemplate . 'user.password', compact('pageTitle', 'user'));
    }

    public function submitPassword(Request $request)
    {

        $passwordValidation = Password::min(6);
        $general            = gs();

        if ($general->secure_password) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }

        $this->validate($request, [
            'current_password' => 'required',
            'password'         => ['required', 'confirmed', $passwordValidation],
        ]);

        $user = auth()->user();

        if (Hash::check($request->current_password, $user->password)) {
            $password       = Hash::make($request->password);
            $user->password = $password;
            $user->save();
            $notify[] = ['success', 'Le mot de passe a été modifié avec succès'];
            return back()->withNotify($notify);
        } else {
            $notify[] = ['error', 'Le mot de passe ne correspond pas'];
            return back()->withNotify($notify);
        }
    }
}