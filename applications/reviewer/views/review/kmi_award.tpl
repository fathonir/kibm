{extends file='site_layout.tpl'}
{block name='head'}
	<style>
		h2.page-header { margin-bottom: 0 }
		h4.judul { color: #555555;}
		.table { font-size: 14px; }
		.form-horizontal .form-group { margin-bottom: 5px; }
		.form-horizontal .control-label { padding-top: 5px; }
		input.form-control, .input-group-addon { padding: 4px 8px; height: auto; }
		.form-control-static { padding-top: 4px; padding-bottom:4px; }
		p { margin-bottom: 5px; }
		.angka { font-size: 18px; font-weight: bold; }
		td.has-error { background-color: #f2dede; }
	</style>
{/block}
{block name='content'}
	<h2 class="page-header">{$tahapan->tahapan}</h2>

	<div class="row">
		<div class="col-lg-12">
					
			{if isset($updated)}
				{if $updated}
					<div class="alert alert-success alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<strong>Berhasil Simpan !</strong> Data penilaian sudah berhasil disimpan.
					</div>
				{else}
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<strong>Error!</strong> Terdapat isian yang tidak lengkap. Silahkan cek kembali.
					</div>
				{/if}
			{/if}
			
			<form method="post" action="{current_url()}" class="form-horizontal">
						
				<div class="form-group">
					<label class="col-md-2 col-sm-3 control-label">Judul</label>
					<div class="col-md-10 col-sm-9">
						<p class="form-control-static">{$proposal->judul}</p>
					</div>
				</div>
					
				<div class="form-group">
					<label class="col-md-2 col-sm-3 control-label">PT</label>
					<div class="col-md-10 col-sm-9">
						<p class="form-control-static">{$pt->nama_pt}</p>
					</div>
				</div>
					
				{if $kegiatan->program_id == $smarty.const.PROGRAM_EXPO}
					<div class="form-group">
						<label class="col-md-2 col-sm-3 control-label">Proposal Expo KMI</label>
						<div class="col-md-10 col-sm-9">
							<p class="form-control-static">
								{if $file_expo}
									<a href="{base_url()}../upload/usulan-expo/{$file_expo->nama_file}" target="_blank">{$file_expo->nama_asli}</a>
								{else}
									Belum Upload
								{/if}
							</p>
						</div>
					</div>	
				{/if}
			
				<table class="table table-bordered table-condensed">
					<thead>
						<tr>
							<th class="text-center">No</th>
							<th>Kriteria</th>
							<th class="text-center">Bobot</th>
							<th class="text-center">Skor</th>
							<th class="text-center">Nilai</th>
						</tr>
					</thead>
					<tbody>
						{foreach $penilaian_set as $penilaian}
							<tr>
								<td class="text-center">{$penilaian->urutan}</td>
								<td>{$penilaian->kriteria|nl2br}</td>
								<td class="text-center angka">{$penilaian->bobot}</td>
								<td {if form_error("skor[`$penilaian->komponen_penilaian_id`]")}class="text-center has-error"{else}class="text-center"{/if}>
									<select class="form-control" name="skor[{$penilaian->komponen_penilaian_id}]" 
											data-kpid="{$penilaian->komponen_penilaian_id}" data-bobot="{$penilaian->bobot}"
											style="width: auto; display: block; margin: 0 auto">
										<option value="">-- Pilih Skor --</option>
										{* Ambil dari inputan skor, jika tdk ambil dari skor di db *}
										{$selected_skor = set_value("skor[`$penilaian->komponen_penilaian_id`]", $penilaian->skor)}
										{html_options options=$skor_option_set selected=$selected_skor}
									</select>
								</td>
								<td class="text-center angka">
									<label name="nilai[{$penilaian->komponen_penilaian_id}]">{$penilaian->nilai}</label>
								</td>
							</tr>
						{/foreach}
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" class="text-right">Jumlah</td>
							<td class="text-center angka">
								<label name="nilai_reviewer">{$plot_reviewer->nilai_reviewer}</label>
							</td>
						</tr>
					</tfoot>
				</table>
					
				<div class="form-group">
					<label for="komentar">Komentar</label>
					<textarea class="form-control" rows="2" name="komentar">{set_value('komentar', $plot_reviewer->komentar)}</textarea>
				</div>
					
				<div class="form-group">
					<button type="submit" class="btn btn-primary">Simpan</button>
					<a href="{site_url('review')}?kegiatan_id={$tahapan_proposal->kegiatan_id}&tahapan_id={$tahapan_proposal->tahapan_id}" class="btn btn-default">Kembali</a>
				</div>
			</form>
		</div>
	</div>
{/block}
{block name='footer-script'}
	<script src="{base_url('../assets/js/jquery.number.min.js')}"></script>
	<script type="text/javascript">		
		$('select[name^="skor\\["]').on('change', function() {
			var skor = $(this).val();
			var bobot = $(this).data('bobot');
			var kpid = $(this).data('kpid');
			var nilai = bobot * skor;
			$('label[name="nilai\\['+kpid+'\\]"]').html(nilai);
			
			var nilai_reviewer = 0;
			$('label[name^="nilai\\["]').each(function(index, element) {
				nilai_reviewer += (parseInt($(element).html()) || 0);
			});
			$('label[name=nilai_reviewer]').html(nilai_reviewer);
		});
		
		$('input.number').number(true, 0, ',', '.');
	</script>
{/block}