// App uses turbo links so I have to use page:change to detect a new page.

$(document).on("page:change", edit);

function edit() {
  if ($('#content').data("controller") == "edit") // Checks if we are on the right page
  {
    function getContent(){
      $('#post_post').val($('#post').html().trim());
    }

    function getTitle(){
      $('#post_title').val($('#post_title_t').html().trim());
    }

    var delay = (function() {
        var timer = 0;
        return function(callback, ms) {
          clearTimeout(timer);
          timer = setTimeout(callback, ms);
        };
    })();

    
    $("#post").focus();
    $('#save').hide();
      
    $("#post").keyup(function() {
      delay(function() {
        $('#save').slideDown().delay(500).fadeOut();
        getContent();
        $.ajax({
          type  : "PUT",
          url   : $('.edit_post').attr('action'),
          data  : $('.edit_post').serialize(),
          success : function() {
            $('#save').slideDown().delay(500).fadeOut();
          }
        });
      }, 750);
    });

    $("#post_title_t").keyup(function() {
      delay(function() {
        $('#save').slideDown().delay(500).fadeOut();
        getTitle();
        $.ajax({
          type  : "PUT",
          url   : $('.edit_post').attr('action'),
          data  : $('.edit_post').serialize(),
          success : function() {
            $('#save').slideDown().delay(500).fadeOut();
          }
        });
      }, 750);
    });

  }
}