parallax = ->
  # Prevents post title parallax effect from going outside of the parent div
  parallax_scroll = (scrolledY) ->
    visible_container_height = $('#header_wrapper').height() - scrolledY

    if visible_container_height >= post_height
      $('#header_container_text').css 'height', visible_container_height + 'px'

  # Freezes the sidebar once scrolled past the header
  sidebar_location = (scrolledY) ->
    height = $(window).height()
    width = $(window).width()

    if scrolledY > height / 2 and width > 970
      if !@locked? || @locked == false
        $('#sidebar').css
          'position': 'fixed'
          'top': '0'
        @locked = true

    else if width > 970
      @locked = false
      # Unfreeze if you scroll back up
      $('#sidebar').css
        'position': 'static'
        'top': 'auto'

    else if width < 970
      # Taking care of the sidebar on small screens
      $('#sidebar').css
        'top': 'auto'
        'position': 'relative'

  $(window).unbind()

  if $('body').data('controller') == 'parallax'
    header_height = $('#header_wrapper').height()
    post_height = $('#post_height').height()

    # set original position on load
    $('#sidebar').data 'top', $('#sidebar').offset().top

    $(window).bind 'scroll', (e) ->
      scrolled = $(window).scrollTop()

      parallax_scroll scrolled
      sidebar_location scrolled

      # fade opacity
      $('#crisp').css 'opacity', 1 - (scrolled / header_height * 2.5)

    $(window).resize ->
      ratio = $('#header_wrapper').width() / $('#header_wrapper').height()
      if ratio > 4
        $('.bg').removeClass('height').addClass('width')
      else if ratio < 4
        $('.bg').removeClass('width').addClass('height')

$(document).on 'page:change', parallax

