$(document).on("page:change", contact);

function contact() {
  $('#modal_mask').click(function () {
    $(this).fadeOut(200);
    $('.modal').removeClass('bounceIn').addClass('animated bounceOut');
  });

  $('#contact_button').click(function(e) {
    e.preventDefault();
    $('#modal_mask').fadeIn(200);
    $('.modal').removeClass('bounceOut').delay(200).show().addClass('animated bounceIn');
  });
}