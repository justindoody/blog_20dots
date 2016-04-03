window.Views.PostsShow ?= {}
class Views.PostsShow extends Views.Application
  render: ->
    super()
    ViewConcern.Parallax.enable()

  cleanup: ->
    super()
    ViewConcern.Parallax.cleanup()
