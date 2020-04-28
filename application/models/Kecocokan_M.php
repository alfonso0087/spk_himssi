<?php

class Kecocokan_M extends CI_model
{
  // ? Query Untuk menampilkan kd.Alternatif-Nama-dan seluruh isi tabel Kecocokan
  public function JoinKecocokanAlternatif()
  {
    $query = "SELECT `alternatif`.`id_alternatif`, `alternatif`.`kode_alternatif`,`alternatif`.`nama`,`kecocokan`.*
                FROM `kecocokan`JOIN `alternatif`
                ON `kecocokan`.`id_nilai`=`alternatif`.`id_alternatif`
                WHERE `kecocokan`.`id_nilai`=`alternatif`.`id_alternatif`
                ";
    return $this->db->query($query)->result_array();
  }
}
