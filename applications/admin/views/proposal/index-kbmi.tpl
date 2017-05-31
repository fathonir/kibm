{extends file='site_layout.tpl'}
{block name='head'}
	<link rel="stylesheet" href="{base_url('../assets/css/dataTables.bootstrap.min.css')}" />
	<style>
		.table>thead>tr>th, .table>tbody>tr>td { font-size: 13px; }
	</style>
{/block}
{block name='content'}
	<h2 class="page-header">Daftar Proposal KBMI Masuk</h2>

	<div class="row">
		<div class="col-lg-12">
			<table class="table table-bordered table-striped table-condensed" id="table">
				<thead>
					<tr>
						<th>Judul</th>
						<th>Kategori</th>
						<th>Perguruan Tinggi</th>
						<th>Kelengkapan</th>
						<th>Waktu Upload</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					{foreach $data_set as $data}
						<tr>
							<td>{$data->judul}</td>
							<td>{$data->nama_kategori}</td>
							<td>{$data->nama_pt}</td>
							<td>
								{if $data->jumlah_syarat == $data->syarat_terupload}
									<span class="label label-success">LENGKAP</span>
								{else if $data->syarat_wajib == $data->syarat_wajib_terupload}
									<span class="label label-info">CUKUP MINIMAL</span>
								{else}
									<span class="label label-warning">BELUM LENGKAP</span>
								{/if}
							</td>
							<td>{$data->waktu}</td>
							<td>
								<a href="{site_url("proposal/view?id={$data->id}")}" class="btn btn-xs btn-default">Lihat</a>
							</td>
						</tr>
					{foreachelse}
						<tr>
							<td colspan="6">Tidak ada data ditemukan</td>
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
	<script type="text/javascript">
		$('#table').DataTable({
			columnDefs: [
				{ targets: [-1], orderable: false }
			],
			stateSave: true
		});
	</script>
{/block}