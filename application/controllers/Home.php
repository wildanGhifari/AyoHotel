<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Home extends MY_Controller
{

    public function index($page = null)
    {
        $data['title'] = 'Home | Hotel Ayo';
        $data['rooms'] = $this->home->select(
            [
                'kamar.id_kamar', 'kamar.tipe_kamar', 'kamar.image',
                'kamar.deskripsi', 'kamar.status', 'kamar.harga',
                'kamar.nama_kamar',
            ]
        )->where('kamar.status', 1)->paginate($page)->get();

        // Get data testimoni
        $this->home->table = 'testi';
        $data['reviews'] = $this->home->select(
            [
                'testi.id_testi', 'testi.id_kamar',
                'testi.rating', 'testi.testimoni', 'user.name', 
                'user.email',
            ]
        )->join('user')->get();

        $data['page'] = 'pages/home/index';

        $this->view($data);
    }
}
