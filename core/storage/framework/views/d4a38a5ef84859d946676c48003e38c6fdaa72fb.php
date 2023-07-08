<?php $__env->startSection('panel'); ?>
    <div class="row">
        <div class="col-lg-12">

            <div class="card b-radius--10 mb-4">
                <div class="card-body p-0">
                    <div class="table-responsive--sm table-responsive">
                        <table class="table table--light ">
                            <thead>
                                <tr>
                                    <th><?php echo app('translator')->get('Order ID'); ?></th>
                                    <th><?php echo app('translator')->get('Category'); ?></th>
                                    <th><?php echo app('translator')->get('Service'); ?></th>
                                    <th><?php echo app('translator')->get('Link'); ?></th>
                                    <th><?php echo app('translator')->get('Quantity'); ?></th>
                                    <th><?php echo app('translator')->get('Start Counter'); ?></th>
                                    <th><?php echo app('translator')->get('Remains'); ?></th>
                                    <th><?php echo app('translator')->get('Date'); ?></th>
                                    <th><?php echo app('translator')->get('Status'); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__empty_1 = true; $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                    <tr>
                                        <td><?php echo e($item->id); ?></td>
                                        <td class="break_line"><?php echo e(__($item->category->name)); ?></td>
                                        <td class="break_line">
                                            <?php echo e(__($item->service->name)); ?></td>
                                        <td class="break_line"><a
                                                href="<?php echo e(empty(parse_url($item->link, PHP_URL_SCHEME)) ? 'https://' : null); ?><?php echo e($item->link); ?>"
                                                target="_blank"><?php echo e($item->link); ?></a></td>
                                        <td><?php echo e($item->quantity); ?></td>
                                        <td><?php echo e($item->start_counter); ?></td>
                                        <td><?php echo e($item->remain); ?></td>
                                        <td><?php echo e(showDateTime($item->created_at)); ?></td>
                                        <td>
                                            <?php if($item->status == 0): ?>
                                                <span
                                                    class="text--small badge fw-normal badge--warning"><?php echo app('translator')->get('En Attente'); ?></span>
                                            <?php elseif($item->status == 1): ?>
                                                <span
                                                    class="text--small badge fw-normal badge--primary"><?php echo app('translator')->get('Encours'); ?></span>
                                            <?php elseif($item->status == 2): ?>
                                                <span
                                                    class="text--small badge fw-normal badge--success"><?php echo app('translator')->get('Terminée'); ?></span>
                                            <?php elseif($item->status == 3): ?>
                                                <span
                                                    class="text--small badge fw-normal badge--danger"><?php echo app('translator')->get('Annullée'); ?></span>
                                            <?php else: ?>
                                                <span
                                                    class="text--small badge fw-normal badge--dark"><?php echo app('translator')->get('Retournée'); ?></span>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                    <tr>
                                        <td class="text-muted text-center" colspan="100%"><?php echo e(__($emptyMessage)); ?></td>
                                    </tr>
                                <?php endif; ?>
                            </tbody>
                        </table><!-- table end -->
                    </div>
                </div>

                <?php if($orders->hasPages()): ?>
                    <div class="card-footer">
                        <?php echo e(paginateLinks($orders)); ?>

                    </div>
                <?php endif; ?>
            </div><!-- card end -->

        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('breadcrumb-plugins'); ?>

        <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.search-form','data' => ['placeholder' => 'Search here ...']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('search-form'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['placeholder' => 'Search here ...']); ?>
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

<?php echo $__env->make($activeTemplate . 'layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/zubqbcmf/app/core/resources/views/templates/basic/user/orders/history.blade.php ENDPATH**/ ?>