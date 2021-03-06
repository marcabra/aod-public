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
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

	<!-- Data Tables -->
	<link rel="stylesheet" href="style/dataTable.css" type="text/css" media="screen,print" />
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>

	<!-- morris.js, para el gráfico de la home - y los demás? -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>


	
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
    

</head>
<body>

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_ES/all.js#xfbml=1&appId=154735137950868";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<div id="container">

	<header class="top">
		
		<a href="?q=home"><img src="img/logo_site.png" width="475" height="57"></a>

		<ul class="primary_links">
			<li class="sec_paises"><a href="?q=paises">Paises</a></li>
			<li class="sec_temas"><a href="?q=temas">Temas</a></li>
			<li class="sec_organismos"><a href="?q=organismos">Organismos</a></li>
		</ul>

		<ul class="secondary_links">
			<li><a href="?q=acerca_de">Acerca de este proyecto</a></li>
		</ul>

	</header>


	<?php

	$pagina = $_GET['q'];
	
	if($pagina) {
		if(file_exists($pagina.".html")) {
			include('./'.$pagina.".html");
		}
	}
	else {
		include('./home.html');	
	}	


	?>


	<footer id="footer"> 
		
		<a href="?q=acerca_de">Acerca de</a> ·
		<a href="?q=acerca_de#contacto">Contacto</a>

		<div class="social_links">
			
			<a href="https://twitter.com/share" class="twitter-share-button" data-lang="es" data-hashtags="ayudaaldesarrollo">Twittear</a>
			<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

			<br><br>
			
			<div class="fb-like" data-href="http://ayudaaldesarrollo.es" data-layout="standard" data-action="like" data-show-faces="true" data-share="false"></div>

		</div>



		<ul class="primary_links">
			<li class="sec_paises"><a href="?q=paises">Paises</a></li>
			<li class="sec_temas"><a href="?q=temas">Temas</a></li>
			<li class="sec_organismos"><a href="?q=organismos">Organismos</a></li>
		</ul>

		<div class="logos_colabs">

			<p>Proyecto desarrollado con el apoyo de:</p>

			<a href="http://journalismgrants.org/"><img src="img/logo_colab_1.png" width="130" height="46"></a>
			<a href="http://www.gatesfoundation.org/"><img src="img/logo_colab_2.png" width="130" height="46"></a>
			<a href="http://ejc.net/"><img src="img/logo_colab_3.png" width="130" height="46"></a>

		</div>

	</footer>

</div>





<script type="text/javascript">

$(document).ready(function() {
	
	$('#tab_regions').click(
		function() {
	  		$('#map_countries').hide();
	  		$('#map_regions').show();
	  		$('#tab_countries').removeClass('active');
	  		$('#tab_regions').addClass('active');
	  		return false;
		}
	);
	$('#tab_countries').click(
		function() {
	  		$('#map_countries').show();
	  		$('#map_regions').hide();
	  		$('#tab_countries').addClass('active');
	  		$('#tab_regions').removeClass('active');
	  		return false;
		}
	);

	
	$('.drop_year_selector').click(
		function() {
	  		$('#year_selector_drop').slideToggle();
		}, 
		function() {
	  		$('#year_selector_drop').slideToggle();
		} 
	);
	
	$('#dataTable').dataTable();

	$(function() {
    	$('.tooltip').tooltip({
	      show: null,
	      position: {
	        my: "left top",
	        at: "left bottom"
	      },
	      open: function( event, ui ) {
	        ui.tooltip.animate({ top: ui.tooltip.position().top + 10 }, "fast" );
	      }
	    });
  	});

	if ($('.nav').length) {	

	  	// grab the initial top offset of the navigation 
	   	var stickyNavTop = $('.nav').offset().top;
	   	
	   	// our function that decides weather the navigation bar should have "fixed" css position or not.
	   	var stickyNav = function(){
		    var scrollTop = $(window).scrollTop(); // our current vertical position from the top
		    var footerToTop = $('footer').scrollTop() + $(window).height();
		         
		    // if we've scrolled more than the navigation, change its position to fixed to stick to top,
		    // otherwise change it back to relative
		    if (scrollTop > stickyNavTop) { 
		        $('.nav').addClass('sticky');
		    } else {
		        $('.nav').removeClass('sticky'); 
		    }

		};

		stickyNav();
		// and run it again every time you scroll
		$(window).scroll(function() {
			stickyNav();
		});
		
	}
	
});

</script>

</body>
</html>



