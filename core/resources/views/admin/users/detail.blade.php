@extends('admin.layouts.app')

@section('panel')
    <div class="row">
        <div class="col-12">
            <div class="row gy-4">
                <div class="col-xxl-3 col-sm-6">
                    <div class="widget-two style--two box--shadow2 b-radius--5 bg--19">
                        <div class="widget-two__icon b-radius--5 bg--primary">
                            <i class="las la-money-bill-wave-alt"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3 class="text-white">{{ $general->cur_sym }}{{ showAmount($user->balance) }}</h3>
                            <p class="text-white">@lang('Solde')</p>
                        </div>
                        <a href="{{ route('admin.report.transaction') }}?search={{ $user->username }}"
                            class="widget-two__btn">@lang('Voir Tout')</a>
                    </div>
                </div>
                <!-- dashboard-w1 end -->


                <div class="col-xxl-3 col-sm-6">
                    <div class="widget-two style--two box--shadow2 b-radius--5 bg--primary">
                        <div class="widget-two__icon b-radius--5 bg--primary">
                            <i class="las la-wallet"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3 class="text-white">{{ $general->cur_sym }}{{ showAmount($totalDeposit) }}</h3>
                            <p class="text-white">@lang('Dépôts')</p>
                        </div>
                        <a href="{{ route('admin.deposit.list') }}?search={{ $user->username }}"
                            class="widget-two__btn">@lang('Voir Tout')</a>
                    </div>
                </div>
                <!-- dashboard-w1 end -->

                <div class="col-xxl-3 col-sm-6">
                    <div class="widget-two style--two box--shadow2 b-radius--5 bg--1">
                        <div class="widget-two__icon b-radius--5 bg--primary">
                            <i class="fas fa-wallet"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3 class="text-white">{{ $general->cur_sym }}{{ showAmount($totalSpent) }}</h3>
                            <p class="text-white">@lang('Dépense Totale')</p>
                        </div>
                        <a href="{{ route('admin.report.transaction') }}?search={{ $user->username }}&remark=order"
                            class="widget-two__btn">@lang('Voir Tout')</a>
                    </div>
                </div>
                <!-- dashboard-w1 end -->

                <div class="col-xxl-3 col-sm-6">
                    <div class="widget-two style--two box--shadow2 b-radius--5 bg--17">
                        <div class="widget-two__icon b-radius--5 bg--primary">
                            <i class="las la-exchange-alt"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3 class="text-white">{{ $totalTransaction }}</h3>
                            <p class="text-white">@lang('Transactions')</p>
                        </div>
                        <a href="{{ route('admin.report.transaction') }}?search={{ $user->username }}"
                            class="widget-two__btn">@lang('Voir Tout')</a>
                    </div>
                </div>
                <!-- dashboard-w1 end -->
            </div>
            <div class="row gy-4 mt-2">
                <div class="col-xxl-4 col-sm-6">
                    <div class="widget-two  box--shadow2 b-radius--5 bg--white">
                        <i class="las la-shopping-cart overlay-icon text--primary"></i>
                        <div class="widget-two__icon b-radius--5 bg--primary">
                            <i class="las la-shopping-cart"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3>{{ $widget['total_order'] }}</h3>
                            <p>@lang('Commande Totale')</p>
                        </div>
                        <a href="{{ route('admin.orders.index') }}?search={{ $user->username }}"
                            class="widget-two__btn border border--primary btn-outline--primary">@lang('Voir Tout')</a>
                    </div>
                </div><!-- dashboard-w1 end -->
                <div class="col-xxl-4 col-sm-6">
                    <div class="widget-two  box--shadow2 b-radius--5  bg--white">
                        <i class="las la-spinner overlay-icon text--warning"></i>
                        <div class="widget-two__icon b-radius--5 bg--warning">
                            <i class="las la-spinner"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3>{{ $widget['pending_order'] }}</h3>
                            <p>@lang('Commande En Attente')</p>
                        </div>
                        <a href="{{ route('admin.orders.pending') }}?search={{ $user->username }}"
                            class="widget-two__btn border border--warning btn-outline--warning">@lang('Voir Tout')</a>
                    </div>
                </div><!-- dashboard-w1 end -->
                <div class="col-xxl-4 col-sm-6">
                    <div class="widget-two  box--shadow2 b-radius--5 bg--white">
                        <i class="la la-refresh overlay-icon text--teal"></i>
                        <div class="widget-two__icon b-radius--5 bg--teal">
                            <i class="la la-refresh"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3>{{ $widget['processing_order'] }}</h3>
                            <p>@lang('Commande Encours')</p>
                        </div>
                        <a href="{{ route('admin.orders.processing') }}?search={{ $user->username }}"
                            class="widget-two__btn border border--success btn-outline--success">@lang('Voir Tout')</a>
                    </div>
                </div><!-- dashboard-w1 end -->

            </div><!-- row end-->

            <div class="row gy-4 mt-2">
                <div class="col-xxl-4 col-sm-6">
                    <div class="widget-two  box--shadow2 b-radius--5 bg--white">
                        <i class="las la-check-circle overlay-icon text--green"></i>
                        <div class="widget-two__icon b-radius--5 bg--green">
                            <i class="las la-check-circle"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3>{{ $widget['completed_order'] }}</h3>
                            <p>@lang('Commande Terminée')</p>
                        </div>
                        <a href="{{ route('admin.orders.completed') }}?search={{ $user->username }}"
                            class="widget-two__btn border border--success btn-outline--success">@lang('Voir Tout')</a>
                    </div>
                </div><!-- dashboard-w1 end -->
                <div class="col-xxl-4 col-sm-6">
                    <div class="widget-two  box--shadow2 b-radius--5 bg--white">
                        <i class="las la-times-circle overlay-icon text--dnager"></i>
                        <div class="widget-two__icon b-radius--5 bg--danger">
                            <i class="las la-times-circle"></i>
                        </div>
                        <div class="widget-two__content">
                            <h3>{{ $widget['cancelled_order'] }}</h3>
                            <p>@lang('Commande Annulée')</p>
                        </div>
                        <a href="{{ route('admin.orders.cancelled') }}?search={{ $user->username }}"
                            class="widget-two__btn border border--danger btn-outline--danger">@lang('Voir Tout')</a>
                    </div>
                </div><!-- dashboard-w1 end -->
                <div class="col-xxl-4 col-sm-6">
                    <div class="widget-two  box--shadow2 b-radius--5 bg--white">
                        <i class="la la-fast-backward  overlay-icon text-secondary"></i>
                        <div class="widget-two__icon b-radius--5 bg--secondary">
                            <i class="la la-fast-backward "></i>
                        </div>
                        <div class="widget-two__content">
                            <h3>{{ $widget['refunded_order'] }}</h3>
                            <p>@lang('Commande Retournée')</p>
                        </div>
                        <a href="{{ route('admin.orders.refunded') }}?search={{ $user->username }}"
                            class="widget-two__btn border border--secondary btn-outline--secondary">@lang('Voir Tout')</a>
                    </div>
                </div><!-- dashboard-w1 end -->
            </div>



            <div class="d-flex flex-wrap gap-3 mt-4">
                <div class="flex-fill">
                    <button data-bs-toggle="modal" data-bs-target="#addSubModal"
                        class="btn btn--success btn--shadow w-100 btn-lg bal-btn" data-act="add">
                        <i class="las la-plus-circle"></i> @lang('Solde')
                    </button>
                </div>

                <div class="flex-fill">
                    <button data-bs-toggle="modal" data-bs-target="#addSubModal"
                        class="btn btn--danger btn--shadow w-100 btn-lg bal-btn" data-act="sub">
                        <i class="las la-minus-circle"></i> @lang('Solde')
                    </button>
                </div>

                <div class="flex-fill">
                    <a href="{{ route('admin.report.login.history') }}?search={{ $user->username }}"
                        class="btn btn--primary btn--shadow w-100 btn-lg">
                        <i class="las la-list-alt"></i>@lang('Connexions')
                    </a>
                </div>

                <div class="flex-fill">
                    <a href="{{ route('admin.users.notification.log', $user->id) }}"
                        class="btn btn--secondary btn--shadow w-100 btn-lg">
                        <i class="las la-bell"></i>@lang('Notifications')
                    </a>
                </div>

                <div class="flex-fill">
                    <a href="{{ route('admin.users.login', $user->id) }}" target="_blank"
                        class="btn btn--primary btn--gradi btn--shadow w-100 btn-lg">
                        <i class="las la-sign-in-alt"></i>@lang('Connectez-vous en tant qu\'utilisateur')
                    </a>
                </div>


                <div class="flex-fill">
                    @if ($user->status == Status::USER_ACTIVE)
                        <button type="button" class="btn btn--warning btn--gradi btn--shadow w-100 btn-lg userStatus"
                            data-bs-toggle="modal" data-bs-target="#userStatusModal">
                            <i class="las la-ban"></i>@lang('Utilisateur Banni')
                        </button>
                    @else
                        <button type="button" class="btn btn--success btn--gradi btn--shadow w-100 btn-lg userStatus"
                            data-bs-toggle="modal" data-bs-target="#userStatusModal">
                            <i class="las la-undo"></i>@lang('Utilisateur débannir')
                        </button>
                    @endif
                </div>
            </div>


            <div class="card mt-30">
                <div class="card-header">
                    <h5 class="card-title mb-0">@lang('Information de') {{ $user->fullname }}</h5>
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.users.update', [$user->id]) }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label>@lang('Nom')</label>
                                    <input class="form-control" type="text" name="firstname" required
                                        value="{{ $user->firstname }}">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-control-label">@lang('Prénom')</label>
                                    <input class="form-control" type="text" name="lastname" required
                                        value="{{ $user->lastname }}">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Email') </label>
                                    <input class="form-control" type="email" name="email"
                                        value="{{ $user->email }}" required>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>@lang('Numéro Téléphone') </label>
                                    <div class="input-group ">
                                        <span class="input-group-text mobile-code"></span>
                                        <input type="number" name="mobile" value="{{ old('mobile') }}" id="mobile"
                                            class="form-control checkUser" required>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row mt-4">
                            <div class="col-md-12">
                                <div class="form-group ">
                                    <label>@lang('Adresse')</label>
                                    <input class="form-control" type="text" name="address"
                                        value="{{ @$user->address->address }}">
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="form-group">
                                    <label>@lang('Ville')</label>
                                    <input class="form-control" type="text" name="city"
                                        value="{{ @$user->address->city }}">
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="form-group ">
                                    <label>@lang('Région')</label>
                                    <input class="form-control" type="text" name="state"
                                        value="{{ @$user->address->state }}">
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="form-group ">
                                    <label>@lang('Code Postal')</label>
                                    <input class="form-control" type="text" name="zip"
                                        value="{{ @$user->address->zip }}">
                                </div>
                            </div>

                            <div class="col-xl-3 col-md-6">
                                <div class="form-group ">
                                    <label>@lang('Pays')</label>
                                    <select name="country" class="form-control">
                                        @foreach ($countries as $key => $country)
                                            <option data-mobile_code="{{ $country->dial_code }}"
                                                value="{{ $key }}">{{ __($country->country) }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="form-group  col-xl-4 col-md-6 col-12">
                                <label>@lang('Email Vérification')</label>
                                <input type="checkbox" data-width="100%" data-onstyle="-success" data-offstyle="-danger"
                                    data-bs-toggle="toggle" data-on="@lang('Vérifié')" data-off="@lang('Non Vérifié')"
                                    name="ev" @if ($user->ev) checked @endif>

                            </div>

                            <div class="form-group  col-xl-4 col-md-6 col-12">
                                <label>@lang('Mobile Vérification')</label>
                                <input type="checkbox" data-width="100%" data-onstyle="-success" data-offstyle="-danger"
                                    data-bs-toggle="toggle" data-on="@lang('Vérifié')" data-off="@lang('Non Vérifié')"
                                    name="sv" @if ($user->sv) checked @endif>

                            </div>
                            <div class="form-group col-xl-4 col-md- col-12">
                                <label>@lang('2FA Vérification') </label>
                                <input type="checkbox" data-width="100%" data-height="50" data-onstyle="-success"
                                    data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('Activer')"
                                    data-off="@lang('Désactiver')" name="ts"
                                    @if ($user->ts) checked @endif>
                            </div>

                        </div>


                        <div class="row mt-4">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <button type="submit" class="btn btn--primary w-100 h-45">@lang('Soumettre')
                                    </button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>



    {{-- Add Sub Balance MODAL --}}
    <div id="addSubModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><span class="type"></span> <span>@lang('Solde')</span></h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.users.add.sub.balance', $user->id) }}" method="POST">
                    @csrf
                    <input type="hidden" name="act">
                    <div class="modal-body">
                        <div class="form-group">
                            <label>@lang('Montant')</label>
                            <div class="input-group">
                                <input type="number" step="any" name="amount" class="form-control"
                                    placeholder="@lang('Veuillez fournir un montant positi')" required>
                                <div class="input-group-text">{{ __($general->cur_text) }}</div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>@lang('Remarque')</label>
                            <textarea class="form-control" placeholder="@lang('Remarque')" name="remark" rows="4" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary h-45 w-100">@lang('Soumettre')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div id="userStatusModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        @if ($user->status == Status::USER_ACTIVE)
                            <span>@lang('Utilisateur Banni')</span>
                        @else
                            <span>@lang('Utilisateur débannir')</span>
                        @endif
                    </h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.users.status', $user->id) }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        @if ($user->status == 1)
                            <h6 class="mb-2">@lang('Si vous bannissez cet utilisateur, il ne pourra pas accéder à son tableau de bord.')</h6>
                            <div class="form-group">
                                <label>@lang('Raison')</label>
                                <textarea class="form-control" name="reason" rows="4" required></textarea>
                            </div>
                        @else
                            <p><span>@lang('La raison de du banissement était'):</span></p>
                            <p>{{ $user->ban_reason }}</p>
                            <h4 class="text-center mt-3">@lang('Êtes-vous sûr de débannir cet utilisateur ?')</h4>
                        @endif
                    </div>
                    <div class="modal-footer">
                        @if ($user->status == Status::USER_ACTIVE)
                            <button type="submit" class="btn btn--primary h-45 w-100">@lang('Soumettre')</button>
                        @else
                            <button type="button" class="btn btn--dark"
                                data-bs-dismiss="modal">@lang('Non')</button>
                            <button type="submit" class="btn btn--primary">@lang('Oui')</button>
                        @endif
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection


@push('script')
    <script>
        (function($) {
            "use strict"
            $('.bal-btn').click(function() {
                var act = $(this).data('act');
                $('#addSubModal').find('input[name=act]').val(act);
                if (act == 'add') {
                    $('.type').text('Add');
                } else {
                    $('.type').text('Subtract');
                }
            });
            let mobileElement = $('.mobile-code');
            $('select[name=country]').change(function() {
                mobileElement.text(`+${$('select[name=country] :selected').data('mobile_code')}`);
            });

            $('select[name=country]').val('{{ @$user->country_code }}');
            let dialCode = $('select[name=country] :selected').data('mobile_code');
            let mobileNumber = `{{ $user->mobile }}`;
            mobileNumber = mobileNumber.replace(dialCode, '');
            $('input[name=mobile]').val(mobileNumber);
            mobileElement.text(`+${dialCode}`);

        })(jQuery);
    </script>
@endpush
