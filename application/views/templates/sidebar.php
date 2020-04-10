    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <!-- Brand Logo -->
      <a href="../../index3.html" class="brand-link">
        <img src="<?= base_url('vendor'); ?>/dist/img/himssi.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-bold">HIMSSI 2019-2020</span>
      </a>

      <!-- Sidebar -->
      <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
          <div class="image">
            <img src="<?= base_url('assets/dist/img/profile/') . $user['foto']; ?>" class="img-circle elevation-5" alt="User Image">
          </div>
          <div class="info">
            <a href="#" class="d-block"><?= $user['nama_user']; ?></a>
          </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
          <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

            <!-- query menu -->
            <?php
            $role_id = $this->session->userdata('role_id');
            $queryMenu = "SELECT `user_menu`.`id`, `menu`
                          FROM `user_menu` JOIN `user_access_menu`
                          ON `user_menu`.`id` = `user_access_menu`.`menu_id`
                          WHERE `user_access_menu`.`role_id`=$role_id
                          ORDER BY `user_access_menu`.`menu_id` ASC 
                        ";
            $menu = $this->db->query($queryMenu)->result_array();

            ?>

            <!-- Looping Menu -->
            <?php foreach ($menu as $m) : ?>

              <li class="nav-header pl-3"><?= $m['menu']; ?></li>

              <!-- / Looping menu -->

              <!-- Looping sub-menu -->
              <!-- Siapkan sub menu sesuai Menu -->
              <?php
              $menu_id = $m['id'];
              $querySubMenu = "SELECT *
                               FROM `user_sub_menu` JOIN `user_menu`
                               ON `user_sub_menu`.`menu_id` = `user_menu`.`id`
                               WHERE `user_sub_menu`.`menu_id`=$menu_id
                               AND `user_sub_menu`.`is_active`=1
                ";
              $subMenu = $this->db->query($querySubMenu)->result_array();
              ?>
              <!-- /Siapkan sub menu sesuai Menu -->

              <?php foreach ($subMenu as $sm) : ?>
                <!-- Untuk menandakan Menu yang sedang dibuka -->
                <?php if ($judul == $sm['sub_menu']) : ?>
                  <li class="nav-item">
                    <a href="<?= base_url($sm['url']); ?>" class="nav-link active">
                    <?php else : ?>
                  <li class="nav-item">
                    <a href="<?= base_url($sm['url']); ?>" class="nav-link">
                    <?php endif; ?>
                    <i class="nav-icon <?= $sm['icon']; ?>"></i>
                    <p>
                      <?= $sm['sub_menu']; ?>
                    </p>
                    </a>
                  </li>
                <?php endforeach; ?>
                <!-- / Looping Sub Menu -->

              <?php endforeach; ?>

              <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->


              <!-- <li class="nav-header pl-3">Panitia</li>
            <li class="nav-item">
              <a href="../gallery.html" class="nav-link">
                <i class="nav-icon fas fa-fw fa-user"></i>
                <p>
                  My Profile
                </p>
              </a>
            </li> -->

          </ul>
        </nav>
        <!-- /.sidebar-menu -->
      </div>
      <!-- /.sidebar -->
    </aside>