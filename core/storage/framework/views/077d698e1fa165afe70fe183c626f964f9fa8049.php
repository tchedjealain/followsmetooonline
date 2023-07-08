<?php $__env->startSection('panel'); ?>
    <div class="row justify-content-center gy-4">
        <div class="col-lg-8">
            <div class="card b-radius--10">
                <div class="card-body  p-4 ">
                    <form action="<?php echo e(route('user.deposit.manual.update')); ?>" method="POST" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <p class="text-center mt-2"><?php echo app('translator')->get('Vous avez demandé'); ?> <b
                                        class="text--success"><?php echo e(showAmount($data['amount'])); ?>

                                        <?php echo e(__($general->cur_text)); ?></b>, <?php echo app('translator')->get('veuillez payez'); ?>
                                    <b class="text--success"><?php echo e(showAmount($data['final_amo']) . ' ' . $data['method_currency']); ?>

                                    </b> <?php echo app('translator')->get('pour valider la transaction'); ?>
                                </p>
                                <h4 class="text-center mb-4"><?php echo app('translator')->get('Veuillez suivre les instructions ci-dessous'); ?></h4>
                                <p class="text-center mb-4"><?php echo app('translator')->get('Effectuer Votre dépôt au Numéro Suivant : <br><strong>MTN MoMo 652796305</strong> ou <strong>OM 697946206</strong> <br>Bénéficiaire: <strong>TCHEDJE MBOUGEMG Alain</strong> [CEO FollowMeToo]'); ?> <br>Remplissez ensuite les champs suivants après votre dépôt. <span style="color: #004e92; font-weight: 800;">Patientez 5 minutes pour sa confirmation.</span></p>
                                

                            </div>

                            <?php if (isset($component)) { $__componentOriginale40beaa5cbfa24869bd0b7ba4d9f41184a3f12f0 = $component; } ?>
<?php $component = App\View\Components\ViserForm::resolve(['identifier' => 'id','identifierValue' => ''.e($gateway->form_id).''] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('viser-form'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(App\View\Components\ViserForm::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginale40beaa5cbfa24869bd0b7ba4d9f41184a3f12f0)): ?>
<?php $component = $__componentOriginale40beaa5cbfa24869bd0b7ba4d9f41184a3f12f0; ?>
<?php unset($__componentOriginale40beaa5cbfa24869bd0b7ba4d9f41184a3f12f0); ?>
<?php endif; ?>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <button type="submit" class="btn btn--primary w-100 h-45"><?php echo app('translator')->get('Payez Maintenant'); ?></button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make($activeTemplate . 'layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/zubqbcmf/app/core/resources/views/templates/basic/user/payment/manual.blade.php ENDPATH**/ ?>