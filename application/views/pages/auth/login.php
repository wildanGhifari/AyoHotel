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
    <div id="auth">
        <div id="form-container">
            <h3 style="width: 100%;" class="mb-5">Login</h3>
            <div class="form-inputs">
                <?php $this->load->view('layouts/_alerts') ?>
                <?= form_open('login', ['method' => 'POST']) ?>
                    <div class="form-floating mb-3">
                        <?= form_input('email', $input->email, ['type' => 'email', 'name' => 'email', 'class' => 'form-control', 'placeholder' => 'your@mail.com', 'required' => true]) ?>
                        <?= form_error('email') ?>
                        <label for="email">Alamat email</label>
                    </div>
                    <div class="form-floating mb-3">
                        <?= form_password('password', '', ['class' => 'form-control', 'placeholder' => 'Password', 'required' => true]) ?>
                        <?= form_error('password') ?>
                        <label for="password">Password</label>
                    </div>
                    <button type="submit" style="width: 100%;" class="btn btn-primary rounded-pill mt-4">Login</button>
                    <div class="text-center mt-3">
                        <a href="<?= base_url('forgot_password') ?>" class="small text-dark">Forgot Password?</a>
                    </div>
                    <div class="text-center mt-3">
                        <a href="<?= base_url('signup') ?>" class="small text-dark">Not a member? Sign up here</a>
                    </div>
                <?= form_close() ?>
            </div>
        </div>
        <div id="img-container">
            <img src="<?= base_url('assets/imgs/auth.jpg') ?>" class="auth-img">
        </div>
    </div>

    <script src="<?= base_url('/assets/js/app.js') ?>"></script>
    <script src="<?= base_url('/assets/libs/jquery/jquery-3.5.1.min.js') ?>"></script>
    <script src="<?= base_url('/assets/libs/bootstrap/js/bootstrap.bundle.min.js') ?>"></script>
</body>

</html>