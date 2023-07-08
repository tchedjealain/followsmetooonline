@extends($activeTemplate . 'layouts.app')
@section('panel')
    <div class="row justify-content-center">
        <div class="col-md-12">

            <div class="card b-dadius--10">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two">
                            <thead>
                                <tr>
                                    <th>@lang('Passerelle | Transaction')</th>
                                    <th class="text-center">@lang('Initié')</th>
                                    <th class="text-center">@lang('Montant')</th>
                                    <th class="text-center">@lang('Conversion')</th>
                                    <th class="text-center">@lang('Status')</th>
                                    <th>@lang('Détails')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse(@$deposits as $deposit)
                                    <tr>
                                        <td>
                                            <span class="fw-bold"> <span
                                                    class="text-primary">{{ __($deposit->gateway?->name) }}</span>
                                            </span>
                                            <br>
                                            <small> {{ $deposit->trx }} </small>
                                        </td>

                                        <td class="text-center">
                                            {{ showDateTime($deposit->created_at) }}<br>{{ diffForHumans($deposit->created_at) }}
                                        </td>
                                        <td class="text-center">
                                            {{ __($general->cur_sym) }}{{ showAmount($deposit->amount) }} + <span
                                                class="text--danger"
                                                title="@lang('frais')">{{ showAmount($deposit->charge) }} </span>
                                            <br>
                                            <strong title="@lang('Montant avec frais')">
                                                {{ showAmount($deposit->amount + $deposit->charge) }}
                                                {{ __($general->cur_text) }}
                                            </strong>
                                        </td>
                                        <td class="text-center">
                                            1 {{ __($general->cur_text) }} = {{ showAmount($deposit->rate) }}
                                            {{ __($deposit->method_currency) }}
                                            <br>
                                            <strong>{{ showAmount($deposit->final_amo) }}
                                                {{ __($deposit->method_currency) }}</strong>
                                        </td>
                                        <td class="text-center">
                                            @php echo $deposit->statusBadge @endphp
                                        </td>
                                        @php
                                            $details = $deposit->detail != null ? json_encode($deposit->detail) : null;
                                        @endphp

                                        <td>
                                            <button
                                                class="btn btn-sm btn-outline--primary @if ($deposit->method_code >= 1000) detailBtn @else disabled @endif"
                                                @if ($deposit->method_code >= 1000) data-info="{{ $details }}" @endif
                                                @if ($deposit->status == Status::PAYMENT_REJECT) data-admin_feedback="{{ $deposit->admin_feedback }}" @endif>
                                                <i class="fa fa-desktop"></i> Détails
                                            </button>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="100%" class="text-center">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
                @if ($deposits->hasPages())
                    <div class="card-footer">
                        {{ $deposits->links() }}
                    </div>
                @endif
            </div>
        </div>
    </div>

    {{-- APPROVE MODAL --}}
    <div id="detailModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Détails')</h5>
                    <span type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </span>
                </div>
                <div class="modal-body">
                    <ul class="list-group userData mb-2">
                    </ul>
                    <div class="feedback"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn--dark btn-sm" data-bs-dismiss="modal">@lang('Fermé')</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <x-search-form placeholder="Rechercher par Trx" />
    <a href="{{ route('user.deposit.index') }}" class="btn btn-outline--primary">
        <i class="las la-plus"></i>
        @lang('Recharger Votre Compte')
    </a>
@endpush
@push('script')
    <script>
        (function($) {
            "use strict";
            $('.detailBtn').on('click', function() {
                var modal = $('#detailModal');

                var userData = $(this).data('info');
                var html = '';
                if (userData) {
                    userData.forEach(element => {
                        if (element.type != 'file') {
                            html += `
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <span>${element.name}</span>
                                <span">${element.value}</span>
                            </li>`;
                        }
                    });
                }

                modal.find('.userData').html(html);

                if ($(this).data('admin_feedback') != undefined) {
                    var adminFeedback = `
                        <div class="my-3">
                            <strong>@lang('Admin Feedback')</strong>
                            <p>${$(this).data('admin_feedback')}</p>
                        </div>
                    `;
                } else {
                    var adminFeedback = '';
                }
                modal.find('.feedback').html(adminFeedback);
                modal.modal('show');
            });
        })(jQuery);
    </script>
@endpush
