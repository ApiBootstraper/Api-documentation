//= require active_admin/base

sendSortRequestOfModel = (model_name) ->
  formData = $('#' + model_name + ' tbody').sortable('serialize')
  formData += "&" + $('meta[name=csrf-param]').attr("content") + "=" + encodeURIComponent($('meta[name=csrf-token]').attr("content"))
  $.ajax
    type: 'post'
    data: formData
    dataType: 'script'
    url: '/admin/' + model_name + '/sort'

jQuery ($) ->

  # versions
  if $('body.admin_versions.index').length
    $( "#versions tbody" ).disableSelection()
    $( "#versions tbody" ).sortable
      axis: 'y'
      cursor: 'move'
      update: (event, ui) ->
        sendSortRequestOfModel("versions")

  # services
  if $('body.admin_services.index').length
    $( "#services tbody" ).disableSelection()
    $( "#services tbody" ).sortable
      axis: 'y'
      cursor: 'move'
      update: (event, ui) ->
        sendSortRequestOfModel("services")

  # resources
  if $('body.admin_resources.index').length
    $( "#resources tbody" ).disableSelection()
    $( "#resources tbody" ).sortable
      axis: 'y'
      cursor: 'move'
      update: (event, ui) ->
        sendSortRequestOfModel("resources")