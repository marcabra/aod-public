$(document).ready(function() {
	
	$('.drop_year_selector').click(
		function() {
	  		$('#year_selector_drop').slideToggle();
		}, 
		function() {
	  		$('#year_selector_drop').slideToggle();
		} 
	);
		
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