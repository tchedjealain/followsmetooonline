<?php $__env->startSection('panel'); ?>
    <div class="row gy-4">
        <div class="col-lg-12">
            <div class="card b-radius--10">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light tabstyle--two">
                            <thead>
                                <tr>
                                    <th><?php echo app('translator')->get('Service ID'); ?></th>
                                    <th><?php echo app('translator')->get('Service'); ?></th>
                                    <th><?php echo app('translator')->get('Price Per 1k'); ?></th>
                                    <th><?php echo app('translator')->get('Min'); ?></th>
                                    <th><?php echo app('translator')->get('Max'); ?></th>
                                    <th><?php echo app('translator')->get('Make Order'); ?></th>
                                </tr>
                            </thead>
                            <tbody>

                                <?php $__empty_1 = true; $__currentLoopData = $services; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $service): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                    <tr>
                                        <td><?php echo e($service->id); ?></td>
                                        <td class="break_line"><?php echo e(__($service->name)); ?>

                                        </td>
                                        <td>
                                            <?php echo e($general->cur_sym . showAmount($service->price_per_k)); ?>

                                        </td>
                                        <td><?php echo e(@$service->min); ?></td>
                                        <td><?php echo e(@$service->max); ?></td>

                                        <td>
                                            <button type="button" class="btn btn-sm btn-outline--info detailsBtn"
                                                data-original-title="<?php echo app('translator')->get('Details'); ?>" data-toggle="tooltip"
                                                data-details="<?php echo e($service->details); ?>" <?php if(!$service->details): echo 'disabled'; endif; ?>> <i
                                                    class="la la-desktop"></i> <?php echo app('translator')->get('Détails'); ?>
                                            </button>

                                            <button type="button" class=" btn btn-sm btn-outline--primary orderBtn"
                                                data-original-title="<?php echo app('translator')->get('Edit'); ?>" data-toggle="tooltip"
                                                data-url="<?php echo e(route('user.order.create', [$service->category_id, $service->id])); ?>"
                                                data-price_per_k="<?php echo e(getAmount($service->price_per_k)); ?>"
                                                data-min="<?php echo e($service->min); ?>" data-max="<?php echo e($service->max); ?>">
                                                <i class="las la-cart-plus"></i> <?php echo app('translator')->get('Commande'); ?>
                                            </button>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                    <tr>
                                        <td colspan="100%" class="text-center"><?php echo e(__($emptyMessage)); ?></td>
                                    </tr>
                                <?php endif; ?>

                            </tbody>
                        </table><!-- table end -->
                    </div>
                </div>
                <?php if($services->hasPages()): ?>
                    <div class="card-footer">
                        <?php echo e(paginateLinks($services)); ?>

                    </div>
                <?php endif; ?>
            </div><!-- card end -->
        </div>

    </div>

    
    <div class="modal fade" id="detailsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel"> <?php echo app('translator')->get('Détails'); ?></h4>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>

                <div class="modal-body">
                    <div id="details">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn--dark btn-sm" data-bs-dismiss="modal"><?php echo app('translator')->get('Fermé'); ?></button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"><?php echo app('translator')->get('Passer Commande'); ?></h4>
                    <button type="button" class="close" data-bs-dismiss="modal">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form method="post">
                    <?php echo csrf_field(); ?>
                    <div class="modal-body">
                        <div class="form-group">
                            <label><?php echo app('translator')->get('Lien'); ?></label>
                            <input type="text" class="form-control" name="link" required>
                        </div>
                        <div class="form-group">
                            <label><?php echo app('translator')->get('Quantité'); ?></label>
                            <input type="number" class="form-control" name="quantity" required>

                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <div class="input-group">

                                    <div class="input-group-text"><?php echo app('translator')->get('Min'); ?></div>
                                    <input type="text" name="min" class="form-control" readonly>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <div class="input-group">
                                    <div class="input-group-text"><?php echo app('translator')->get('Max'); ?></div>
                                    <input type="text" name="max" class="form-control" readonly>
                                </div>

                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="input-group">
                                <div class="input-group-text"><?php echo app('translator')->get('Prix'); ?></div>
                                <input type="text" class="form-control total_price text--success" name="price"
                                    readonly>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn--primary h-45 w-100"><?php echo app('translator')->get('Soumettre'); ?></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('breadcrumb-plugins'); ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.back','data' => ['route' => ''.e(route('user.services')).'']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('back'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['route' => ''.e(route('user.services')).'']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
<?php $__env->stopPush(); ?>

<?php $__env->startPush('style'); ?>
    <style>
        .break_line {
            white-space: initial !important;
        }
    </style>
<?php $__env->stopPush(); ?>

<?php $__env->startPush('script'); ?>
    <script>
        (function($) {
            "use strict";

            $('.detailsBtn').on('click', function() {
                var modal = $('#detailsModal');
                var details = $(this).data('details');

                modal.find('#details').html(details);
                modal.modal('show');
            });

            $('.orderBtn').on('click', function() {
                var modal = $('#orderModal');
                var url = $(this).data('url');
                var price_per_k = $(this).data('price_per_k');
                var min = $(this).data('min');
                var max = $(this).data('max');

                //Calculate total price
                $(document).on("keyup", "#quantity", function() {
                    var quantity = $('#quantity').val()
                    var total_price = (price_per_k / 1000) * quantity;
                    modal.find('input[name=price]').val("<?php echo e($general->cur_sym); ?>" + total_price
                        .toFixed(2));
                });

                modal.find('form').attr('action', url);
                modal.find('input[name=quantity]').attr('min', min).attr('max', max);
                modal.find('input[name=min]').val(min);
                modal.find('input[name=max]').val(max);
                modal.modal('show');
            });

            //Scroll to paginate position
            var pathName = document.location.pathname;
            window.onbeforeunload = function() {
                var scrollPosition = $(document).scrollTop();
                sessionStorage.setItem("scrollPosition_" + pathName, scrollPosition.toString());
            }
            if (sessionStorage["scrollPosition_" + pathName]) {
                $(document).scrollTop(sessionStorage.getItem("scrollPosition_" + pathName));
            }
        })(jQuery);
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make($activeTemplate . 'layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/zubqbcmf/app/core/resources/views/templates/basic/user/services/category.blade.php ENDPATH**/ ?>