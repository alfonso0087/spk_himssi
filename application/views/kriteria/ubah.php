<?php foreach ($kriteria as $k) : ?>
  <div class="modal fade ubahKriteria<?= $k['id']; ?>" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="myModalLabel2">Ubah Data Kriteria</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="<?= base_url('kriteria/ubah'); ?>" method="post">
            <input type="hidden" name="id" value="<?= $k['id']; ?>">
            <div class="form-group">
              <label for="kode">Kode Kriteria</label>
              <input type="text" class="form-control" id="kode" name="kode" value="<?= $k['kode_kriteria']; ?>" readonly>
            </div>
            <div class="form-group">
              <label for="nama_kriteria">Nama Kriteria</label>
              <input type="text" class="form-control" id="nama_kriteria" name="nama_kriteria" value="<?= $k['nama_kriteria']; ?>">
            </div>
            <!-- Attribut belum sesuai -->
            <div class="form-group">
              <label>Attribut : </label>
              <div class="form-row">
                <?php if ($k['attribut'] == "benefit") : ?>
                  <div class="icheck-primary d-inline ml-2">
                    <input type="radio" name="attribut" id="radioPrimary3" value="benefit" checked>
                    <label class="form-check-label" for="radioPrimary3">
                      Benefit
                    </label>
                  </div>
                  <div class="icheck-primary d-inline ml-2">
                    <input type="radio" name="attribut" id="radioPrimary2" value="cost">
                    <label class="form-check-label" for="radioPrimary2">
                      Cost
                    </label>
                  </div>
                <?php else : ?>
                  <div class="icheck-primary d-inline ml-2">
                    <input type="radio" name="attribut" id="radioPrimary3" value="benefit">
                    <label class="form-check-label" for="radioPrimary3">
                      Benefit
                    </label>
                  </div>
                  <div class="icheck-primary d-inline ml-2">
                    <input type="radio" name="attribut" id="radioPrimary2" value="cost" checked>
                    <label class="form-check-label" for="radioPrimary2">
                      Cost
                    </label>
                  </div>
                <?php endif; ?>
              </div>
            </div>
            <div class="form-group">
              <label for="bobot">Bobot Kriteria</label>
              <input type="text" class="form-control" id="bobot" name="bobot" value="<?= $k['bobot']; ?>">
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
          <button type="submit" class="btn btn-primary">Simpan</button>
        </div>

        </form>
      </div>
    </div>
  </div>

<?php endforeach; ?>

<!-- Select2 -->
<script src="<?= base_url('vendor'); ?>/plugins/select2/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="<?= base_url('vendor'); ?>/plugins/moment/moment.min.js"></script>
<script src="<?= base_url('vendor'); ?>/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>