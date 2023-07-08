<?php $__env->startSection('content'); ?>
    <?php
        $contactContent = getContent('contact.content', true);
        $addressContent = getContent('address.content', true);
    ?>
    <!-- contact-section start -->
    <section class="contact-section register-section ptb-80">
        <div class="container">
            <figure class="figure highlight-background highlight-background--lean-left">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1439px"
                    height="480px">
                    <defs>
                        <linearGradient id="PSgrad_1" x1="42.262%" x2="0%" y1="90.631%" y2="0%">
                            <stop offset="28%" stop-color="rgb(245,246,252)" stop-opacity="1" />
                            <stop offset="100%" stop-color="rgb(255,255,255)" stop-opacity="1" />
                        </linearGradient>
                    </defs>
                    <path fill-rule="evenodd" fill="rgb(255, 255, 255)"
                        d="M863.247,-271.203 L-345.788,-427.818 L760.770,642.200 L1969.805,798.815 L863.247,-271.203 Z" />
                    <path fill="url(#PSgrad_1)"
                        d="M863.247,-271.203 L-345.788,-427.818 L760.770,642.200 L1969.805,798.815 L863.247,-271.203 Z" />
                </svg>
            </figure>
            <div class="row justify-content-center align-items-center ml-b-30">
                <div class="col-lg-6 mrb-30">
                    <div class="contact-thumb">
                        <img src="<?php echo e(getImage('assets/images/frontend/contact/' . @$contactContent->data_values->image, '715x470')); ?>"
                            alt="<?php echo app('translator')->get('Contact'); ?>">
                    </div>
                </div>
                <?php
                    $user = auth()->user();
                ?>
                <div class="col-lg-6 mrb-30">
                    <div class="register-form-area">
                        <h3 class="title"><?php echo app('translator')->get('Entrer en contact'); ?></h3>
                        <form class="register-form verify-gcaptcha" method="post" action="">
                            <?php echo csrf_field(); ?>
                            <div class="row justify-content-center ms-b-20">
                                <div class="col-lg-6 mb-3">
                                    <input name="name" type="text" class="form--control"
                                        placeholder="<?php echo app('translator')->get('Votre Nom'); ?>" value="<?php echo e($user ? $user->fullname : old('name')); ?>"
                                        <?php echo e($user ? 'readonly' : ''); ?> required>
                                </div>
                                <div class="col-lg-6 mb-3">
                                    <input name="email" type="text" class="form--control"
                                        placeholder="<?php echo app('translator')->get('Adresse E-mail'); ?>" value="<?php echo e($user ? $user->email : old('email')); ?>"
                                        <?php echo e($user ? 'readonly' : ''); ?> required>
                                </div>
                                <div class="col-lg-12 mb-3">
                                    <input name="subject" type="text" class="form--control"
                                        placeholder="<?php echo app('translator')->get('Objet du message'); ?>" value="<?php echo e(old('subject')); ?>" required>
                                </div>
                                <div class="col-lg-12 mb-3">
                                    <textarea name="message" wrap="off" class="form--control" placeholder="<?php echo app('translator')->get('Rédigez votre message'); ?>"><?php echo e(old('message')); ?></textarea>
                                </div>
                                <div class="col-lg-12 mb-3">
                                    <?php if (isset($component)) { $__componentOriginalc0af13564821b3ac3d38dfa77d6cac9157db8243 = $component; } ?>
<?php $component = App\View\Components\Captcha::resolve([] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('captcha'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(App\View\Components\Captcha::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc0af13564821b3ac3d38dfa77d6cac9157db8243)): ?>
<?php $component = $__componentOriginalc0af13564821b3ac3d38dfa77d6cac9157db8243; ?>
<?php unset($__componentOriginalc0af13564821b3ac3d38dfa77d6cac9157db8243); ?>
<?php endif; ?>
                                </div>

                                <div class="col-lg-12">
                                    <button type="submit" class="submit-btn w-100"><?php echo app('translator')->get('Soumettre Maintenant'); ?></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- contact-section end -->

    <!-- contact-info start -->
    <div class="contact-info-area ptb-80">
        <div class="container">
            <figure class="figure highlight-background highlight-background--lean-left">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1439px"
                    height="480px">
                    <defs>
                        <linearGradient id="PSgrad_1" x1="42.262%" x2="0%" y1="90.631%" y2="0%">
                            <stop offset="28%" stop-color="rgb(245,246,252)" stop-opacity="1" />
                            <stop offset="100%" stop-color="rgb(255,255,255)" stop-opacity="1" />
                        </linearGradient>

                    </defs>
                    <path fill-rule="evenodd" fill="rgb(255, 255, 255)"
                        d="M863.247,-271.203 L-345.788,-427.818 L760.770,642.200 L1969.805,798.815 L863.247,-271.203 Z" />
                    <path fill="url(#PSgrad_1)"
                        d="M863.247,-271.203 L-345.788,-427.818 L760.770,642.200 L1969.805,798.815 L863.247,-271.203 Z" />
                </svg>
            </figure>
            <div class="contact-info-item-area">
                <div class="row justify-content-center align-items-center ml-b-30">
                    <div class="col-lg-4 col-md-6 col-sm-8 text-center mrb-30">
                        <div class="contact-info-item">
                            <i class="fas fa fa-map-marker-alt"></i>
                            <h3 class="title"><?php echo app('translator')->get('Adresse de bureau'); ?></h3>
                            <p><?php echo e(__(@$addressContent->data_values->address)); ?></p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-8 text-center mrb-30">
                        <div class="contact-info-item active">
                            <i class="fas fa-envelope"></i>
                            <h3 class="title"><?php echo app('translator')->get('Adresse E-mail'); ?></h3>
                            <p><?php echo e(__(@$addressContent->data_values->email)); ?></p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-8 text-center mrb-30">
                        <div class="contact-info-item">
                            <i class="fas fa-phone-alt"></i>
                            <h3 class="title"><?php echo app('translator')->get('Numéro De Téléphone'); ?></h3>
                            <p><?php echo e(__(@$addressContent->data_values->phone)); ?></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- contact-info end -->
<?php $__env->stopSection(); ?>

<?php $__env->startPush('script'); ?>
    <script>
        "use strict";
        (function($) {
            $('label').attr('for', 'captcha').remove();
            $('.mb-2').addClass('mb-3').removeClass('.mb-2');
            $('input[name=captcha]').attr('placeholder', `<?php echo app('translator')->get('Captcha'); ?>`);
        })(jQuery);
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make($activeTemplate . 'layouts.frontend', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/zubqbcmf/app/core/resources/views/templates/basic/contact.blade.php ENDPATH**/ ?>