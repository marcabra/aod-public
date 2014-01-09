$ ->
  if $("#graph").length
    Morris.Line
  	  element: 'graph'
  	  data: [
  	    { y: '2006', a: null }
  	    { y: '2007', a: 3754 }
  	    { y: '2008', a: 4762 }
  	    { y: '2009', a: 4728 }
  	    { y: '2010', a: 4491 }
  	    { y: '2011', a: 2987 }
  	    { y: '2012', a: 1585 }
  	    { y: '2013', a: null }
  	  ]
  	  xkey: 'y'
  	  ykeys: ['a']
  	  labels: ['Importe AOD neta']
  	  ymax: '5000'
  	  postUnits: 'M€'
  	  xlabels: 'year'
