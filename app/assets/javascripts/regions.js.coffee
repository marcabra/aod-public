load_map = (year) ->
  url = switch year
    when '2012' then 'http://aod.cartodb.com/api/v2/viz/0797a842-7625-11e3-8fc5-b90814c2a349/viz.json'
    when '2011' then 'http://aod.cartodb.com/api/v2/viz/f825d082-7624-11e3-9108-a7f4821d3a89/viz.json'
    when '2010' then 'http://aod.cartodb.com/api/v2/viz/e5bfee96-7624-11e3-8655-bd7130932d76/viz.json'
    when '2009' then 'http://aod.cartodb.com/api/v2/viz/ce3e70d0-7624-11e3-b2b1-b396f9393345/viz.json'
    when '2008' then 'http://aod.cartodb.com/api/v2/viz/b3d6e5e2-7624-11e3-aeee-b78383615a4f/viz.json'
    when '2007' then 'http://aod.cartodb.com/api/v2/viz/9983d15a-7624-11e3-847d-bba7f41e5de5/viz.json'
    else 'http://aod.cartodb.com/api/v2/viz/0797a842-7625-11e3-8fc5-b90814c2a349/viz.json'
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
