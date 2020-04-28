<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Perhitungan extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();
    $this->load->model('Nilai_M');
    $this->load->model('Kriteria_M');
    $this->load->model('Kecocokan_M');
  }

  public function kecocokan()
  {
    $data['judul'] = 'Rating Kecocokan';
    $data['user'] = $this->db->get_where('user', ['email' => $this->session->userdata('email')])->row_array();
    $data['penilaian'] = $this->Nilai_M->QueryJoinNilaiAlternatif();
    $data['kriteria'] = $this->Kriteria_M->getAllKriteria();
    $data['kecocokan'] = $this->Kecocokan_M->JoinKecocokanAlternatif();

    $this->load->view('templates/header', $data);
    $this->load->view('templates/navbar', $data);
    $this->load->view('templates/sidebar', $data);
    $this->load->view('kecocokan/index', $data);
    $this->load->view('templates/footer');
  }

  public function normalisasi()
  {
    //! Buat Tampilan Halaman Normalisasi
    $data['judul'] = 'Normalisasi';
  }
}
