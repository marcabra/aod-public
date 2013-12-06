if $('#region_chart').length
  new Morris.Line
    element: 'region_chart'
    data: gon.aids
    xkey: 'year'
    ykeys: ['amount']
    postUnits: ' M€'
