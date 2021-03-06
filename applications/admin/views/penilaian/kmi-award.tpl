{extends file='site_layout.tpl'}
{block name='head'}
	<link rel="stylesheet" href="{base_url('../assets/css/dataTables.bootstrap.min.css')}" />
	<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css" />
	<style>
		.table>thead>tr>th, .table>tbody>tr>td { font-size: 13px }
		.table.table-condensed>tbody>tr>td { padding: 2px 2px; }
		.table>tbody>tr>td:nth-child(1) { text-align: center; }
		.table>tbody>tr>td:nth-child(8), .table>tbody>tr>td:nth-child(9), .table>tbody>tr>td:nth-child(10), .table>tbody>tr>td:nth-child(11) { 
			text-align: right; 
		}
		.table>tbody>tr>td:nth-child(13), .table>tbody>tr>td:nth-child(14), .table>tbody>tr>td:nth-child(15) {
			font-weight: bold;
		}
		.table>tbody>tr>td:nth-child(17) {
			background-color: #d9edf7;
			font-weight: bold;
		}
		.table>tbody>tr.afirmasi>td { background-color: yellow; }
	</style>
	
{/block}
{block name='container'}container-fluid{/block}
{block name='content'}
	<h2 class="page-header">Hasil Penilaian KMI Award</h2>
	
	<div class="row">
		<div class="col-lg-12">
			
			<form class="form-inline" action="{current_url()}" method="get" style="margin-bottom: 10px">
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
				<div class="form-group">
					<label for="kelas_presentasi_id">Kelas</label>
					<select name="kelas_presentasi_id" class="form-control input-sm">
						<option value="all">Semua</option>
						{html_options options=$kelas_option_set selected=$smarty.get.kelas_presentasi_id}
					</select>
				</div>
				<button type="submit" class="btn btn-sm btn-default">Lihat</button>
			</form>
					
			<table class="table table-bordered table-striped table-condensed" id="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Judul</th>
						<th>Kategori</th>
						<th>Perguruan Tinggi</th>
						<th>R1</th>
						<th>R2</th>
						<th>R3</th>
						<th>Rata</th>
						<th>N1</th>
						<th>N2</th>
						<th>N3</th>
						<th title="Selisih">Slsh</th>
						<th title="Total">Ttl</th>
					</tr>
				</thead>
				<tbody>
					{foreach $data_set as $data}
						<tr {if $data->is_afirmasi == 1}class="afirmasi"{/if}>
							<td>{$data@index + 1}</td>
							<td>{$data->judul}</td>
							<td>{$data->nama_kategori}</td>
							<td>{$data->nama_pt}</td>
							<td>{$data->reviewer_1}</td>
							<td>{$data->reviewer_2}</td>
							<td>{$data->reviewer_3}</td>
							<td>{$data->rata_rekomendasi|number_format:0}</td>
							<td class="text-center" style="color:black">{$data->nilai_reviewer_1}</td>
							<td class="text-center" style="color:black">{$data->nilai_reviewer_2}</td>
							<td class="text-center" style="color:black">{$data->nilai_reviewer_3}</td>
							<td class="text-center">{$data->nilai_selisih}</td>
							<td class="text-center" style="color:black;">{$data->nilai_total}</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
			
		</div>
	</div>
{/block}
{block name='footer-script'}
	<script src="{base_url('../assets/js/jquery.dataTables.min.js')}"></script>
	<script src="{base_url('../assets/js/dataTables.bootstrap.min.js')}"></script>
	<script src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
	<script src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
	<script src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
	<script src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
	<script type="text/javascript">
		$('select[name="kegiatan_id"]').on('change', function() {
			$.getJSON('{site_url('penilaian/data-kelas')}/' + $(this).val(), null, function(data) {
				$('select[name="kelas_presentasi_id"]').html('<option value="all">Semua</option>');
				$.each(data, function(key, val) {
					$('select[name="kelas_presentasi_id"]').append('<option value="'+key+'">'+val+'</option>');
				});
			});
		});
		
		$('#table').DataTable({
			paging: false,
			dom: 'Bfrtip',
			buttons: [ 'excel' ]
		});
	</script>
{/block}