// App uses turbo links so I have to use page:change to detect a new page.

var currentImage = "";

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

function moveImageEditor()
{
  $('.image-edit-container').css('top', ($("#"+currentImage).offset().top) + 'px').css('left', ($("#"+currentImage).offset().left) + 'px');
  console.log("this man");
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
        $("#insert-maybe").removeAttr( "id" );
        fx().id = "insert-maybe";
        $("#insert-plugin").css('top', (h) + 'px').css('display', "block");
      } else {
        $("#insert-plugin").css('display', "none");
        $("#insert-maybe").removeAttr( "id" );
      }
      
      delay(function() {
        getContent();
        $('#hidden_button').click();
        $('#save').slideDown().delay(500).fadeOut();
      }, 750);
    });

    $("#post").on("click",function(e){
      var h = $(fx()).offset().top;
      if (fx().innerHTML == "<br>"){
        /*fx().id = "insert-maybe";*/
        $("#insert-plugin").css('top', (h) + 'px').css('display', "block");
      } else {
        $("#insert-plugin").css('display', "none");
      }
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


    $("#cover-icon-container > input").change(function(){
        $(".cover_form").submit();
    });

    $(".post_image_form > input").change(function(){
        $('.insert-click').toggleClass("turn");
        $('.insert-option').toggleClass("hide");
        $("#insert-plugin").css('display', "none");
        $("#insert-plugin-image-button").click();
    });
    $('.image-edit-container').toggle();
    $(document).on("mouseenter",".post-image", function() {
      $('.image-edit-container').css('top', ($(this).offset().top) + 'px').css('left', ($(this).offset().left) + 'px').show();
      currentImage = $(this).attr('id');
      //.toggle();
    });

    $(".fa-align-left.image-edit").click(function() {
      $("#"+currentImage).removeClass().addClass('post-image img-left-text-flow');
      moveImageEditor();
    });

    $(".fa-align-right.image-edit").click(function() {
      $("#"+currentImage).removeClass().addClass('post-image img-right-text-flow');
      moveImageEditor();
    });

    $(".fa-align-center.image-edit").click(function() {
      $("#"+currentImage).removeClass().addClass('post-image img-center');
      moveImageEditor();
    });

    $(".fa-expand.image-edit").click(function() {
      $("#"+currentImage).removeClass().addClass('post-image img-wide');
      moveImageEditor();
    });

    $(".fa-trash.image-edit").click(function() {
      $("#"+currentImage).remove();
      $('.image-edit-container').hide();
    });
  }
}