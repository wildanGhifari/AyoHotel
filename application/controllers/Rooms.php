<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Rooms extends MY_Controller
{

    public function index($page = null)
    {
        $data['title'] = 'Rooms | Hotel Ayo';
        $data['rooms'] = $this->rooms->select(
            [
                'kamar.id_kamar', 'kamar.tipe_kamar', 'kamar.image',
                'kamar.deskripsi', 'kamar.status', 'kamar.harga',
                'kamar.nama_kamar',
            ]
        )->where('kamar.status', 1)->paginate($page)->get();

        $data['page'] = 'pages/rooms/index';

        $this->view($data);
    }

    public function detail($id)
    {
        $data['title'] = 'Rooms Details | Hotel Ayo';
        $data['room'] = $this->rooms->where('id_kamar', $id)->first();

        // Get data testimoni
        $this->rooms->table = 'testi';
        $data['reviews'] = $this->rooms->select(
            [
                'testi.id_testi', 'testi.id_kamar',
                'testi.rating', 'testi.testimoni', 'user.name', 
                'user.email',
            ]
        )->join('user')->where('testi.id_kamar', $id)->get();

        $data['page'] = 'pages/rooms/detail';
        $data['facilities'] = json_decode($data['room']->{'fasilitas'});

        $this->view($data);
    }
}
