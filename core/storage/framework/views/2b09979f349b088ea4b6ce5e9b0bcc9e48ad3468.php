<!-- meta tags and other links -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo e($general->siteName($pageTitle ?? '404 | Page non trouvée')); ?></title>
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
                    <img src="<?php echo e(asset('assets/errors/images/error-404.png')); ?>" alt="<?php echo app('translator')->get('image'); ?>">
                    <h2><b><?php echo app('translator')->get('404'); ?></b> <?php echo app('translator')->get('Page non trouvée'); ?></h2>
                    <p><?php echo app('translator')->get('la page que vous recherchez n\'existe pas ou une autre erreur s\'est produite'); ?> <br> <?php echo app('translator')->get('ou temporairement indisponible.'); ?></p>
                    <a href="<?php echo e(route('home')); ?>" class="btn--base mt-4"><?php echo app('translator')->get('Allez à l\'accueil'); ?></a>
                </div>
            </div>
        </div>
    </div>
    <!-- error-404 end -->


</body>

</html>
<?php /**PATH /home/zubqbcmf/app/core/resources/views/errors/404.blade.php ENDPATH**/ ?>