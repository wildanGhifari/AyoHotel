<?php

defined("BASEPATH") or exit("No direct script access allowed");

class Home_model extends MY_Model
{
    public $table = 'kamar';

    protected $perPage = 4;

    public function __construct() {
        parent::__construct();
        $is_login = $this->session->userdata('is_login');
        $this->id = $this->session->userdata('id');

        if (!$is_login) {
            redirect(base_url('login'));
            return;
        }
    }
}
