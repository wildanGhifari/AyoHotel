<?php 

defined("BASEPATH") OR exit("No direct script access allowed");

class Signup extends My_Controller {
    public function __construct() {
        parent::__construct();
        $is_login   = $this->session->userdata('is_login');

        if ($is_login) {
            redirect(base_url());
            return;
        }
    }

    public function index() {
        if (!$_POST) {
            $input  = (object) $this->signup->getDefaultValues();
        } else {
            $input  = (object) $this->input->post(null, true);
        }

        if (!$this->signup->validate()) {
            $data['title']  = 'Signup | Ayo Hotel';
            $data['input']  = $input;
            
            $this->load->view('pages/auth/signup', $data);
            return;
        }

        if ($this->signup->run($input)) {
            $this->session->set_flashdata('success', 'Registrasi anda berhasil, selamat datang!');

            redirect(base_url('/login'));
        } else {
            $this->session->set_flashdata('error', 'Oops! Something went wrong');
            redirect(base_url('/signup'));
        }
    }
}

?>