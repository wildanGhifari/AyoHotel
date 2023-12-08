<?php
if ($status == 'waiting') {
    $badge_status   = 'text-bg-secondary';
    $status         = 'Waiting for payments';
}

if ($status == 'paid') {
    $badge_status   = 'text-bg-success';
    $status         = 'Paid';
}

if ($status == 'in') {
    $badge_status   = 'text-bg-primary';
    $status         = 'Check-in';
}

if ($status == 'out') {
    $badge_status   = 'text-bg-danger';
    $status         = 'Check-out';
}

if ($status == 'cancel') {
    $badge_status   = 'text-bg-danger';
    $status         = 'Cancel';
}
?>

<?php if ($status) : ?>
    <small class="badge <?= $badge_status ?>"><?= $status; ?></small>
<?php endif ?>