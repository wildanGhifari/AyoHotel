<main role="main">
    <div class="container-fluid p-4">
        <div class="room-detail-container">
            <div class="room-content d-flex flex-column gap-3">
                <img src="<?= $room->image; ?>" class="room-img img-fluid w-100 object-fit-cover" alt="<?= $room->nama_kamar; ?>">
                <p><?= $room->deskripsi; ?></p>
                <div>
                    <h4>Fasilitas</h4>
                    <!-- <p class="mb-0 fw-bold text-body-secondary text-small">Fasilitas</p> -->
                    <?php foreach ($facilities as $facility) : ?>
                        <small class="badge bg-secondary"><?= ($facility); ?></small>
                    <?php endforeach ?>
                </div>
                <div>
                    <h4>Reviews</h4>
                    <?php if (!$reviews) : ?>
                        <div class="p-5 bg-body-tertiary rounded text-center">
                            <p class="text-black-50"></p>Belum ada reiviews</p>
                        </div>
                    <?php else : ?>
                        <?php foreach ($reviews as $review) : ?>
                            <div class="p-3 border border-secondary-subtle rounded mb-2">
                                <div class="d-flex gap-1">
                                    <?php for ($i = 0; $i < $review->rating; $i++) : ?>
                                        <small><i class="fa fa-star text-warning" aria-hidden="true"></i></small>
                                    <?php endfor ?>
                                </div>
                                <figure class="mb-0">
                                    <blockquote class="blockquote">
                                        <p><?= $review->testimoni; ?></p>
                                    </blockquote>
                                    <figcaption class="blockquote-footer mb-0">
                                        <?= $review->name; ?>, <?= $review->email; ?>
                                    </figcaption>
                                </figure>
                            </div>
                        <?php endforeach ?>
                    <?php endif ?>
                </div>
            </div>
            <div class="room-cta">
                <div class="card sticky-cta">
                    <div class="card-body d-flex flex-column gap-3">
                        <h3 class="card-title"><?= $room->nama_kamar; ?></h3>
                        <div class="d-flex gap-3 flex-wrap">
                            <div>
                                <p class="mb-0 fw-bold text-body-secondary text-small">Status</p>
                                <p><?= $room->status == 1 ? 'Tersedia' : 'Tidak Tersedia'; ?></p>
                            </div>
                            <div>
                                <p class="mb-0 fw-bold text-body-secondary text-small">Tipe Kamar</p>
                                <p><?= $room->tipe_kamar; ?></p>
                            </div>
                            <div>
                                <p class="mb-0 fw-bold text-body-secondary text-small">Harga</p>
                                <p>Rp. <?= number_format($room->harga, 2); ?>/Malam</p>
                            </div>
                        </div>
                        <div>
                            <a href="<?= base_url("booking/$room->id_kamar") ?>" class="btn btn-primary w-100">Pesan Kamar Sekarang</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>