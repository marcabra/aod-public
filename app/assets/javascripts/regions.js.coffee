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

cartodb.createVis('countries_map', 'http://documentation.cartodb.com/api/v2/viz/2b13c956-e7c1-11e2-806b-5404a6a683d5/viz.json') if $('#countries_map').length
cartodb.createVis('regions_map', 'http://documentation.cartodb.com/api/v2/viz/2b13c956-e7c1-11e2-806b-5404a6a683d5/viz.json') if $('#regions_map').length
cartodb.createVis('region_map', 'http://documentation.cartodb.com/api/v2/viz/2b13c956-e7c1-11e2-806b-5404a6a683d5/viz.json', { zoomControl: false, legends: false }) if $('#region_map').length
  
$(".collapsable").bind 'click', () -> $(this).animate {height: '500'}, 300 
