<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS -->
    <link href="<?= base_url('/assets/css/app.css') ?>" rel="stylesheet">
    <!-- Bootstrap 4 core CSS -->
    <link href="<?= base_url('/assets/libs/bootstrap/css/bootstrap.min.css') ?>" rel="stylesheet">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="<?= base_url('/assets/libs/fontawesome/css/all.min.css') ?>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <title><?= isset($title) ? $title : 'hotel ayo' ?></title>
</head>

<body>
    <!-- Navbar -->
    <?php $this->load->view('layouts/_navbar') ?>
    <!-- End of Navbar -->

    <!-- Content -->
    <?php $this->load->view($page); ?>
    <!-- End of Content -->

    <!-- Footer -->
    <?php $this->load->view('layouts/_footer') ?>
    <!-- End of Footer -->
    <script src="<?= base_url('/assets/js/app.js') ?>"></script>
    <script src="<?= base_url('/assets/libs/jquery/jquery-3.5.1.min.js') ?>"></script>
    <script src="<?= base_url('/assets/libs/bootstrap/js/bootstrap.bundle.min.js') ?>"></script>

</body>

</html>