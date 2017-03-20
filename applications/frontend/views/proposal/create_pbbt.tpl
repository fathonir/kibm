{extends file='site_layout.tpl'}
{block name='content'}
	<h1 class="page-header">Tambah Proposal Baru</h1>
	<div class="row">
		<div class="col-lg-12">

			<form action="{current_url()}" method="post" enctype="multipart/form-data" class="form-horizontal">
				<fieldset>
					<legend>Detail</legend>

					<div class="form-group">
						<label for="judul" class="col-lg-2 control-label">Judul Proposal</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" name="judul" placeholder="Tulis judul proposal disini" >
						</div>
					</div>

					<div class="form-group">
						<label for="kategori" class="col-lg-2 control-label">Kategori</label>
						<div class="col-lg-4">
							<select name="kategori_id" class="form-control">
								{html_options options=$kategori_set}
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-2 control-label">Ketua Pelaksana</label>
						<div class="col-lg-2">
							<input type="text" class="form-control" name="nim_ketua" placeholder="NIDN / NIDK / NUPN" >
						</div>
						<div class="col-lg-8">
							<input type="text" class="form-control" name="nama_ketua" placeholder="Nama Ketua" >
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-2 control-label">Anggota 1</label>
						<div class="col-lg-2">
							<input type="text" class="form-control" name="nim_anggota_1" placeholder="NIDN / NIDK / NUPN" >
						</div>
						<div class="col-lg-8">
							<input type="text" class="form-control" name="nama_anggota_1" placeholder="Nama Anggota 1" >
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-2 control-label">Anggota 2</label>
						<div class="col-lg-2">
							<input type="text" class="form-control" name="nim_anggota_2" placeholder="NIDN / NIDK / NUPN" >
						</div>
						<div class="col-lg-8">
							<input type="text" class="form-control" name="nama_anggota_2" placeholder="Nama Anggota 2" >
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-2 control-label">Anggota 3</label>
						<div class="col-lg-2">
							<input type="text" class="form-control" name="nim_anggota_3" placeholder="NIDN / NIDK / NUPN" >
						</div>
						<div class="col-lg-8">
							<input type="text" class="form-control" name="nama_anggota_3" placeholder="Nama Anggota 3" >
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-2 control-label">Anggota 4</label>
						<div class="col-lg-2">
							<input type="text" class="form-control" name="nim_anggota_4" placeholder="NIDN / NIDK / NUPN" >
						</div>
						<div class="col-lg-8">
							<input type="text" class="form-control" name="nama_anggota_4" placeholder="Nama Anggota 4" >
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-2 control-label">Anggota 5</label>
						<div class="col-lg-2">
							<input type="text" class="form-control" name="nim_anggota_5" placeholder="NIDN / NIDK / NUPN" >
						</div>
						<div class="col-lg-8">
							<input type="text" class="form-control" name="nama_anggota_5" placeholder="Nama Anggota 5" >
						</div>
					</div>

				</fieldset>

				<fieldset>
					<legend>Syarat Proposal</legend>
					
					{foreach $syarat_set as $syarat}
						<div class="form-group">
							<label class="col-lg-2 control-label">{$syarat->syarat}</label>
							<div class="col-lg-6">
								<input type="file" name="file_syarat_{$syarat->id}" class="filestyle" />
								<p class="help-block">{$syarat->keterangan}</p>
							</div>
							<div class="col-lg-4">
								<!-- untuk yg sudah terupload -->
							</div>
						</div>	
					{/foreach}

					<div class="form-group">
						<div class="col-lg-2"></div>
						<div class="col-lg-10"><input type="submit" value="Submit" class="btn btn-primary"/></div>
					</div>

				</fieldset>
			</form>

		</div>
	</div>
{/block}
{block name='footer-script'}
	<script src="{base_url('assets/js/bootstrap-filestyle.min.js')}" type='text/javascript'></script>
	<script>
		$(':file').filestyle();
	</script>
{/block}