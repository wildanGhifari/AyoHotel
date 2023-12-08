<?php
if ($status == 'waiting') {
    $badge_status   = 'text-bg-primary';
    $status         = 'Waiting for payments';
}

if ($status == 'paid') {
    $badge_status   = 'text-bg-success';
    $status         = 'Paid';
}

if ($status == 'cancel') {
    $badge_status   = 'text-bg-danger';
    $status         = 'Cancel';
}
?>

<?php if ($status) : ?>
    <small class="badge <?= $badge_status ?>"><?= $status; ?></small>
<?php endif ?>