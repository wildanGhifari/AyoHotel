<!-- <nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="<?= base_url(); ?>">AyoHotel</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <?php if ($this->session->userdata('id_role') === "2") : ?>
            <a class="nav-link" href="<?= base_url(); ?>">Home</a>
            <a class="nav-link" href="<?= base_url("rooms/"); ?>">Kamar</a>
            <a class="nav-link" href="<?= base_url("booking/mybooking"); ?>">My Booking</a>
        <?php else : ?>
            <a class="nav-link" href="<?= base_url("booking/data-booking"); ?>">Data Booking</a>
        <?php endif ?>
        <a class="nav-link" href="<?= base_url("profile"); ?>"><?= $name = $this->session->userdata('name'); ?></a>
        <img style="max-height: 36px;" class="rounded-circle" src="<?= $this->session->userdata('image') ?>">
        <a class="nav-link" href="<?= base_url("logout"); ?>">Logout</a>
      </div>
    </div>
  </div>
</nav> -->

<nav class="navbar navbar-expand-lg bg-primary-subtle sticky-top"  data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<?= base_url(); ?>">AyoHotel</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <?php if ($this->session->userdata('id_role') === "2") : ?>
                <li class="nav-item">
                    <a class="nav-link" href="<?= base_url(); ?>">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?= base_url("rooms/"); ?>">Kamar</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?= base_url('booking/mybooking/' . $this->session->userdata('id_user')); ?>">My Booking</a>
                </li>
            <?php else : ?>
                <li class="nav-item">
                    <a class="nav-link" href="<?= base_url("booking/databooking"); ?>">Data Booking</a>
                </li>
                <?php endif ?>
            </ul>
        <ul class="navbar-nav mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link" href="<?= base_url("profile"); ?>">
                    Hi, <?= explode(" ", $this->session->userdata('name'))[0]; ?>!
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<?= base_url("logout"); ?>">Logout</a>
            </li>
        </ul>
    </div>
  </div>
</nav>