window.Views.PostsEdit ?= {}
class Views.PostsEdit extends Views.Application
  render: ->
    super()

    editor = new MediumEditor('#post', buttons: [
      'bold'
      'italic'
      'underline'
      'anchor'
      'header1'
      'header2'
      'quote'
      'unorderedlist'
      'justifyLeft'
      'justifyCenter'
      'indent'
      'outdent'
    ])

    $('#post').focus()
    $('#save').hide()
    active_image = null

    post_selection = ->
      target = window.getSelection().getRangeAt(0).commonAncestorContainer
      if target.nodeType == 1 then target else target.parentNode

    strip_content = ->
      $('#post_post').val $('#post').html().trim()

    strip_title = ->
      $('#post_title').val $('#post_title_t').html().trim()

    submit_post = ->
      $('#hidden_button').click()

    display_insert_button = ->
      if post_selection().innerHTML == '<br>'
        $('#insert-maybe').removeAttr 'id'
        post_selection().id = 'insert-maybe'
        $('#insert-plugin').css('top', $(post_selection()).offset().top + 'px').css 'display', 'block'
      else
        $('#insert-plugin').css 'display', 'none'
        $('#insert-maybe').removeAttr 'id'

    $('#post').keyup ->
      display_insert_button()

    $('#post').on 'click', (e) ->
      display_insert_button()

    $('#post_title_t').keyup debounce((->
      strip_title()
      submit_post()
    ), 750)

    ## Inline Images Editor ##
    $('.image-edit-container').toggle()

    $('.insert-click').click ->
      $('.insert-click').toggleClass 'turn'
      $('.insert-option').toggleClass 'hide'

    $('.post_image_form > input').change ->
      $('.insert-click').toggleClass 'turn'
      $('.insert-option').toggleClass 'hide'
      $('#insert-plugin').css 'display', 'none'
      $('#insert-plugin-image-button').click()

    reposition_image_editor = (image) ->
      offsets = image.offset()
      $('.image-edit-container').css('top', offsets.top + 'px').css 'left', offsets.left + 'px'

    $(document).on 'mouseenter', '.post-image', ->
      reposition_image_editor $(this)
      $('.image-edit-container').show()
      active_image = $(this)

    $('.image-edit').click ->
      active_image.removeClass().addClass('post-image')

      if $(this).hasClass('fa-align-left')
        active_image.addClass 'img-left-text-flow'

      else if $(this).hasClass('fa-align-right')
        active_image.addClass 'img-right-text-flow'

      else if $(this).hasClass('fa-align-center')
        active_image.addClass 'img-center'

      else if $(this).hasClass('fa-expand')
        active_image.addClass 'img-wide'

      else if $(this).hasClass('fa-trash')
        # TODO: actually delete on server
        active_image.remove()
        $('.image-edit-container').hide()

      reposition_image_editor $("##{active_image.attr('id')}")

  cleanup: ->
    super()
