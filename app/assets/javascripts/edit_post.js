// App uses turbo links so I have to use page:change to detect a new page.

$(document).on("page:change", edit);

function fx()
{

  var target=null;
  if(window.getSelection)
  {
    target=window.getSelection().getRangeAt(0).commonAncestorContainer;
    return((target.nodeType===1)?target:target.parentNode);
  }
  else if(document.selection)
  {
    var target=document.selection.createRange().parentElement();
  }
  return target;
}

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
      
      var h = $(fx()).offset().top;
      if (fx().innerHTML == "<br>"){
        $("#insert-plugin").css('top', (h) + 'px').css('display', "block");
      } else {
        $("#insert-plugin").css('display', "none");
      }
      
      delay(function() {
        getContent();
        $('#hidden_button').click();
        $('#save').slideDown().delay(500).fadeOut();
      }, 750);
    });

    $("#post_title_t").keyup(function() {
      delay(function() {
        $('#save').slideDown().delay(500).fadeOut();
        getTitle();
        $('#hidden_button').click();
      }, 750);
    });

    $(".insert-click").click(function() {
      $('.insert-click').toggleClass("turn");
      $('.insert-option').toggleClass("hide");
    });

    $("#insert-image").click(function() {

    });

    $("#cover-icon-container > input").change(function(){
        $(".cover_form").submit();
    });

    $(".post_image_form > input").change(function(){
      console.log("it changed nigga");
        $(".post_image_form").submit();
    });

  }
}