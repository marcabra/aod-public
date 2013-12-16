load_map = (year) ->
  url = switch year
    when '2012' then 'http://aod.cartodb.com/api/v2/viz/7309f942-626e-11e3-a35e-b72963cc7791/viz.json'
    when '2011' then 'http://aod.cartodb.com/api/v2/viz/b6d1d6d6-626e-11e3-8024-d7d0f26cd2e1/viz.json'
    else 'http://aod.cartodb.com/api/v2/viz/7309f942-626e-11e3-a35e-b72963cc7791/viz.json'
  cartodb.createVis('countries_map', url)

if $('#region_chart').length
  new Morris.Line
    element: 'region_chart'
    data: gon.aids
    xkey: 'year'
    ykeys: ['amount']
    labels: ['Importe']
    postUnits: ' €'

$("ul.tabs li").bind 'click', () -> 
  current_tab = $('ul li.active')
  current_tab.removeClass('active')
  $(current_tab.data('href')).hide
  $(this).addClass('active')
  $($(this).data('href')).show

$(".year_selector").bind 'click', () -> load_map($(this).data('year'))
load_map(gon.current_year) if $('#countries_map').length
  
$(".collapsable").bind 'click', () -> $(this).animate {height: '500'}, 300 
