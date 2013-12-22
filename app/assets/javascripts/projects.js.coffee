$ ->
  if $('#dataTable').length > 0
	  $('#dataTable').dataTable
	    sPaginationType: "full_numbers"
	    bJQueryUI: true
	    bProcessing: true
	    bServerSide: true
	    sAjaxSource: $('#projects').data('source')
    