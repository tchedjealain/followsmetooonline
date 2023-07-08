<!-- meta tags and other links -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo e($general->siteName($pageTitle ?? '419 | Session a expiré')); ?></title>
    <link rel="shortcut icon" type="image/png" href="<?php echo e(getImage(getFilePath('logoIcon') . '/favicon.png')); ?>">
    <!-- bootstrap 4  -->
    <link rel="stylesheet" href="<?php echo e(asset('assets/global/css/bootstrap.min.css')); ?>">
    <!-- dashdoard main css -->
    <link rel="stylesheet" href="<?php echo e(asset('assets/errors/css/main.css')); ?>">
</head>

<body>


    <!-- error-404 start -->
    <div class="error">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7 text-center">
                    <img src="<?php echo e(asset('assets/errors/images/error-419.png')); ?>" alt="<?php echo app('translator')->get('image'); ?>">
                    <h2><b><?php echo app('translator')->get('419'); ?></b> <?php echo app('translator')->get('Désolé, votre session a expiré.'); ?></h2>
                    <p><?php echo app('translator')->get('Veuillez revenir en arrière et actualiser votre navigateur et réessayer'); ?></p>
                    <a href="<?php echo e(route('home')); ?>" class="btn--base mt-4"><?php echo app('translator')->get('Allez à l\'accueil'); ?></a>
                </div>
            </div>
        </div>
    </div>
    <!-- error-404 end -->


</body>

</html>
<?php /**PATH /home/zubqbcmf/app/core/resources/views/errors/419.blade.php ENDPATH**/ ?>