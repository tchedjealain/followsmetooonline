@extends($activeTemplate . 'layouts.frontend')
@section('content')
    <div class="container">
        <div class="d-flex justify-content-center">
            <div class="verification-code-wrapper">
                <div class="verification-area">
                    <h5 class="pb-3 text-center border-bottom">@lang('Vérification 2FA')</h5>
                    <form action="{{ route('user.go2fa.verify') }}" method="POST" class="submit-form">
                        @csrf

                        @include($activeTemplate . 'partials.verification_code')

                        <div class="form--group">
                            <button type="submit" class="submit-btn btn-block  btn-lg w-100">@lang('Soumettre')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
