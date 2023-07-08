@extends($activeTemplate . 'layouts.frontend')
@section('content')
    <section class="register-section ptb-80">
        <div class="register-element-one">
            <img src="{{ asset($activeTemplateTrue . 'images/round.png') }}" alt="@lang('shape')">
        </div>
        <div class="container">
            <figure class="figure highlight-background highlight-background--lean-left">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1439px"
                    height="480px">
                    <defs>
                        <linearGradient id="PSgrad_1" x1="42.262%" x2="0%" y1="90.631%" y2="0%">
                            <stop offset="28%" stop-color="rgb(245,246,252)" stop-opacity="1" />
                            <stop offset="100%" stop-color="rgb(255,255,255)" stop-opacity="1" />
                        </linearGradient>

                    </defs>
                    <path fill-rule="evenodd" fill="rgb(255, 255, 255)"
                        d="M863.247,-271.203 L-345.788,-427.818 L760.770,642.200 L1969.805,798.815 L863.247,-271.203 Z" />
                    <path fill="url(#PSgrad_1)"
                        d="M863.247,-271.203 L-345.788,-427.818 L760.770,642.200 L1969.805,798.815 L863.247,-271.203 Z" />
                </svg>
            </figure>
            <div class="col-md-6 offset-3">
                <div class="common-form-style bg-one">
                    <div class="mb-4">
                        <h4>@lang('Votre compte est vérifié avec succès. Vous pouvez maintenant changer votre mot de passe. Veuillez entrer un mot de passe fort et ne le partagez avec personne.')</h4>
                    </div>
                    <form method="POST" action="{{ route('user.password.update') }}">
                        @csrf
                        <input type="hidden" name="email" value="{{ $email }}">
                        <input type="hidden" name="token" value="{{ $token }}">
                        <div class="form-group mb-3">
                            <label class="form-label">@lang('Mot De Passe')</label>
                            <input type="password" class="form-control form--control" name="password"
                                placeholder="@lang('Mot De Passe')" required>
                            @if ($general->secure_password)
                                <div class="input-popup">
                                    <p class="error lower">@lang('1 lettre minuscule minimum')</p>
                                    <p class="error capital">@lang('1 majuscule minimum')</p>
                                    <p class="error number">@lang('1 numéro minimum')</p>
                                    <p class="error special">@lang('1 caractère spécial minimum')</p>
                                    <p class="error minimum">@lang('Mot de passe à 6 caractères')</p>
                                </div>
                            @endif
                        </div>
                        <div class="form-group mb-3">
                            <label class="form-label">@lang('Confirmer le Mot De Passe')</label>
                            <input type="password" class="form-control form--control" placeholder="@lang('Confirmer le Mot De Passe')"
                                name="password_confirmation" required>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn--base w-100"> @lang('Soumettre')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
@endsection

@if ($general->secure_password)
    @push('script-lib')
        <script src="{{ asset('assets/global/js/secure_password.js') }}"></script>
    @endpush
@endif
