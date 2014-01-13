load_map = (year) ->
  url = switch year
    when '2012' then 'http://aod.cartodb.com/api/v2/viz/be082d36-7986-11e3-b86c-6f645b9874e3/viz.json'
    when '2011' then 'http://aod.cartodb.com/api/v2/viz/ab1fbc66-7986-11e3-8603-1124ab83c2c9/viz.json'
    when '2010' then 'http://aod.cartodb.com/api/v2/viz/84ddb008-7986-11e3-9507-339af5eb7dd6/viz.json'
    when '2009' then 'http://aod.cartodb.com/api/v2/viz/e70bf06a-7985-11e3-a890-3d723c064bcc/viz.json'
    when '2008' then 'http://aod.cartodb.com/api/v2/viz/ad3e342e-7985-11e3-a7b8-5f0b80366dd9/viz.json'
    when '2007' then 'http://aod.cartodb.com/api/v2/viz/3f74776a-7984-11e3-a799-39bf78eac923/viz.json'
    else 'http://aod.cartodb.com/api/v2/viz/0797a842-7625-11e3-8fc5-b90814c2a349/viz.json'
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

