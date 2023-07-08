@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <form method="post" action="{{ route('admin.service.store') }}">
                    @csrf
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label>@lang('Catégorie')</label>
                                <select class="form-control" name="category" id="category" required>
                                    <option selected>@lang('Sélectionnez-en un')...</option>
                                    @forelse($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @empty
                                    @endforelse
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="name">@lang('Nom') </label>
                                <input type="text" class="form-control " name="name" required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>@lang('Prix par 1k') </label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="price_per_k" required>
                                    <div class="input-group-text">{{ $general->cur_text }}</div>
                                </div>
                            </div>
                            <div class="form-group col-md-4">
                                <div class="form-group">
                                    <label>@lang('Min')</label>
                                    <input type="number" name="min" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group col-md-4">
                                <div class="form-group">
                                    <label>@lang('Max')</label>
                                    <input type="number" name="max" class="form-control" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>@lang('Détails')</label>
                            <textarea class="form-control" rows="5" name="details"></textarea>
                        </div>
                        <div class="form-group api_service_id">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary h-45 w-100">@lang('Soumettre')</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
@endsection
@push('breadcrumb-plugins')
    <x-back route="{{ route('admin.service.index') }}" />
@endpush
