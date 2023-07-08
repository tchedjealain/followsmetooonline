<div class="modal fade" id="formGenerateModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">@lang('Générer un formulaire')</h5>
          <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
              <i class="las la-times"></i>
          </button>
        </div>
        <form class="{{ $formClassName ?? 'generate-form' }}">
            @csrf
              <div class="modal-body">
                <input type="hidden" name="update_id" value="">
                <div class="form-group">
                    <label>@lang('Type de formulaire')</label>
                    <select name="form_type" class="form-control" required>
                        <option value="">@lang('Sélectionnez une option')</option>
                        <option value="text">@lang('Texte')</option>
                        <option value="textarea">@lang('Zone de texte')</option>
                        <option value="select">@lang('Sélectionner')</option>
                        <option value="checkbox">@lang('Case à cocher')</option>
                        <option value="radio">@lang('Bouton radio')</option>
                        <option value="file">@lang('Fichier')</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>@lang('Obligatoire')</label>
                    <select name="is_required" class="form-control" required>
                        <option value="">@lang('Sélectionnez une option')</option>
                        <option value="required">@lang('Obligatoire')</option>
                        <option value="optional">@lang('Optionnel')</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>@lang('Étiquette du formulaire')</label>
                    <input type="text" name="form_label" class="form-control" required>
                </div>
                <div class="form-group extra_area">

                </div>
              </div>
              <div class="modal-footer">
                  <button type="submit" class="btn btn--primary w-100 h-45 generatorSubmit">@lang('Ajouter')</button>
              </div>
          </form>
      </div>
    </div>
</div>


@push('script-lib')
<script src="{{ asset('assets/global/js/form_generator.js') }}"></script>
@endpush
