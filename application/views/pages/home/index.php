<?php $this->load->view('layouts/_alerts') ?>
<section class="container-fluid p-4 mb-5">
    <div class="d-flex flex-row justify-content-between align-items-end">
        <h2>Kamar tersedia</h2>
        <h5>
            <a class="link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover" href="<?= base_url('rooms') ?>">
                Lihat semua
            </a>
        </h5>
    </div>
    <div class="d-flex flex-wrap gap-3 w-100">
        <?php foreach ($rooms as $room) : ?>
            <div class="card-room">
                <a class="text-decoration-none" href="<?= base_url("rooms/detail/$room->id_kamar") ?>">
                <div class="card mt-3" style="width: 100%;">
                    <img src="<?= isset($room->image) ? $room->image : 'https://picsum.photos/300/200'; ?>" class="card-img-top object-fit-cover" alt="<?= $room->nama_kamar; ?>">
                    <div class="card-body">
                        <h5 class="card-title"><?= $room->nama_kamar; ?></h5>
                        <p class="card-text text-truncate" style="max-height: 300px;"><?= $room->deskripsi; ?></p>
                        <p class="card-text text-primary" >Rp. <?= number_format($room->harga, 2); ?>/Malam</p>
                    </div>
                </div>
                </a>
            </div>
        <?php endforeach ?>
    </div>
</section>
<section class="container-fluid p-5 bg-dark-subtle border-bottom border-dark-subtle d-flex flex-wrap justify-content-center gap-3">
    <h2>Review Kamar</h2>
    <?php foreach ($reviews as $review) : ?>
        <div class="p-4 bg-light rounded w-100">
            <div class="d-flex gap-1">
                <?php for ($i = 0; $i < $review->rating; $i++) : ?>
                    <i class="fa fa-star text-warning" aria-hidden="true"></i>
                <?php endfor ?>
            </div>
            <figure class="mb-0">
                <blockquote class="blockquote">
                    <p><?= $review->testimoni; ?></p>
                </blockquote>
                <figcaption class="blockquote-footer mb-0 mt-3">
                    <?= $review->name; ?>, <?= $review->email; ?>
                </figcaption>
            </figure>
        </div>
    <?php endforeach ?>
</section>