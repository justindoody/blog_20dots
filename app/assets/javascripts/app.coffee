page_load = ->
  view = "Views." + $('body').data('controller') + $('body').data('action')

  window.Application = try
    eval("new #{view}()")
  catch error
    new Views.Application
  window.Application.render()


$(document).on 'page:change', ->
  page_load()

$(document).on 'page:before-change', ->
  window.Application.cleanup()
  true

window.Views ?= {}
class Views.Application
  render: ->
    ViewConcern.Contact.enable()

  cleanup: ->