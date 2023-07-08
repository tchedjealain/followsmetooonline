@extends($activeTemplate . 'layouts.app')
@section('panel')
    <div class="row mb-none-30">

        @if (!auth()->user()->ts)
            <div class="col-md-6">
                <div class="card custom--card">
                    <div class="card-header">
                        <h5 class="card-title">@lang('Ajouter votre compte')</h5>
                    </div>

                    <div class="card-body">
                        <h6 class="mb-3">
                            @lang('Utilisez le code QR ou la clé de configuration de votre application Google Authenticator pour ajouter votre compte. ')
                        </h6>

                        <div class="form-group mx-auto text-center">
                            <img class="mx-auto" src="{{ $qrCodeUrl }}">
                        </div>

                        <div class="form-group">
                            <label class="form-label">@lang('Clé de configuration')</label>
                            <div class="input-group">
                                <input type="text" name="key" value="{{ $secret }}"
                                    class="form-control form--control referralURL" readonly>
                                <button type="button" class="input-group-text copytext" id="copyBoard"> <i
                                        class="fa fa-copy"></i> </button>
                            </div>
                        </div>

                        <label><i class="fa fa-info-circle"></i> @lang('Aide')</label>
                        <p>@lang('Google Authenticator est une application multifactorielle pour les appareils mobiles. Il génère des codes temporisés utilisés lors du processus de vérification en 2 étapes. Pour utiliser Google Authenticator, installez l\'application Google Authenticator sur votre appareil mobile.') <a class="text--base"
                                href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=en"
                                target="_blank">@lang('Télécharger l\'App')</a></p>
                    </div>
                </div>
            </div>
        @endif

        <div class="col-md-6">

            @if (auth()->user()->ts)
                <div class="card custom--card">
                    <div class="card-header">
                        <h5 class="card-title">@lang('Désactiver la sécurité 2FA')</h5>
                    </div>
                    <form action="{{ route('user.twofactor.disable') }}" method="POST">
                        <div class="card-body">
                            @csrf
                            <input type="hidden" name="key" value="{{ $secret }}">
                            <div class="form-group">
                                <label class="form-label">@lang('OTP de l\'authentificateur Google')</label>
                                <input type="text" class="form-control form--control" name="code" required>
                            </div>
                            <button type="submit" class="btn btn--primary w-100">@lang('Soumettre')</button>
                        </div>
                    </form>
                </div>
            @else
                <div class="card custom--card">
                    <div class="card-header">
                        <h5 class="card-title">@lang('Activer la sécurité 2FA')</h5>
                    </div>
                    <form action="{{ route('user.twofactor.enable') }}" method="POST">
                        <div class="card-body">
                            @csrf
                            <input type="hidden" name="key" value="{{ $secret }}">
                            <div class="form-group">
                                <label class="form-label">@lang('OTP de l\'authentificateur Google')</label>
                                <input type="text" class="form-control form--control" name="code" required>
                            </div>
                            <button type="submit" class="btn btn--primary w-100">@lang('Soumettre')</button>
                        </div>
                    </form>
                </div>
            @endif
        </div>
    </div>
@endsection
@push('script')
    <script>
        (function($) {
            "use strict";
            $('#copyBoard').click(function() {
                var copyText = document.getElementsByClassName("referralURL");
                copyText = copyText[0];
                copyText.select();
                copyText.setSelectionRange(0, 99999);
                /*For mobile devices*/
                document.execCommand("copy");
                copyText.blur();
                this.classList.add('copied');
                setTimeout(() => this.classList.remove('copied'), 1500);
            });
        })(jQuery);
    </script>
@endpush
