<!DOCTYPE html>
<html>
	<head>
		<title>Login SIM-PKMI</title>
		<style type="text/css">
			body {
				background-color: #fff;
				margin: 40px;
				color: #4F5155;
				font-family: Verdana;
				font-size: 12px;
			}
			h2 {
				color: #444;
				background-color: transparent;
				border-bottom: 1px solid #D0D0D0;
				font-size: 26px;
				font-weight: normal;
				margin: 0 0 14px 0;
				padding: 14px 15px 10px 15px;
			}
			a {
				color: #003399;
				background-color: transparent;
				font-weight: normal;
			}
			#container {
				margin: 10px 10px 10px 3px;
				border: 1px solid #D0D0D0;
				box-shadow: 0 0 8px #D0D0D0;
			}
			#footer {
				font-size: 11px;
			}
			p {
				margin: 12px 15px 12px 15px;
			}
			ul {
				font-size: 14px;
				margin: 6px 15px 12px;
			}
			ul>li { font-size: 14px; }
			ul>li>code { font-size: 14px; }
		</style>
	</head>
	<body>
		<div id="container">
			<h2>Akun SIM-PKMI</h2>
			<p>Berikut ini informasi <i>account</i> anda untuk login ke <a href="https://sim-pkmi.ristekdikti.go.id" target="_blank">Sim-PKMI Ristekdikti</a> :</p>
			<ul>
				<li>Username : <code>{if isset($username)}{$username}{else}$username{/if}</code></li>
				<li>Password : <code>{if isset($password)}{$password}{else}$password{/if}</code></li>
			</ul>
			<p>Harap disimpan baik-baik user login ini. Untuk keamanan silahkan ganti password sesaat setelah login pertama kali.</p>
			<p></p>
			<p><i style="font-size: 11px">Email ini otomatis. Tidak perlu dibalas.</i></p>
		</div>
		<div id="footer">
			<p>&copy; SIM-PKMI - {date('Y')} </p>
		</div>
	</body>
</html>