
<?php $__env->startSection('content'); ?>
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-7 col-xl-6 p-5">

            <div class="register-form-area common-form-style bg-one create-account">
                <form method="POST" action="<?php echo e(route('user.data.submit')); ?>">
                    <h2 class="register-form-area__title mb-4"><?php echo e(__($pageTitle)); ?></h2>
                    <?php echo csrf_field(); ?>
                    <div class="row">
                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label"><?php echo app('translator')->get('Nom'); ?></label>
                            <input type="text" class="form--control" name="firstname" value="<?php echo e(old('firstname')); ?>"
                                placeholder="<?php echo app('translator')->get('Nom'); ?>" required>
                        </div>

                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label"><?php echo app('translator')->get('Prénom'); ?></label>
                            <input type="text" class="form--control" name="lastname"
                                value="<?php echo e(old('lastname')); ?>"placeholder="<?php echo app('translator')->get('Prénom'); ?>" required>
                        </div>
                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label"><?php echo app('translator')->get('Adresse'); ?></label>
                            <input type="text" class="form--control" name="address"
                                value="<?php echo e(old('address')); ?>"placeholder="<?php echo app('translator')->get('Adresse'); ?>">
                        </div>
                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label"><?php echo app('translator')->get('Région'); ?></label>
                            <input type="text" class="form--control" name="state"
                                value="<?php echo e(old('state')); ?>"placeholder="<?php echo app('translator')->get('Région'); ?>">
                        </div>
                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label"><?php echo app('translator')->get('Code Postal'); ?></label>
                            <input type="text" class="form--control" name="zip"
                                value="<?php echo e(old('zip')); ?>"placeholder="<?php echo app('translator')->get('Code Postal'); ?>">
                        </div>

                        <div class="form-group col-sm-6  mb-3">
                            <label class="form-label"><?php echo app('translator')->get('Ville'); ?></label>
                            <input type="text" class="form--control" name="city"
                                value="<?php echo e(old('city')); ?>"placeholder="<?php echo app('translator')->get('Ville'); ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn--base w-100">
                            <?php echo app('translator')->get('Soumettre'); ?>
                        </button>
                    </div>
                </form>
            </div>

        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make($activeTemplate . 'layouts.frontend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/zubqbcmf/app/core/resources/views/templates/basic/user/user_data.blade.php ENDPATH**/ ?>