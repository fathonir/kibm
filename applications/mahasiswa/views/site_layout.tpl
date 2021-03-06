{doctype('html5')}
<html lang="id">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Kompetisi Inovasi Bisnis Mahasiswa (KIBM)</title>
		{if ENVIRONMENT == 'development'}
			<link href="{base_url('../vendor/thomaspark/bootswatch/lumen/bootstrap.min.css')}" rel="stylesheet"/>
		{/if}
		{if ENVIRONMENT == 'production'}
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/3.3.7/lumen/bootstrap.min.css" crossorigin="anonymous">
		{/if}
		<link href="{base_url('../assets/css/site.css')}" rel="stylesheet"/>
		{block name='head'}
		{/block}
	</head>
	<body>
		<!-- Fixed navbar -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					{if $ci->session->user}
						<a class="navbar-brand" href="{site_url('home')}">KIBM</a>
					{else}
						<a class="navbar-brand" href="{base_url()}">KIBM</a>
					{/if}
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					{if $ci->session->user}
						<ul class="nav navbar-nav">
                            <li>
                                <a href="{site_url()}">Beranda</a>
                            </li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							{if $ci->session->user}
								<li>
									<a href="{site_url('auth/logout')}">Logout ({$ci->session->user->mahasiswa->nama})</a>
								</li>
							{/if}
						</ul>
					{/if}

				</div><!--/.nav-collapse -->
			</div>
		</nav>

		<!-- Begin page content -->
		<div class="container">
			{if isset($debug_vars)}
				<div class="row">
					<div class="col-lg-12">
						{foreach $debug_vars as $debug_var}
							<pre class="pre-scrollable" style="font-size: x-small">{$debug_var|htmlentities}</pre>
						{/foreach}
					</div>
				</div>
			{/if}
			{block name='content'}
			{/block}
		</div>

		<footer class="footer">
			<div class="container">
				<p class="text-center">&copy; 2020 Pusat Prestasi Nasional<br/>
					Jl. Jenderal Sudirman, Senayan, Jakarta 10270<br/>
					<a href="http://pusatprestasinasional.kemdikbud.go.id">pusatprestasinasional.kemdikbud.go.id</a></p>
			</div>
		</footer>

		{if ENVIRONMENT == 'development'}
			<script src="{base_url('../vendor/components/jquery/jquery.js')}"></script>
			<script src="{base_url('../vendor/twbs/bootstrap/dist/js/bootstrap.js')}"></script>
		{/if}
		{if ENVIRONMENT == 'production'}
			<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		{/if}
		{block name='footer-script'}
		{/block}
	</body>
</html>
