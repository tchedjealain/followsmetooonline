<div class="modal fade" id="formGenerateModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title"><?php echo app('translator')->get('Générer un formulaire'); ?></h5>
          <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
              <i class="las la-times"></i>
          </button>
        </div>
        <form class="<?php echo e($formClassName ?? 'generate-form'); ?>">
            <?php echo csrf_field(); ?>
              <div class="modal-body">
                <input type="hidden" name="update_id" value="">
                <div class="form-group">
                    <label><?php echo app('translator')->get('Type de formulaire'); ?></label>
                    <select name="form_type" class="form-control" required>
                        <option value=""><?php echo app('translator')->get('Sélectionnez une option'); ?></option>
                        <option value="text"><?php echo app('translator')->get('Texte'); ?></option>
                        <option value="textarea"><?php echo app('translator')->get('Zone de texte'); ?></option>
                        <option value="select"><?php echo app('translator')->get('Sélectionner'); ?></option>
                        <option value="checkbox"><?php echo app('translator')->get('Case à cocher'); ?></option>
                        <option value="radio"><?php echo app('translator')->get('Bouton radio'); ?></option>
                        <option value="file"><?php echo app('translator')->get('Fichier'); ?></option>
                    </select>
                </div>
                <div class="form-group">
                    <label><?php echo app('translator')->get('Obligatoire'); ?></label>
                    <select name="is_required" class="form-control" required>
                        <option value=""><?php echo app('translator')->get('Sélectionnez une option'); ?></option>
                        <option value="required"><?php echo app('translator')->get('Obligatoire'); ?></option>
                        <option value="optional"><?php echo app('translator')->get('Optionnel'); ?></option>
                    </select>
                </div>
                <div class="form-group">
                    <label><?php echo app('translator')->get('Étiquette du formulaire'); ?></label>
                    <input type="text" name="form_label" class="form-control" required>
                </div>
                <div class="form-group extra_area">

                </div>
              </div>
              <div class="modal-footer">
                  <button type="submit" class="btn btn--primary w-100 h-45 generatorSubmit"><?php echo app('translator')->get('Ajouter'); ?></button>
              </div>
          </form>
      </div>
    </div>
</div>


<?php $__env->startPush('script-lib'); ?>
<script src="<?php echo e(asset('assets/global/js/form_generator.js')); ?>"></script>
<?php $__env->stopPush(); ?>
<?php /**PATH /home/zubqbcmf/app/core/resources/views/components/form-generator.blade.php ENDPATH**/ ?>