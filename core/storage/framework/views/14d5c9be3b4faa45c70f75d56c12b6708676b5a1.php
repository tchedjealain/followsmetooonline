<?php $__env->startSection('panel'); ?>
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card custom--card">
                <div class="card-header">
                    <h5 class="card-title"><?php echo app('translator')->get('Flutterwave'); ?></h5>
                </div>
                <div class="card-body">
                    <ul class="list-group text-center">
                        <li class="list-group-item d-flex justify-content-between">
                            <?php echo app('translator')->get('Vous allez payer '); ?>:
                            <strong><?php echo e(showAmount($deposit->final_amo)); ?> <?php echo e(__($deposit->method_currency)); ?></strong>
                        </li>
                        <li class="list-group-item d-flex justify-content-between">
                            <?php echo app('translator')->get('Vous aurez '); ?>:
                            <strong><?php echo e(showAmount($deposit->amount)); ?> <?php echo e(__($general->cur_text)); ?></strong>
                        </li>
                    </ul>
                    <button type="button" class="btn btn--primary w-100 mt-3" id="btn-confirm"
                        onClick="payWithRave()"><?php echo app('translator')->get('Payer Maintenant'); ?></button>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('script'); ?>
    <script src="https://api.ravepay.co/flwv3-pug/getpaidx/api/flwpbf-inline.js"></script>
    <script>
        "use strict"
        var btn = document.querySelector("#btn-confirm");
        btn.setAttribute("type", "button");
        const API_publicKey = "<?php echo e($data->API_publicKey); ?>";

        function payWithRave() {
            var x = getpaidSetup({
                PBFPubKey: API_publicKey,
                customer_email: "<?php echo e($data->customer_email); ?>",
                amount: "<?php echo e($data->amount); ?>",
                customer_phone: "<?php echo e($data->customer_phone); ?>",
                currency: "<?php echo e($data->currency); ?>",
                txref: "<?php echo e($data->txref); ?>",
                onclose: function() {},
                callback: function(response) {
                    var txref = response.tx.txRef;
                    var status = response.tx.status;
                    var chargeResponse = response.tx.chargeResponseCode;
                    if (chargeResponse == "00" || chargeResponse == "0") {
                        window.location = '<?php echo e(url('ipn/flutterwave')); ?>/' + txref + '/' + status;
                    } else {
                        window.location = '<?php echo e(url('ipn/flutterwave')); ?>/' + txref + '/' + status;
                    }
                    // x.close(); // use this to close the modal immediately after payment.
                }
            });
        }
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make($activeTemplate . 'layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/zubqbcmf/app/core/resources/views/templates/basic/user/payment/Flutterwave.blade.php ENDPATH**/ ?>