# our function that decides weather the navigation bar should have "fixed" css position or not.
stickyNav = () ->
  scrollTop = $(window).scrollTop() # our current vertical position from the top
  footerToTop = $('footer').scrollTop() + $(window).height()       
 	stickyNavTop = $('.nav').offset().top
  if scrollTop > stickyNavTop then $('.nav').addClass('sticky') else $('.nav').removeClass('sticky')

$ ->	
	$('.drop_year_selector').click( 
	  () -> ('#year_selector_drop').slideToggle(),
	  () -> $('#year_selector_drop').slideToggle()
	)

	if $('.nav').length
		stickyNav()
		$(window).on 'scroll', () -> stickyNav()