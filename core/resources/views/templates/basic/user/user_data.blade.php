@extends($activeTemplate . 'layouts.frontend')
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-7 col-xl-6 p-5">

            <div class="register-form-area common-form-style bg-one create-account">
                <form method="POST" action="{{ route('user.data.submit') }}">
                    <h2 class="register-form-area__title mb-4">{{ __($pageTitle) }}</h2>
                    @csrf
                    <div class="row">
                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label">@lang('Nom')</label>
                            <input type="text" class="form--control" name="firstname" value="{{ old('firstname') }}"
                                placeholder="@lang('Nom')" required>
                        </div>

                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label">@lang('Prénom')</label>
                            <input type="text" class="form--control" name="lastname"
                                value="{{ old('lastname') }}"placeholder="@lang('Prénom')" required>
                        </div>
                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label">@lang('Adresse')</label>
                            <input type="text" class="form--control" name="address"
                                value="{{ old('address') }}"placeholder="@lang('Adresse')">
                        </div>
                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label">@lang('Région')</label>
                            <input type="text" class="form--control" name="state"
                                value="{{ old('state') }}"placeholder="@lang('Région')">
                        </div>
                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label">@lang('Code Postal')</label>
                            <input type="text" class="form--control" name="zip"
                                value="{{ old('zip') }}"placeholder="@lang('Code Postal')">
                        </div>

                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label">@lang('Ville')</label>
                            <input type="text" class="form--control" name="city"
                                value="{{ old('city') }}"placeholder="@lang('Ville')">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn--base w-100">
                            @lang('Soumettre')
                        </button>
                    </div>
                </form>
            </div>

        </div>
    </div>
@endsection
