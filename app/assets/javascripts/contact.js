$(document).on("page:change", contact);

function contact() {
  $('#modal_mask').click(function () {
    $(this).fadeOut(200);
    $('#sidebar, #all_posts, #content, #header_wrapper').removeClass('blurred');
    $('.modal').removeClass('bounceIn').addClass('animated bounceOut');
  });

  $('#contact_button').click(function(e) {
    e.preventDefault();
    $('#sidebar, #all_posts, #content, #header_wrapper').addClass('blurred');
    $('#modal_mask').fadeIn(200);
    $('.modal').removeClass('bounceOut').delay(200).show().addClass('animated bounceIn');
  });
}