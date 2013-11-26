<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<html>
  <head>
    <meta charset="utf-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="og:url" content="">
    <meta name="og:site_name" content="El Impacto de la Ayuda Oficial al Desarrollo">
    <meta name="og:title" content="El Impacto de la Ayuda Oficial al Desarrollo">
    <meta name="og:description" content=" ... ">
    <meta name="og:type" content="website">
    <meta name="og:image" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>El Impacto de la Ayuda Oficinal al Desarrollo (España) - 2007-2012</title>

    <link rel="stylesheet" href="style/style.css" type="text/css" media="screen,print" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

	<!-- TODO move to its own file -->
	<script type="text/javascript">
	$(document).ready(function(){
	     $(window).scroll(function(){
	         if ($(window).scrollTop() > 70){
	            $(".navigation").addClass("mod-header-fixed");
	         } else if ($(window).scrollTop() < 70) {
	            $(".navigation").removeClass("mod-header-fixed");
	         }
	    });
	});
	</script>
	
    
</head>
<body>

<div id="container">

	<header class="top">
		
		<a href="?q=home"><img src="img/logo_site.png" width="475" height="57"></a>

		<ul class="primary_links">
			<li class="sec_organismos"><a href="?q=organismos">Organismos</a></li>
			<li class="sec_temas"><a href="?q=temas">Temas</a></li>
			<li class="sec_paises"><a href="?q=paises">Paises</a></li>
		</ul>

		<ul class="secondary_links">
			<li><a href="?q=acerca_de">Acerca de este proyecto</a></li>
		</ul>

	</header>


	<?php

	$pagina = $_GET['q'];

	if($pagina) {
		include($pagina.".html");
	}
	else {
		echo "no encuentro el partial";
	}

	?>


	<footer> 
		FOOOTER
	</footer>

</div>





<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-T92TFV"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-T92TFV');</script>
<!-- End Google Tag Manager -->



<!-- check http://help.typekit.com/customer/portal/articles/6852 if strange things happen at load -AO -->
<script type="text/javascript">
  (function() {
    var config = {
      kitId: 'tux7zlf',
      scriptTimeout: 3000
    };
    var h=document.getElementsByTagName("html")[0];h.className+=" wf-loading";var t=setTimeout(function(){h.className=h.className.replace(/(\s|^)wf-loading(\s|$)/g," ");h.className+=" wf-inactive"},config.scriptTimeout);var tk=document.createElement("script"),d=false;tk.src='//use.typekit.net/'+config.kitId+'.js';tk.type="text/javascript";tk.async="true";tk.onload=tk.onreadystatechange=function(){var a=this.readyState;if(d||a&&a!="complete"&&a!="loaded")return;d=true;clearTimeout(t);try{Typekit.load(config)}catch(b){}};var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(tk,s)
  })();
</script>



</body>
</html>



