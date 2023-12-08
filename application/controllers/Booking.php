<?php 

defined("BASEPATH") OR exit("No direct script access allowed"); 

class Booking extends MY_Controller {
    public function index($id) {
            $data["title"] = "Booking | Ayo Hotel";

            // Get data kamar based on the id parsed
            $this->booking->table  = 'kamar';
            $data['room'] = $this->booking->select(
                [
                    'kamar.id_kamar', 'kamar.tipe_kamar', 'kamar.image',
                    'kamar.deskripsi', 'kamar.status', 'kamar.harga',
                    'kamar.nama_kamar',
                ]
            )->where('id_kamar', $id)->first();
    
            // Get data user from session userdata
            $this->booking->table = 'user';
            $data['user'] = $this->booking->select(
                ['user.id_user', 'user.name','user.email',]
            )->where('id_user', $this->session->userdata('id_user'))->first();
    
            $data['page'] = 'pages/booking/index';
    
            $this->view($data);
  
    }

    public function create() {
        if (!$_POST) {
            $input  = (object) $this->booking->getDefaultValues();
        } else {
            $input  = (object) $this->input->post(null, true);
        }

        $data = [
            'id_user'           => $input->id_user,
            'id_kamar'          => $input->id_kamar,
            'jumlah_tamu'       => $input->jumlah_tamu,
            'tanggal_checkin'   => $input->tanggal_checkin,
            'tanggal_checkout'  => $input->tanggal_checkin,
        ];

        $this->booking->table = 'booking';
        if ($this->booking->create($data)) {
            $this->session->set_flashdata('success', 'Booking Anda berhasil dibuat!');
            redirect(base_url("booking/mybooking"));
        } else {
            $this->session->set_flashdata('error', 'Oops! Sepertinya ada yang salah!');
            redirect(base_url("booking/mybooking"));
        }
    }

    public function mybooking() {
        $data["title"] = "My Booking | Ayo Hotel";

        // Get data booking
        $data['books'] = $this->booking->select(
            [
                'booking.id_booking', 'booking.id_user','booking.id_kamar',
                'booking.jumlah_tamu', 'booking.tanggal_checkin', 'booking.tanggal_checkout',
                'booking.status', 'user.id_user', 'user.id_role', 'user.name', 'user.email'
            ]
        )->join('user')->where('booking.id_user', $this->session->userdata('id_user'))->get();
        
        // Convert tgl check-in/out
        foreach ($data['books'] as $key => $book) {
            $timeStampIn = (int)date_timestamp_get(date_create($book->tanggal_checkin));
            $timeStampOut = (int)date_timestamp_get(date_create($book->tanggal_checkout));
            $book->tanggal_checkin = date('d M, Y', $timeStampIn);
            $book->tanggal_checkout = date('d M, Y', $timeStampOut);
        };

        // Get data kamar based on the id parsed
        $this->booking->table  = 'kamar';
        $data['rooms'] = $this->booking->select(
            [
                'kamar.id_kamar', 'kamar.tipe_kamar', 'kamar.image',
                'kamar.deskripsi', 'kamar.status', 'kamar.harga',
                'kamar.nama_kamar',
            ]
        )->get();

        $data['page'] = 'pages/booking/mybooking';
    
        $this->view($data);
    }
}