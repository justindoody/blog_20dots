page_load = ->
  view = "Views." + $('body').data('controller') + $('body').data('action')

  window.Application = try
    eval("new #{view}()")
  catch error
    new Views.Application
  window.Application.render()


$(document).on 'turbolinks:load', ->
  page_load()

$(document).on 'turbolinks:click', ->
  window.Application.cleanup()
  true

window.Views ?= {}
class Views.Application
  render: ->
    ViewConcern.Contact.enable()

  cleanup: ->