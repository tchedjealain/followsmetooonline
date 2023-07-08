<?php $__env->startSection('panel'); ?>
    <div class="row">
        <div class="col-lg-12">

            <div class="card b-radius--10 mb-4">
                <div class="card-body p-0">
                    <div class="table-responsive--lg table-responsive">
                        <table class="table table--light tabstyle--two">
                            <thead>
                                <tr>
                                    <th><?php echo app('translator')->get('Order ID'); ?></th>
                                    <th><?php echo app('translator')->get('User'); ?></th>
                                    <th><?php echo app('translator')->get('Category'); ?></th>
                                    <th><?php echo app('translator')->get('Service'); ?></th>
                                    <th><?php echo app('translator')->get('Quantity'); ?></th>
                                    <th><?php echo app('translator')->get('Start Counter'); ?></th>
                                    <th><?php echo app('translator')->get('Remains'); ?></th>
                                    <th><?php echo app('translator')->get('Status'); ?></th>
                                    <th><?php echo app('translator')->get('API Order'); ?></th>
                                    <th><?php echo app('translator')->get('Date'); ?></th>
                                    <th><?php echo app('translator')->get('Action'); ?></th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__empty_1 = true; $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                    <tr>
                                        <td><?php echo e($order->id); ?></td>
                                        <td>
                                            <span class="d-block"><?php echo e(__(@$order->user->fullname)); ?></span>
                                            <a href="<?php echo e(route('admin.users.detail', $order->user_id)); ?>">
                                                <?php echo e(__(@$order->user->username)); ?></a>
                                        </td>
                                        <td class="break_line"><?php echo e(__(@$order->category->name)); ?></td>
                                        <td class="break_line"><?php echo e(__(@$order->service->name)); ?></td>
                                        <td><?php echo e($order->quantity); ?></td>
                                        <td><?php echo e($order->start_counter); ?></td>
                                        <td><?php echo e($order->remain); ?></td>
                                        <td>
                                            <?php if($order->status == Status::ORDER_PENDING): ?>
                                                <span class="badge badge--warning"><?php echo app('translator')->get('Pending'); ?></span>
                                            <?php elseif($order->status == Status::ORDER_PROCESSING): ?>
                                                <span class="badge badge--primary"><?php echo app('translator')->get('Processing'); ?></span>
                                            <?php elseif($order->status == Status::ORDER_COMPLETED): ?>
                                                <span class="badge badge--success"><?php echo app('translator')->get('Completed'); ?></span>
                                            <?php elseif($order->status == Status::ORDER_CANCELLED): ?>
                                                <span class="badge badge--danger"><?php echo app('translator')->get('Cancelled'); ?></span>
                                            <?php else: ?>
                                                <span class="badge badge--dark"><?php echo app('translator')->get('Refunded'); ?></span>
                                            <?php endif; ?>
                                        </td>
                                        <td>
                                            <?php if($order->api_order): ?>
                                                <span class="badge  badge--primary"><?php echo app('translator')->get('Yes'); ?></span>
                                            <?php else: ?>
                                                <span class="badge  badge--warning"><?php echo app('translator')->get('No'); ?></span>
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo e(showDateTime($order->created_at)); ?></td>
                                        <td>
                                            <a href="<?php echo e(route('admin.orders.details', $order->id)); ?>"
                                                class="btn btn-sm btn-outline--primary">
                                                <i class="la la-desktop"></i>
                                                <?php echo app('translator')->get('Details'); ?>
                                            </a>
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
                    <div class="card-footer py-4">
                        <?php echo e(paginateLinks($orders)); ?>

                    </div>
                <?php endif; ?>
            </div><!-- card end -->

        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('breadcrumb-plugins'); ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.search-form','data' => ['placeholder' => 'Search here...']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('search-form'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['placeholder' => 'Search here...']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/zubqbcmf/app/core/resources/views/admin/order/index.blade.php ENDPATH**/ ?>