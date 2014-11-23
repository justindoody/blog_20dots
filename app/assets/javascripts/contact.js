$(function() {
  $('#modal-wrapper').click(function () {
    $('#sidebar, #all_posts, #content, #header_wrapper').removeClass('blurred');
    $('.modal').removeClass('bounceIn').addClass('animated bounceOut');
    $('#modal-wrapper').fadeOut(300);
  });

  $('#contact_button').click(function(e) {
    e.preventDefault();
    $('#sidebar, #all_posts, #content, #header_wrapper').addClass('blurred');
    $('#modal_mask').fadeIn(200);
    $('#modal-wrapper').show();
    $('.modal').removeClass('bounceOut').delay(200).show().addClass('animated bounceIn');
  });
});
