<!DOCTYPE html>
<head> 
	<link rel="stylesheet" href="../{$direc_css}" type="text/css">
	<script type="text/javascript">
		function refrescar() {
			var p = window.parent;
			p.location.href='../';
		}
	</script>
</head>
<body ONLOAD="self.setTimeout('refrescar()',5000);">
	<center>
		<h1>{$mensage}</h1>
		<h3 style="color:#1B191E;font-size:40px;">{$nom_completo}</h3>
		<br>
		<h1>{$mensage1}</h1>
	</center>
</body>
</html>