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
            <div class="container ">
                <div class="d-flex justify-content-center">
                    <div class="verification-code-wrapper verify-form">
                        <div class="verification-area">
                            <form action="{{ route('user.verify.mobile') }}" method="POST" class="submit-form">
                                @csrf
                                <p class="verification-text">@lang('Un code de vérification à 6 chiffres à été envoyé à votre numéro de téléphone') :
                                    +{{ showMobileNumber(auth()->user()->mobile) }}</p>

                                @include($activeTemplate . 'partials.verification_code')

                                <div class="mb-3">
                                    <button type="submit" class="btn btn--base w-100">@lang('Soumettre')</button>
                                </div>

                                <div class="mb-3">
                                    <p>
                                        @lang('Si vous ne recevez aucun code'), <a href="{{ route('user.send.verify.code', 'email') }}"
                                            class="text--base">
                                            @lang('Essayer à nouveau')</a>
                                    </p>

                                    @if ($errors->has('resend'))
                                        <small class="text-danger d-block">{{ $errors->first('resend') }}</small>
                                    @endif
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
