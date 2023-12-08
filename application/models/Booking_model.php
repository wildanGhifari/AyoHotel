<?php

defined("BASEPATH") or exit("No direct script access allowed");

class Booking_model extends MY_Model
{
    public $table = 'booking';
    private $id;

    public function __construct() {
        parent::__construct();
        $is_login = $this->session->userdata('is_login');
        $this->id = $this->session->userdata('id_user');

        if (!$is_login) {
            redirect(base_url('login'));
            return;
        }
    }

    public function getDefaultValues()
    {
        return [
            'id_user'           => $this->id,
            'id_kamar'          => '',
            'jumlah_tamu'       => 1,
            'tanggal_checkin'   => '',
            'tanggal_checkout'  => '',
        ];
    }

    public function getValidationRules() {
        $validationRules = [
            [
                'field' => 'name',
                'label' => 'Nama Lengkap',
                'rules' => 'trim|required',
            ],
            [
                'field'     => 'email',
                'label'     => 'Alamat email',
                'rules'     => 'trim|required|valid_email',
            ],
        ];

        return $validationRules;
    }

    // public function run($input) {
    //     $this->load->helper('string');

    //     $data = [
    //         'id_user'           => $input->id_user,
    //         'id_kamar'          => $input->id_kamar,
    //         'jumlah_tamu'       => $input->jumlah_tamu,
    //         'tanggal_checkin'   => $input->tanggal_checkin,
    //         'tanggal_checkout'  => $input->tanggal_checkin,
    //     ];

    //     $this->create($data);
    //     return true;
    // }
}
