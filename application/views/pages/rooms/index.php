<div class="container-fluid p-4">
    <h2 class="mb-2">Kamar Tersedia</h2>
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
</div>