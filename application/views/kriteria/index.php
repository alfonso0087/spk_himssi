<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1><?= $judul; ?></h1>
        </div>

      </div>
    </div><!-- /.container-fluid -->
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row pl-3">
      <div class="col lg-10">

        <a href="" class="btn btn-primary" data-toggle="modal" data-target="#kriteriabaru">Tambah Kriteria Baru</a>

        <?= $this->session->flashdata('message'); ?>


        <table id="tabelKriteria" class="table table-bordered  table-hover">
          <caption>Jumlah Bobot: <?= $jumlah; ?> </caption>
          <thead>
            <tr>
              <th>No</th>
              <th>Kode Kriteria</th>
              <th>Kriteria</th>
              <th>Attribut</th>
              <th>Bobot</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1; ?>
            <?php foreach ($kriteria as $k) : ?>
              <tr>
                <td><?= $i; ?></td>
                <td><?= $k['kode_kriteria']; ?></td>
                <td><?= $k['nama_kriteria']; ?></td>
                <td><?= $k['attribut']; ?></td>
                <td><?= $k['bobot']; ?></td>
                <td>
                  <a href="" class="badge badge-success">Ubah</a>
                  <a href="<?= base_url('kriteria/hapus/') . $k['id']; ?>" onclick="return confirm('Data akan dihapus');" class="badge badge-danger">Hapus</a>
                </td>
              </tr>
              <?php $i++; ?>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    </div>


  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->

<!-- Modal -->
<div class=" modal fade" id="kriteriabaru" tabindex="-1" role="dialog" aria-labelledby="menubaruLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="menubaruLabel">Tambahkan Kriteria Baru</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="<?= base_url('kriteria/tambah'); ?>" method="POST">
        <div class="modal-body">
          <div class="form-group">
            <label for="kode">Kode Kriteria</label>
            <input type="text" class="form-control" id="kode" name="kode" value="<?= $kode; ?>" readonly>
          </div>
          <div class="form-group">
            <label for="nama_kriteria">Nama Kriteria</label>
            <input type="text" class="form-control" id="nama_kriteria" name="nama_kriteria" placeholder="Kriteria">
          </div>
          <div class="form-group">
            <label>Attribut : </label>
            <div class="form-row">
              <div class="form-check pl-4 col-md-5 ml-auto">
                <input class="form-check-input" type="radio" name="attribut" id="attribut1" value="benefit">
                <label class="form-check-label" for="attribut1">
                  Benefit
                </label>
              </div>
              <div class="form-check col-md-6 ml-auto">
                <input class="form-check-input" type="radio" name="attribut" id="attribut2" value="cost">
                <label class="form-check-label" for="attribut2">
                  Cost
                </label>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="bobot">Bobot Kriteria</label>
            <input type="text" class="form-control" id="bobot" name="bobot" placeholder="Bobot">
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
          <button type="submit" class="btn btn-primary">Tambah</button>
        </div>
      </form>
    </div>
  </div>
</div>
</div>