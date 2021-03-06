{extends file='site_layout.tpl'}
{block name='head'}
	<style>.form-group { margin-bottom: 0 }</style>
{/block}
{block name='content'}
	<h2 class="page-header">Detail Proposal</h2>
	<div class="row">
		<div class="col-lg-12">
			<form class="form-horizontal" action="{current_url()}?{$smarty.server.QUERY_STRING}" method="post">
				<h4>Info Proposal</h4>
				<div class="form-group">
					<label class="col-md-2 control-label">Judul Proposal</label>
					<div class="col-md-10">
						<p class="form-control-static">{$data->judul}</p>
					</div>
				</div>
				{if $data->kegiatan->program_id == 2}
					<div class="form-group">
						<label class="col-md-2 control-label">Kategori</label>
						<div class="col-md-10">
							<p class="form-control-static">{$data->kategori->nama_kategori}</p>
						</div>
					</div>
				{/if}
				<div class="form-group">
					<label class="col-md-2 control-label">Ketua</label>
					<div class="col-md-10">
						<p class="form-control-static">{$data->nim_ketua} - {$data->nama_ketua}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">Anggota 1</label>
					<div class="col-md-10">
						<p class="form-control-static">{$data->nim_anggota_1} - {$data->nama_anggota_1}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">Anggota 2</label>
					<div class="col-md-10">
						<p class="form-control-static">{$data->nim_anggota_2} - {$data->nama_anggota_2}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">Anggota 3</label>
					<div class="col-md-10">
						<p class="form-control-static">{$data->nim_anggota_3} - {$data->nama_anggota_3}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">Anggota 4</label>
					<div class="col-md-10">
						<p class="form-control-static">{$data->nim_anggota_4} - {$data->nama_anggota_4}</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label">Anggota 5</label>
					<div class="col-md-10">
						<p class="form-control-static">{$data->nim_anggota_5} - {$data->nama_anggota_5}</p>
					</div>
				</div>
				<h4>File Proposal</h4>
				{foreach $data->file_proposal_set as $file_proposal}
					<div class="form-group">
						<label class="col-md-2 control-label">File</label>
						<div class="col-md-10">
							<p class="form-control-static"><a href="{$ci->config->item('global_base_url')}/index.php/download/?id={$file_proposal->id}" target="_blank">{$file_proposal->nama_asli}</a></p>
						</div>
					</div>
				{/foreach}
				<h4>Didanai</h4>
				<div class="form-group">
					<label class="col-md-2 control-label">Didanai</label>
					<div class="col-md-4">
						<select name="is_didanai" class="form-control">
							<option value="0" {if $data->is_didanai == 0}selected{/if}>TIDAK</option>
							<option value="1" {if $data->is_didanai == 1}selected{/if}>YA</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2 control-label"></label>
					<div class="col-md-4">
						<input type="submit" class="btn btn-primary" value="SIMPAN" />
						{if $data->kegiatan->program_id == 1}
							<a href="{site_url('proposal/index-pbbt')}" class="btn btn-default">Kembali</a>
						{else if $data->kegiatan->program_id == 2}
							<a href="{site_url('proposal/index-kbmi')}" class="btn btn-default">Kembali</a>
						{/if}
					</div>
				</div>
			</form>
		</div>
	</div>
{/block}
