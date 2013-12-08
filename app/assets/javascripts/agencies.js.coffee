if $('#agency_chart').length
  new Morris.Line
    element: 'agency_chart'
    data: gon.aids
    xkey: 'year'
    ykeys: ['amount']
    labels: ['Importe']
    postUnits: ' €'
