if $('#topic_chart').length
  new Morris.Line
    element: 'topic_chart'
    data: gon.aids
    xkey: 'year'
    ykeys: ['amount']
    postUnits: 'M€'
