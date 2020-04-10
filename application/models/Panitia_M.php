<?php

class Panitia_M extends CI_model
{
  public function ubahProfil()
  {
    $email = $this->input->post('email');
    $nama = $this->input->post('nama');

    // Cek jika ada gambar yang diupload
    $upload_gambar = $_FILES['gambar']['name'];

    if ($upload_gambar) {
      $config['allowed_types'] = 'jpg|png|jpeg';
      $config['max_size']     = '24800';
      $config['upload_path'] = './assets/dist/img/profile/';

      $this->load->library('upload', $config);

      if ($this->upload->do_upload('gambar')) {
        // update nama file di tabelnya
        // nama gambar lama
        // $gambar_lama = $data['user']['foto'];
        // if ($gambar_lama != 'default.jpg') {
        //   unlink(FCPATH . 'assets/dist/img/profile/' . $gambar_lama);
        // }

        // nama gambar baru
        $gambar_baru = $this->upload->data('file_name');
        $this->db->set('foto', $gambar_baru);
      } else {
        echo $this->upload->display_errors();
      }
    }

    $this->db->set('nama_user', $nama);
    $this->db->where('email', $email);
    $this->db->update('user');
  }

  public function ubahPassword($acak_pass)
  {
    $this->db->set('password', $acak_pass);
    $this->db->where('email', $this->session->userdata('email'));
    $this->db->update('user');
  }
}
