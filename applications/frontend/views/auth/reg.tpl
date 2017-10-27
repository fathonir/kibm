{extends file='site_layout.tpl'}
{block name='head'}
	<link rel="stylesheet" href="{base_url('assets/jquery-ui-1.12.1.custom/jquery-ui.min.css')}" />
{/block}
{block name='content'}
	<h2 class="page-header">Registrasi Akun SIM-PKMI</h2>
	<div class="row">
		<div class="col-md-12">

			{if isset($error)}
				<p>{$error['message']}</p>
			{/if}

			<form action="{current_url()}" method="post" class="form-horizontal" id="signupForm" enctype="multipart/form-data">

				<!-- Multiple Radios -->
				<div class="form-group">
					<label class="col-md-3 control-label" for="program_id">Program</label>
					<div class="col-md-5">
						<label class="checkbox-inline">
							<input name="program_id" id="program_id-0" value="1" type="radio" {set_radio('program_id', '1')}> PBBT
						</label>
						<label class="checkbox-inline">
							<input name="program_id" id="program_id-1" value="2" type="radio" {set_radio('program_id', '2')}> KBMI
						</label>
						<label class="checkbox-inline">
							<input name="program_id" id="program_id-3" value="3" type="radio" {set_radio('program_id', '3')}> Expo KMI
						</label>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-3 control-label" for="perguruan_tinggi">Perguruan Tinggi</label>  
					<div class="col-md-5">
						<input type='text' class="form-control input-md" name="perguruan_tinggi" value="{set_value('perguruan_tinggi')}"/>
					</div>
				</div>

				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-3 control-label" for="lembaga_pengusul_id">Nama Lembaga</label>
					<div class="col-md-5">
						<select id="lembaga_pengusul_id" name="lembaga_pengusul_id" class="form-control">
							<option value=""></option>
							{foreach $lembaga_set as $lembaga}
								<option value="{$lembaga->id}">{$lembaga->lembaga_pengusul}</option>
							{/foreach}
						</select>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-3 control-label" for="unit_lembaga">Nama Unit</label>  
					<div class="col-md-5">
						<input id="unit_pengusul" name="unit_lembaga" class="form-control input-md" type="text" value="{set_value('unit_lembaga')}">
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-3 control-label" for="nama_pengusul">Nama Pengusul</label>  
					<div class="col-md-5">
						<input id="nama_pengusul" name="nama_pengusul" class="form-control input-md" type="text" value="{set_value('nama_pengusul')}">
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-3 control-label" for="jabatan_pengusul">Jabatan Pengusul</label>  
					<div class="col-md-5">
						<input id="jabatan_pengusul" name="jabatan_pengusul" class="form-control input-md" type="text" value="{set_value('jabatan_pengusul')}">
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-3 control-label" for="kontak_pengusul">No Kontak</label>  
					<div class="col-md-3">
						<input id="kontak_pengusul" name="kontak_pengusul" class="form-control input-md" type="text" value="{set_value('kontak_pengusul')}">
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-3 control-label" for="email">Email</label>  
					<div class="col-md-5">
						<input id="email" name="email" class="form-control input-md" type="email" value="{set_value('email')}">
					</div>
					<div class="col-md-4">
						<span class="text-warning">Email resmi unit/lembaga yg akan digunakan untuk menerima login akun.
							<strong>Tidak Boleh</strong> menggunakan email pribadi / email dosen. Misal : lpm@universitas.ac.id
						</span>
					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-3 control-label" for="file1">Scan Surat Permintaan Akun User</label>  
					<div class="col-md-5">
						<input id="file1" name="file1" class="form-control input-md" type="file">
					</div>
					<div class="col-md-4">
						<span class="text-info">File yang di ijinkan: PDF</span>
					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-3 control-label" for="singlebutton"></label>
					<div class="col-md-4">
						<button name="submit" class="btn btn-primary">Daftar</button>
					</div>
				</div>

			</form>

		</div>
	</div>
{/block}
{block name='footer-script'}
	<script src="{base_url('assets/jquery-ui-1.12.1.custom/jquery-ui.min.js')}" type="text/javascript"></script>
	<script src="{base_url('assets/js/bootstrap-filestyle.min.js')}" type='text/javascript'></script>
	<script src="{base_url('assets/js/jquery.validate.min.js')}" type="text/javascript"></script>
	<script>
		$(document).ready(function () {

			/* Autocomplete */
			$('input[name="perguruan_tinggi"]').autocomplete({
				source: '{site_url('auth/search_pt/')}',
				minLength: 6
			});

			/* File Style */
			$(':file').filestyle();

			/* Validation */
			$('#signupForm').validate({
				rules: {
					program_id: "required",
					perguruan_tinggi: "required",
					lembaga_pengusul_id: "required",
					unit_lembaga: "required",
					nama_pengusul: "required",
					jabatan_pengusul: "required",
					kontak_pengusul: "required",
					email: "required",
					file1: "required"
				},
				errorElement: "em",
				errorPlacement: function (error, element) {
					error.addClass("help-block");

					if (element.prop("type") === "checkbox") {
						error.insertAfter(element.parent("label"));
					}
					if (element.prop("type") === "radio") {
						element.parent().parent().append(error);
					}
					else {
						error.insertAfter(element);
					}
				},
				highlight: function (element, errorClass, validClass) {
					if ($(element).prop("type") === "radio") {
						$(element).parent().parent().addClass("has-error").removeClass("has-success");
					}
					else {
						$(element).parent().addClass("has-error").removeClass("has-success");
					}
					
				},
				unhighlight: function (element, errorClass, validClass) {
					if ($(element).prop("type") === "radio") {
						$(element).parent().parent().addClass("has-success").removeClass("has-error");
					}
					else {
						$(element).parent().addClass("has-success").removeClass("has-error");
					}
				}
			});
		});
	</script>
{/block}