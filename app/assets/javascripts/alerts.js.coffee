showAlerts = ->
  notice_text = $('#notice').text()
  alert_text = $('#alert').text()
  Alertify.log.success notice_text if notice_text.length != 0
  Alertify.log.error alert_text if alert_text.length != 0
  
$(document).ready showAlerts
$(document).on('page:load', showAlerts)