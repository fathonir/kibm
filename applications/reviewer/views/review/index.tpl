{extends file='site_layout.tpl'}
{block name='head'}
	<link rel="stylesheet" href="{base_url('../assets/DataTables/datatables.min.css')}" />
	<style type="text/css">
		.table>thead>tr>th,.table>tbody>tr>td { color: #333; }
		.table-condensed>thead>tr>th,.table-condensed>tbody>tr>td { font-size: 13px; }
	</style>
{/block}
{block name='content'}
	<h2 class="page-header">{if $tahapan}{$tahapan->tahapan}{else}Penilaian KBMI{/if}</h2>

	<div class="row">
		<div class="col-lg-12">

			{if empty($smarty.get.kegiatan_id) or empty($smarty.get.tahapan_id)}
				<form class="form-inline" action="{current_url()}" method="get" style="margin-bottom: 10px" id="formFilter">
					<div class="form-group">
						<label for="kegiatan_id">Kegiatan</label>
						<select name="kegiatan_id" class="form-control input-sm">
							<option value="">-- Pilih Kegiatan --</option>
							{html_options options=$kegiatan_option_set selected=$smarty.get.kegiatan_id}
						</select>
					</div>
					<div class="form-group">
						<label for="tahapan_id">Tahapan</label>
						<select name="tahapan_id" class="form-control input-sm">
							<option value="">-- Pilih Tahapan --</option>
							{html_options options=$tahapan_option_set selected=$smarty.get.tahapan_id}
						</select>
					</div>
					<button type="submit" class="btn btn-sm btn-primary">Lihat</button>
				</form>
			{else}
				<form class="form-inline" action="{current_url()}" method="get" style="margin-bottom: 10px">
					<a href="{site_url('review')}" class="btn btn-sm btn-default" >Kembali</a>
					<div class="form-group" style="float: right">
						<label for="order_by">Urut:</label>
						<select class="form-control input-sm" name="order_by" style="display: inline-block; width: auto !important;">
							<option value="judul">Judul</option>
							<option value="nilai_asc">Belum Dinilai</option>
							<option value="nilai_desc">Sudah Dinilai</option>
						</select>
					</div>
				</form>


				<table class="table table-bordered table-striped table-condensed" id="table">
					<thead>
						<tr>
							<th>Judul</th>
							<th>Rekom</th>
							<th>Nilai</th>
							<th style="width: 33px">Aksi</th>
						</tr>
					</thead>
				</table>


			{/if}

		</div>
	</div>
{/block}
{block name='footer-script'}
	<script src="{base_url('../assets/DataTables/datatables.min.js')}"></script>
	<script type="text/javascript">

		var keg_id = '{$smarty.get.kegiatan_id}';
		var thp_id = '{$smarty.get.tahapan_id}';

		if ($('#table').length) {

			var dataTable = $('#table').DataTable({
				lengthMenu: [[10, 20, 25, 50, -1], [10, 20, 25, 50, 'Semua']],
				stateSave: true,
				ajax: '{site_url('review/index-data/')}?kegiatan_id=' + keg_id + '&tahapan_id=' + thp_id,
				ordering: false,
				columns: [
					{
						data: 'judul_display',
						render: function (data, type, row, meta) {
							return '<strong>' + data.judul + '</strong><br/><small>' + data.nama_ketua + ' - ' + data.nama_pt + '</small>';
						},
						responsivePriority: 1
					},
					{
						data: 'biaya_rekomendasi', className: 'text-center', render: $.fn.dataTable.render.number('.')
					},
					{
						data: 'nilai_reviewer', className: 'text-center', responsivePriority: 3
					},
					{
						data: 'id',
						render: function (data, type, row, meta) {
							if (thp_id === '{$smarty.const.TAHAPAN_EVALUASI}')
								return '<a class="btn btn-info" href="{site_url('review/penilaian-2019/')}' + data + '">Nilai</a>';
							else if (thp_id === '{$smarty.const.TAHAPAN_MONEV}')
								return '<a class="btn btn-info" href="{site_url('review/monev/')}' + data + '">Nilai</a>';
							else if (thp_id === '{$smarty.const.TAHAPAN_KMI_AWARD}')
								return '<a class="btn btn-info" href="{site_url('review/kmi-award/')}' + data + '">Nilai</a>';
							else
								return '';
						},
						responsivePriority: 2
					}
				],
				responsive: true
			});

			// Jika KMI Award hilangkan kolom rekom
			if (thp_id === '{$smarty.const.TAHAPAN_KMI_AWARD}') {
				dataTable.column(3).visible(false);
			} else {
				dataTable.column(3).visible(true);
			}

		}
	</script>
{/block}