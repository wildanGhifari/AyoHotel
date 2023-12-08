<main role="main">
    <div class="container-fluid p-4 booking-detail-container">
        <div class="booking-room-container">
            <div class="sticky-cta bg-secondary-subtle p-2 rounded">
                <div class="d-flex flex-column gap-3 p-2">
                    <img src="<?= $room->image; ?>" style="width: 64px; height: 64px" class="img-fluid object-fit-cover rounded" alt="<?= $room->nama_kamar; ?>">
                    <div>
                        <h5 class="mb-0"><?= $room->nama_kamar; ?></h5>
                        <p><?= $room->tipe_kamar; ?></p>
                        <p><?= $room->status == 1 ? 'Tersedia' : 'Tidak Tersedia'; ?></p>
                        <p>Rp. <?= number_format($room->harga, 2); ?>/Malam</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="booking-form-container">
            <h5>Booking detail</h5>
            <div class="alert alert-warning p-3" role="alert">
                <small>
                    Pastikan anda mengisi Formulir Booking ini dengan benar!
                </small>
            </div>
            <?= form_open('booking/create', ['method' => 'POST']) ?>
            <?= form_hidden('id_user', $user->id_user) ?>
            <?= form_hidden('id_kamar', $room->id_kamar) ?>
                <div class="form-floating mb-3">
                    <?= form_input('name', $user->name, ['id' => 'name', 'class' => 'form-control', 'required' => true, 'disabled' => true]) ?>
                    <?= form_error('name') ?>
                    <label for="name">Nama lengkap</label>
                </div>
                <div class="form-floating mb-3">
                    <?= form_input('email', $user->email, ['id' => 'email', 'class' => 'form-control', 'required' => true, 'disabled' => true]) ?>
                    <?= form_error('email') ?>
                    <label for="email">Alamat email</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="number" class="form-control" name="jumlah_tamu" id="tamu" min="1" value="1" required>
                    <?= form_error('tamu') ?>
                    <label for="tamu">Jumlah tamu</label>
                </div>
                <div class="booking-date mb-3">
                    <div class="form-floating w-100">
                        <input type="date" class="form-control" name="tanggal_checkin" id="tanggal_checkin" required>
                        <?= form_error('tanggal_checkin') ?>
                        <label for="tanggal_checkin">Tgl Check-in</label>
                    </div>
                    <div class="form-floating w-100">
                       <input type="date" class="form-control" name="tanggal_checkout" id="tanggal_checkout" required>
                        <?= form_error('tanggal_checkout') ?>
                        <label for="tanggal_checkout">Tgl Check-out</label>
                    </div>
                </div>
                <div class="bg-light p-3 rounded">
                    <h5>Summary</h5>
                    <div id="summaryContent">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary mt-4">Konfirmasi Booking</button>
            <?= form_close() ?>
        </div>
    </div>
</main>