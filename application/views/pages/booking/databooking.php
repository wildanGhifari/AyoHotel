<main role="main">
    <div class="data-booking-container">
         <?php $this->load->view('layouts/_alerts') ?>
         <div class="data-booking">
            <div class="d-flex flex-row w-100 justify-content-between mb-3">
                <h2 class="px-3 w-25">My Bookings</h2>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Cari data booking..." aria-label="Search">
                    <!-- <button class="btn btn-outline-success" type="submit">Search</button> -->
                </form>
            </div>
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
                                    <div class="d-flex flex-column w-100 justify-content-between my-1">
                                        <p><?= $book->name . ' (' . $book->email . ')'; ?></p>
                                        <p>Jumlah tamu: <?= $book->jumlah_tamu . ' Orang'; ?></p>
                                    </div>
                                    <div class="d-flex w-100 justify-content-between align-items-center my-1">
                                        <small>
                                            <?= $book->tanggal_checkin . ' - ' . $book->tanggal_checkout; ?>
                                        </small>
                                        <?= form_open('booking/update', ['method' => 'POST']) ?>
                                            <?= form_hidden('id_booking', $book->id_booking) ?>
                                            <?= form_hidden('id_kamar', $book->id_kamar) ?>
                                            <?= form_hidden('status', $book->status) ?>
                                            <?php if ($book->status == 'paid') : ?>
                                                <button type="submit" class="btn btn btn-outline-primary btn-sm">
                                                    Check In <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
                                                </button>
                                            <?php elseif ($book->status == 'in') : ?>
                                                <button type="submit" class="btn btn btn-outline-primary btn-sm">
                                                    Check Out <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
                                                </button>
                                            <?php endif ?>
                                        <?= form_close() ?>
                                    </div>
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