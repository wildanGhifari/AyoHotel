<main role="main">
    <div class="data-booking-container">
         <?php $this->load->view('layouts/_alerts') ?>
         <div class="data-booking">
            <h2 class="mb-3 px-3">My Bookings</h2>
            <?php if (!$books) : ?>
                <div class="container-fluid bg-body-secondary p-5 rounded-3 d-flex flex-column justify-content-center align-items-center" style="height: 432px;">
                    <h5 class="text-center">Tidak ada data booking yang ditemukan</h5>
                    <p class="text-center">Cari kamar sekarang, nanti data booking kamu akan muncul disini!</p>
                    <a class="btn btn-primary mt-4" href="<?= base_url('rooms') ?>">Cari kamar</a>
                </div>
            <?php else : ?>
                <?php foreach ($books as $book): ?>
                    <div class="list-group">
                        <?php foreach ($rooms as $room): ?>
                            <?php if ($room->id_kamar == $book->id_kamar): ?>
                                <a href="#" class="list-group-item list-group-item-action py-3 rounded-0">
                                    <div class="d-flex w-100 justify-content-between">
                                        <h6 class="mb-1">#<?= str_pad($book->id_booking, 6, "0", STR_PAD_LEFT); ?>AYO - <?= $room->nama_kamar; ?></h6>
                                        <?php $this->load->view('layouts/_status', ['status' => $book->status]); ?>
                                    </div>
                                    <div class="d-flex w-100 justify-content-between my-1">
                                        <p><?= $book->name . ' (' . $book->email . ')'; ?></p>
                                        <p>Jumlah tamu: <?= $book->jumlah_tamu . ' Orang'; ?></p>
                                    </div>
                                    <small><?= $book->tanggal_checkin . ' - ' . $book->tanggal_checkout; ?></small>
                                </a>
                            <?php endif ?>
                        <?php endforeach ?>
                    </div>
                <?php endforeach ?>
            <?php endif ?>
         </div>
    </div>
</main>

<!-- 'booking.id_booking', 'booking.id_user','booking.id_kamar', -->
<!-- 'booking.jumlah_tamu', 'booking.tanggal_checkin', 'booking.tanggal_checkout', -->
<!-- 'user.id_user', 'user.id_role', 'user.name', 'user.email' -->