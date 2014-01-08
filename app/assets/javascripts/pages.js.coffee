$ ->
  if $("#graph").length
    Morris.Line
      element: 'graph'
      data: [
        { y: '2007', a: 3755 }
        { y: '2008', a: 4761 }
        { y: '2009', a: 4728 }
        { y: '2010', a: 4492 }
        { y: '2011', a: 2988 }
        { y: '2012', a: 1585 }
      ]
      xkey: 'y'
      ykeys: ['a']
      labels: ['Importe AOD']
      ymax: '5000'
      postUnits: 'M€'
      xlabels: 'year'
