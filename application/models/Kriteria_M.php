<?php

class Kriteria_M extends CI_model
{
  public function getAllKriteria()
  {
    return $this->db->get('kriteria')->result_array();
  }

  public function sumBobot()
  {
    $this->db->select_sum('bobot');
    $query = $this->db->get('kriteria');
    if ($query->num_rows() > 0) {
      return $query->row()->bobot;
    } else {
      return 0;
    }
  }

  public function KodeKriteria()
  {
    $query = $this->db->query("select max(kode_kriteria) as max_id from kriteria");
    $rows = $query->row();
    $kode = $rows->max_id;
    $noUrut = (int) substr($kode, 1, 2);
    $noUrut++;
    $char = "C";
    $kode = $char . sprintf("%s", $noUrut);
    return $kode;
  }

  public function tambahKriteria()
  {
    $jumlahB = $this->sumBobot();
    $kode = $this->KodeKriteria();

    // BELUM SESUAI !!! //
    // Cek apakah jumlah bobot masoh <10,jika iya, masukkan data, jika tidak, tampilkan error
    if ($jumlahB >= 10) {
      $this->session->set_flashdata(
        'message',
        '<div class="alert alert-danger alert-dismissible fade show" role="alert">
      Jumlah Bobot lebih dari 10, Data Kriteria Gagal ditambahkan !
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
    </div>'
      );
      redirect('kriteria');
    } else {
      $data = [
        'kode_kriteria' => $kode,
        'nama_kriteria' => $this->input->post('nama_kriteria'),
        'attribut' => $this->input->post('attribut'),
        'bobot' => $this->input->post('bobot')
      ];
      $this->db->insert('kriteria', $data);
    }
  }

  public function hapusKriteria($id)
  {
    $this->db->delete('kriteria', ['id' => $id]);
  }
}
