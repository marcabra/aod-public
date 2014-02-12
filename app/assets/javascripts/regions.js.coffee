load_map = (year) ->
  url = switch year
    when '2012' then 'http://aod.cartodb.com/api/v2/viz/e34d4422-93ef-11e3-94cb-0e625a1c94a6/viz.json'
    when '2011' then 'http://aod.cartodb.com/api/v2/viz/b98ff54e-93ef-11e3-a29d-0e49973114de/viz.json'
    when '2010' then 'http://aod.cartodb.com/api/v2/viz/a6d46fca-93ef-11e3-8724-0e625a1c94a6/viz.json'
    when '2009' then 'http://aod.cartodb.com/api/v2/viz/821f2878-93ef-11e3-bbe9-0e625a1c94a6/viz.json'
    when '2008' then 'http://aod.cartodb.com/api/v2/viz/ef71d3e0-93ee-11e3-9da7-0e49973114de/viz.json'
    when '2007' then 'http://aod.cartodb.com/api/v2/viz/542ca05e-93ee-11e3-a0cb-0edd25b1ac90/viz.json'
    else 'http://aod.cartodb.com/api/v2/viz/e34d4422-93ef-11e3-94cb-0e625a1c94a6/viz.json'
  cartodb.createVis('countries_map', url, { center: [28.13966,0], zoom: 2 })

$ ->
  if $('#region_chart').length
    new Morris.Line
      element: 'region_chart'
      data: gon.aids
      xkey: 'year'
      ykeys: ['amount']
      labels: ['Importe']
      postUnits: ' €'

  $("ul.tabs li").on 'click', () -> 
    current_tab = $('ul li.active')
    current_tab.removeClass('active')
    $(current_tab.data('href')).hide
    $(this).addClass('active')
    $($(this).data('href')).show

  $(".year_selector").on 'click', () -> load_map($(this).data('year'))
  load_map(gon.current_year) if $('#countries_map').length
  
  $(".collapsable").on 'click', () -> $(this).animate {height: '500'}, 300 

  $('.tabs').on 'click', '#regions_tab', () ->
    $('#map_countries').hide()
    $('#map_regions').show()
    $('#countries_tab').removeClass('active')
    $('#regions_tab').addClass('active')
    false
  
  $('.tabs').on 'click', '#countries_tab', () ->
    $('#map_countries').show()
    $('#map_regions').hide()
    $('#countries_tab').addClass('active')
    $('#regions_tab').removeClass('active')
    return false

