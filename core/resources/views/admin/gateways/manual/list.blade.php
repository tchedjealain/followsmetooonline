@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light style--two custom-data-table">
                            <thead>
                                <tr>
                                    <th>@lang('Passerelle')</th>
                                    <th>@lang('Status')</th>
                                    <th>@lang('Action')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($gateways as $gateway)
                                    <tr>
                                        <td>{{ __($gateway->name) }}</td>
                                        <td>
                                            @php
                                                echo $gateway->statusBadge;
                                            @endphp
                                        </td>
                                        <td>
                                            <div class="button--group">
                                                <a href="{{ route('admin.gateway.manual.edit', $gateway->alias) }}"
                                                    class="btn btn-sm btn-outline--primary editGatewayBtn">
                                                    <i class="la la-pencil"></i> @lang('Modifier')
                                                </a>

                                                @if ($gateway->status == Status::DISABLE)
                                                    <button class="btn btn-sm btn-outline--success confirmationBtn"
                                                        data-question="@lang('Êtes-vous sûr de vouloir activé cette passerelle ?')"
                                                        data-action="{{ route('admin.gateway.manual.status', $gateway->id) }}">
                                                        <i class="la la-eye"></i> @lang('Activer')
                                                    </button>
                                                @else
                                                    <button class="btn btn-sm btn-outline--danger confirmationBtn"
                                                        data-question="@lang('Êtes-vous sûr de vouloir activé cette passerelle ?')"
                                                        data-action="{{ route('admin.gateway.manual.status', $gateway->id) }}">
                                                        <i class="la la-eye-slash"></i> @lang('Désactiver')
                                                    </button>
                                                @endif
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                                    </tr>
                                @endforelse

                            </tbody>
                        </table><!-- table end -->
                    </div>
                </div>
            </div><!-- card end -->
        </div>
    </div>
    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <a class="btn btn-outline--primary" href="{{ route('admin.gateway.manual.create') }}"><i
            class="las la-plus"></i>@lang('Ajouter Nouveau')</a>
    <div class="input-group w-auto search-form">
        <input type="text" name="search_table" class="form-control bg--white" placeholder="@lang('Recherche')...">
        <button class="btn btn--primary input-group-text"><i class="fa fa-search"></i></button>
    </div>
@endpush
