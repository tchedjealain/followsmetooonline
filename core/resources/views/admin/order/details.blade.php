@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card b-radius--10 mb-4">
                <div class="card--body">
                    <form action="{{ route('admin.orders.update', $order->id) }}" method="post">
                        @csrf
                        <div class="card-body p-0">
                            <div class="table-responsive--sm table-responsive">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th>@lang('Order ID')</th>
                                            <td class="text-start">{{ $order->id }}</td>
                                        </tr>
                                        <tr>
                                            <th>@lang('User')</th>
                                            <td class="text-start">
                                                <a href="{{ route('admin.users.detail', $order->user_id) }}">
                                                    {{ __($order->user->username) }}
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>@lang('Catégorie')</th>
                                            <td class="text-start">
                                                {{ __($order->category->name) }}
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>@lang('Service')</th>
                                            <td class="text-start">
                                                {{ __($order->service->name) }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>@lang('Lien')</th>
                                            <td class="text-start">
                                                <a href="{{ empty(parse_url($order->link, PHP_URL_SCHEME)) ? 'https://' : null }}{{ $order->link }}"
                                                    target="_blank">{{ $order->link }}
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>@lang('Quantité')</th>
                                            <td class="text-start">{{ $order->quantity }}</td>
                                        </tr>
                                        <tr>
                                            <th>@lang('Compteur De Démarrage')</th>
                                            <td class="text-start">
                                                @if ($order->status == Status::ORDER_PENDING || $order->status == Status::ORDER_PROCESSING)
                                                    <input type="text" name="start_count" max="{{ $order->quantity }}"
                                                        value="{{ $order->start_counter }}" class="form-control" required>
                                                @else
                                                    {{ $order->start_counter }}
                                                @endif
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>@lang('Restes')</th>
                                            <td class="text-start">{{ $order->remain }}
                                            </td>
                                        </tr>

                                        @if ($order->api_order)
                                            <tr>
                                                <td>@lang('Commande API')</td>
                                                <td class="text-start">
                                                    @if ($order->api_order)
                                                        <span class="badge  badge--primary">@lang('Oui')</span>
                                                    @endif
                                                </td>
                                            </tr>
                                            @if ($order->order_placed_to_api)
                                                <tr>
                                                    <td>@lang('Identifiant de commande API')</td>
                                                    <td class="text-start">
                                                        <strong>{{ @$order->api_order_id }}</strong>
                                                    </td>
                                                </tr>
                                            @endif
                                            <tr>
                                                <td>@lang('Commande passée à l\'API')</td>
                                                <td class="text-start">
                                                    @if ($order->order_placed_to_api)
                                                        <span class="badge  badge--primary">@lang('Oui')</span>
                                                    @else
                                                        <span class="badge  badge--danger">@lang('Non')</span>
                                                    @endif
                                                </td>
                                            </tr>
                                        @endif

                                        <tr>
                                            <th>@lang('Status')</th>
                                            <td class="text-start">
                                                @if ($order->status == Status::ORDER_PENDING || $order->status == Status::ORDER_PROCESSING)
                                                    <select class="form-control" name="status" required>
                                                        <option>@lang('Sélectionnez Le Statut')</option>
                                                        <option value="0" @selected($order->status == Status::ORDER_PENDING)>
                                                            @lang('En Attente')</option>
                                                        <option value="1" @selected($order->status == Status::ORDER_PROCESSING)>
                                                            @lang('Encour')</option>
                                                        <option value="2" @selected($order->status == Status::ORDER_COMPLETED)>
                                                            @lang('Terminé')</option>
                                                        <option value="3" @selected($order->status == Status::ORDER_CANCELLED)>
                                                            @lang('Annulé')</option>
                                                        <option value="4" @selected($order->status == Status::ORDER_REFUNDED)>
                                                            @lang('Retourné')</option>
                                                    </select>
                                                @elseif($order->status == Status::ORDER_COMPLETED)
                                                    <span class="badge  badge--success">@lang('Terminé')</span>
                                                @elseif($order->status == Status::ORDER_CANCELLED)
                                                    <span class="badge  badge--danger">@lang('Annulé')</span>
                                                @else
                                                    <span class="badge  badge--dark">@lang('Retourné')</span>
                                                @endif
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        @if ($order->status == Status::ORDER_PENDING || $order->status == Status::ORDER_PROCESSING)
                            <div class="card-footer">
                                <button type="submit" class="btn btn--primary w-100 h-45 ">@lang('Soumettre')</button>
                            </div>
                        @endif
                    </form>
                </div>
            </div><!-- card end -->
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <x-back route="{{ url()->previous() }}" />
@endpush
