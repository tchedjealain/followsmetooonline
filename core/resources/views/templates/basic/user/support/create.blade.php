@extends($activeTemplate . 'layouts.app')
@section('panel')
    <div class="row">
        <div class="col-md-12">
            <div class="card custom--card">
                <div class="card-body">
                    <form action="{{ route('ticket.store') }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label class="form-label">@lang('Nom')</label>
                                <input type="text" name="name"
                                    value="{{ @$user->firstname . ' ' . @$user->lastname }}"
                                    class="form-control form--control" required readonly>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="form-label">@lang('Adresse E-mail')</label>
                                <input type="email" name="email" value="{{ @$user->email }}"
                                    class="form-control form--control" required readonly>
                            </div>

                            <div class="form-group col-md-6">
                                <label class="form-label">@lang('Objet')</label>
                                <input type="text" name="subject" value="{{ old('subject') }}"
                                    class="form-control form--control" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="form-label">@lang('Priorité')</label>
                                <select name="priority" class="form-control form--control" required>
                                    <option value="3">@lang('Élevé')</option>
                                    <option value="2">@lang('Moyen')</option>
                                    <option value="1">@lang('Faible')</option>
                                </select>
                            </div>
                            <div class="col-12 form-group">
                                <label class="form-label">@lang('Message')</label>
                                <textarea name="message" id="inputMessage" rows="6" class="form-control form--control" required>{{ old('message') }}</textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="text-end">
                                <button type="button" class="btn btn--primary btn-sm addFile">
                                    <i class="las la-plus"></i> @lang('Ajouter nouveau')
                                </button>
                            </div>
                            <div class="file-upload">
                                <label class="form-label">@lang('Pièces jointes')</label> <small
                                    class="text--danger">@lang('Max 5 fichiers peuvent être téléchargés'). @lang('La taille maximale de téléchargement est')
                                    {{ ini_get('upload_max_filesize') }}</small>
                                <input type="file" name="attachments[]" id="inputAttachments"
                                    class="form-control form--control mb-2" />
                                <div id="fileUploadsContainer"></div>
                                <p class="ticket-attachments-message text-muted">
                                    @lang('Extensions de fichiers autorisées'): .@lang('jpg'), .@lang('jpeg'), .@lang('png'),
                                    .@lang('pdf'), .@lang('doc'), .@lang('docx')
                                </p>
                            </div>

                        </div>

                        <div class="form-group">
                            <button class="btn btn--primary w-100" type="submit">@lang('Soumettre')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <div class="d-flex flex-wrap justify-content-end gap-2 align-items-center">
        <x-back route="{{ route('ticket.index') }}" />
    </div>
@endpush

@push('style')
    <style>
        .input-group-text:focus {
            box-shadow: none !important;
        }
    </style>
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";
            var fileAdded = 0;
            $('.addFile').on('click', function() {
                if (fileAdded >= 4) {
                    notify('error', 'You\'ve added maximum number of file');
                    return false;
                }
                fileAdded++;
                $("#fileUploadsContainer").append(`
                    <div class="input-group my-3">
                        <input type="file" name="attachments[]" class="form-control form--control" required />
                        <button type="button" class="input-group-text btn--danger remove-btn"><i class="las la-times"></i></button>
                    </div>
                `)
            });
            $(document).on('click', '.remove-btn', function() {
                fileAdded--;
                $(this).closest('.input-group').remove();
            });
        })(jQuery);
    </script>
@endpush
