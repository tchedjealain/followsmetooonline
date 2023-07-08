@extends('admin.layouts.master')
@section('content')
    <div class="login-main" style="background-image: url('{{ asset('assets/viseradmin/images/login.jpg') }}')">
        <div class="custom-container container">
            <div class="row justify-content-center">
                <div class="col-xxl-5 col-xl-5 col-lg-6 col-md-8 col-sm-11">
                    <div class="login-area">
                        <div class="login-wrapper">
                            <div class="login-wrapper__top">
                                <h3 class="title text-white">@lang('Bienvenue') <strong>{{ __($general->site_name) }}</strong>
                                </h3>
                                <p class="text-white">{{ __($pageTitle) }} @lang('sur') {{ __($general->site_name) }}
                                    @lang('Tableau De Bord')</p>
                            </div>
                            <div class="login-wrapper__body">
                                <form class="cmn-form mt-30 verify-gcaptcha login-form" action="{{ route('admin.login') }}" method="POST">
                                    @csrf
                                    <div class="form-group">
                                        <label>@lang('Nom D\'utilisateur')</label>
                                        <input class="form-control" name="username" type="text" value="{{ old('username') }}" required>
                                    </div>
                                    <div class="form-group">
                                        <label>@lang('Mot De Passe')</label>
                                        <input class="form-control" name="password" type="password" required>
                                    </div>
                                    <x-captcha />
                                    <div class="d-flex justify-content-between flex-wrap">
                                        <div class="form-check me-3">
                                            <input class="form-check-input" id="remember" name="remember" type="checkbox">
                                            <label class="form-check-label" for="remember">@lang('Se Souvenir De Moi')</label>
                                        </div>
                                        <a class="forget-text" href="{{ route('admin.password.reset') }}">@lang('Mot De Passe Oublié ?')</a>
                                    </div>
                                    <button class="btn cmn-btn w-100" type="submit">@lang('CONNEXION')</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
