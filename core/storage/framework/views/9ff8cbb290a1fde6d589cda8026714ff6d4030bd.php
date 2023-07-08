

<?php $__env->startSection('panel'); ?>
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <form action="<?php echo e(route('user.deposit.insert')); ?>" method="post">
                <?php echo csrf_field(); ?>
                <input type="hidden" name="method_code">
                <input type="hidden" name="currency">
                <div class="card custom--card">
                    <div class="card-header">
                        <h5 class="card-title"><?php echo app('translator')->get('Dépôt Dans Le Compte'); ?></h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label class="form-label"><?php echo app('translator')->get('Sélectionnez la passerelle'); ?></label>
                            <select class="form--control form-control " name="gateway" required>
                                <option value=""><?php echo app('translator')->get('Sélectionnez-en un'); ?></option>
                                <?php $__currentLoopData = $gatewayCurrency; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($data->method_code); ?>" <?php if(old('gateway') == $data->method_code): echo 'selected'; endif; ?>
                                        data-gateway="<?php echo e($data); ?>"><?php echo e($data->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="form-label"><?php echo app('translator')->get('Montant'); ?></label>
                            <div class="input-group">
                                <input type="number" step="any" name="amount" class="form-control form--control"
                                    value="<?php echo e(old('amount')); ?>" autocomplete="off" required>
                                <span class="input-group-text"><?php echo e($general->cur_text); ?></span>
                            </div>
                        </div>
                        <div class="mt-3 preview-details d-none">
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between">
                                    <span><?php echo app('translator')->get('Limite'); ?></span>
                                    <span><span class="min fw-bold">0</span> <?php echo e(__($general->cur_text)); ?> - <span
                                            class="max fw-bold">0</span> <?php echo e(__($general->cur_text)); ?></span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span><?php echo app('translator')->get('Frais'); ?></span>
                                    <span><span class="charge fw-bold">0</span> <?php echo e(__($general->cur_text)); ?></span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <span><?php echo app('translator')->get('Payable'); ?></span> <span><span class="payable fw-bold"> 0</span>
                                        <?php echo e(__($general->cur_text)); ?></span>
                                </li>
                                <li class="list-group-item justify-content-between d-none rate-element">

                                </li>
                                <li class="list-group-item justify-content-between d-none in-site-cur">
                                    <span><?php echo app('translator')->get('En'); ?> <span class="method_currency"></span></span>
                                    <span class="final_amo fw-bold">0</span>
                                </li>
                                <li class="list-group-item justify-content-center crypto_currency d-none">
                                    <span><?php echo app('translator')->get('Conversion avec'); ?> <span class="method_currency"></span>
                                        <?php echo app('translator')->get('et la valeur finale s\'affichera à l\'étape suivante'); ?></span>
                                </li>
                            </ul>
                        </div>
                        <button type="submit" class="btn btn--primary w-100 mt-3"><?php echo app('translator')->get('Soumettre'); ?></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('breadcrumb-plugins'); ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.back','data' => ['route' => ''.e(route('user.deposit.history')).'']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('back'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['route' => ''.e(route('user.deposit.history')).'']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
<?php $__env->stopPush(); ?>


<?php $__env->startPush('script'); ?>
    <script>
        (function($) {
            "use strict";
            $('select[name=gateway]').change(function() {
                if (!$('select[name=gateway]').val()) {
                    $('.preview-details').addClass('d-none');
                    return false;
                }
                var resource = $('select[name=gateway] option:selected').data('gateway');
                var fixed_charge = parseFloat(resource.fixed_charge);
                var percent_charge = parseFloat(resource.percent_charge);
                var rate = parseFloat(resource.rate)
                if (resource.method.crypto == 1) {
                    var toFixedDigit = 8;
                    $('.crypto_currency').removeClass('d-none');
                } else {
                    var toFixedDigit = 2;
                    $('.crypto_currency').addClass('d-none');
                }
                $('.min').text(parseFloat(resource.min_amount).toFixed(2));
                $('.max').text(parseFloat(resource.max_amount).toFixed(2));
                var amount = parseFloat($('input[name=amount]').val());
                if (!amount) {
                    amount = 0;
                }
                if (amount <= 0) {
                    $('.preview-details').addClass('d-none');
                    return false;
                }
                $('.preview-details').removeClass('d-none');
                var charge = parseFloat(fixed_charge + (amount * percent_charge / 100)).toFixed(2);
                $('.charge').text(charge);
                var payable = parseFloat((parseFloat(amount) + parseFloat(charge))).toFixed(2);
                $('.payable').text(payable);
                var final_amo = (parseFloat((parseFloat(amount) + parseFloat(charge))) * rate).toFixed(
                    toFixedDigit);
                $('.final_amo').text(final_amo);
                if (resource.currency != '<?php echo e($general->cur_text); ?>') {
                    var rateElement =
                        `<span class="fw-bold"><?php echo app('translator')->get('Taux de Conversion'); ?></span> <span><span  class="fw-bold">1 <?php echo e(__($general->cur_text)); ?> = <span class="rate">${rate}</span>  <span class="method_currency">${resource.currency}</span></span></span>`;
                    $('.rate-element').html(rateElement)
                    $('.rate-element').removeClass('d-none');
                    $('.in-site-cur').removeClass('d-none');
                    $('.rate-element').addClass('d-flex');
                    $('.in-site-cur').addClass('d-flex');
                } else {
                    $('.rate-element').html('')
                    $('.rate-element').addClass('d-none');
                    $('.in-site-cur').addClass('d-none');
                    $('.rate-element').removeClass('d-flex');
                    $('.in-site-cur').removeClass('d-flex');
                }
                $('.method_currency').text(resource.currency);
                $('input[name=currency]').val(resource.currency);
                $('input[name=method_code]').val(resource.method_code);
                $('input[name=amount]').on('input');
            });
            $('input[name=amount]').on('input', function() {
                $('select[name=gateway]').change();
                $('.amount').text(parseFloat($(this).val()).toFixed(2));
            });
        })(jQuery);
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make($activeTemplate . 'layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/zubqbcmf/app/core/resources/views/templates/basic/user/payment/deposit.blade.php ENDPATH**/ ?>