<?php $__env->startSection('panel'); ?>
    <div class="row">
        <div class="col-lg-12">
            <div class="card b-radius--10 mb-4">
                <div class="card--body">
                    <form action="<?php echo e(route('admin.orders.update', $order->id)); ?>" method="post">
                        <?php echo csrf_field(); ?>
                        <div class="card-body p-0">
                            <div class="table-responsive--sm table-responsive">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th><?php echo app('translator')->get('Order ID'); ?></th>
                                            <td class="text-start"><?php echo e($order->id); ?></td>
                                        </tr>
                                        <tr>
                                            <th><?php echo app('translator')->get('User'); ?></th>
                                            <td class="text-start">
                                                <a href="<?php echo e(route('admin.users.detail', $order->user_id)); ?>">
                                                    <?php echo e(__($order->user->username)); ?>

                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><?php echo app('translator')->get('Catégorie'); ?></th>
                                            <td class="text-start">
                                                <?php echo e(__($order->category->name)); ?>

                                            </td>
                                        </tr>

                                        <tr>
                                            <th><?php echo app('translator')->get('Service'); ?></th>
                                            <td class="text-start">
                                                <?php echo e(__($order->service->name)); ?>

                                            </td>
                                        </tr>
                                        <tr>
                                            <th><?php echo app('translator')->get('Lien'); ?></th>
                                            <td class="text-start">
                                                <a href="<?php echo e(empty(parse_url($order->link, PHP_URL_SCHEME)) ? 'https://' : null); ?><?php echo e($order->link); ?>"
                                                    target="_blank"><?php echo e($order->link); ?>

                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><?php echo app('translator')->get('Quantité'); ?></th>
                                            <td class="text-start"><?php echo e($order->quantity); ?></td>
                                        </tr>
                                        <tr>
                                            <th><?php echo app('translator')->get('Compteur De Démarrage'); ?></th>
                                            <td class="text-start">
                                                <?php if($order->status == Status::ORDER_PENDING || $order->status == Status::ORDER_PROCESSING): ?>
                                                    <input type="text" name="start_count" max="<?php echo e($order->quantity); ?>"
                                                        value="<?php echo e($order->start_counter); ?>" class="form-control" required>
                                                <?php else: ?>
                                                    <?php echo e($order->start_counter); ?>

                                                <?php endif; ?>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><?php echo app('translator')->get('Restes'); ?></th>
                                            <td class="text-start"><?php echo e($order->remain); ?>

                                            </td>
                                        </tr>

                                        <?php if($order->api_order): ?>
                                            <tr>
                                                <td><?php echo app('translator')->get('Commande API'); ?></td>
                                                <td class="text-start">
                                                    <?php if($order->api_order): ?>
                                                        <span class="badge  badge--primary"><?php echo app('translator')->get('Oui'); ?></span>
                                                    <?php endif; ?>
                                                </td>
                                            </tr>
                                            <?php if($order->order_placed_to_api): ?>
                                                <tr>
                                                    <td><?php echo app('translator')->get('Identifiant de commande API'); ?></td>
                                                    <td class="text-start">
                                                        <strong><?php echo e(@$order->api_order_id); ?></strong>
                                                    </td>
                                                </tr>
                                            <?php endif; ?>
                                            <tr>
                                                <td><?php echo app('translator')->get('Commande passée à l\'API'); ?></td>
                                                <td class="text-start">
                                                    <?php if($order->order_placed_to_api): ?>
                                                        <span class="badge  badge--primary"><?php echo app('translator')->get('Oui'); ?></span>
                                                    <?php else: ?>
                                                        <span class="badge  badge--danger"><?php echo app('translator')->get('Non'); ?></span>
                                                    <?php endif; ?>
                                                </td>
                                            </tr>
                                        <?php endif; ?>

                                        <tr>
                                            <th><?php echo app('translator')->get('Status'); ?></th>
                                            <td class="text-start">
                                                <?php if($order->status == Status::ORDER_PENDING || $order->status == Status::ORDER_PROCESSING): ?>
                                                    <select class="form-control" name="status" required>
                                                        <option><?php echo app('translator')->get('Sélectionnez Le Statut'); ?></option>
                                                        <option value="0" <?php if($order->status == Status::ORDER_PENDING): echo 'selected'; endif; ?>>
                                                            <?php echo app('translator')->get('En Attente'); ?></option>
                                                        <option value="1" <?php if($order->status == Status::ORDER_PROCESSING): echo 'selected'; endif; ?>>
                                                            <?php echo app('translator')->get('Encour'); ?></option>
                                                        <option value="2" <?php if($order->status == Status::ORDER_COMPLETED): echo 'selected'; endif; ?>>
                                                            <?php echo app('translator')->get('Terminé'); ?></option>
                                                        <option value="3" <?php if($order->status == Status::ORDER_CANCELLED): echo 'selected'; endif; ?>>
                                                            <?php echo app('translator')->get('Annulé'); ?></option>
                                                        <option value="4" <?php if($order->status == Status::ORDER_REFUNDED): echo 'selected'; endif; ?>>
                                                            <?php echo app('translator')->get('Retourné'); ?></option>
                                                    </select>
                                                <?php elseif($order->status == Status::ORDER_COMPLETED): ?>
                                                    <span class="badge  badge--success"><?php echo app('translator')->get('Terminé'); ?></span>
                                                <?php elseif($order->status == Status::ORDER_CANCELLED): ?>
                                                    <span class="badge  badge--danger"><?php echo app('translator')->get('Annulé'); ?></span>
                                                <?php else: ?>
                                                    <span class="badge  badge--dark"><?php echo app('translator')->get('Retourné'); ?></span>
                                                <?php endif; ?>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <?php if($order->status == Status::ORDER_PENDING || $order->status == Status::ORDER_PROCESSING): ?>
                            <div class="card-footer">
                                <button type="submit" class="btn btn--primary w-100 h-45 "><?php echo app('translator')->get('Soumettre'); ?></button>
                            </div>
                        <?php endif; ?>
                    </form>
                </div>
            </div><!-- card end -->
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('breadcrumb-plugins'); ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.back','data' => ['route' => ''.e(url()->previous()).'']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('back'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['route' => ''.e(url()->previous()).'']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/zubqbcmf/app/core/resources/views/admin/order/details.blade.php ENDPATH**/ ?>