// App uses turbo links so I have to use page:change to detect a new page.

$(document).on("page:change", parallax);

function parallax() {
	$(window).unbind();
	if ($('body').data("controller") == "parallax") // Checks if we are on the right page
	{
		var header_height = $('#header_wrapper').height();
		$("#sidebar").data("top", $("#sidebar").offset().top); // set original position on load
		
		// Do the following on scroll...
		$(window).bind('scroll', function(e) {
			var scrolled = $(window).scrollTop(); // Both parallax and fader need this, might as well set here.
			parallaxScroll(scrolled);

			$('#crisp').css('opacity', (1 - (scrolled / header_height) * 2.5)); // Fader, no need for separate function
			sidebar_location(scrolled); // Freezes the sidebar once scrolled past the header
		});
		
		var post_height = $('#post_height').height(); // Height of the div containing the Date and Post Title, not changing might as well hard set

		
		function parallaxScroll(scrolledY) {		
			var visible_container_height = ($('#header_wrapper').height() - scrolledY);
			
			// Prevents post title paralax effect from going outside of the parent div
			if (visible_container_height >= post_height) {
				$('#header_container_text').css('height', (visible_container_height) + 'px');
			}
		}

		function sidebar_location(scrolledY) {
			console.log($("#sidebar").data("top") - scrolledY);
			if (scrolledY > $("#sidebar").data("top") && $(window).width() > 970) { // Freeze sidebar once scrolled past header
				$('#sidebar').css({
					'position'	: 'fixed',
					'top'		: '0',
				});
			} else if ($(window).width() > 970) { // Unfreeze if you scroll back up
				$('#sidebar').css({
					'position'	: 'static',
					'top'		: 'auto',
				});
			} else if ($(window).width() < 970) { // Taking care of the sidebar on small screens
				$('#sidebar').css({
					'top'		: 'auto',
					'position'	: 'relative'
				});
			}
		}	

		$( window ).resize(function() {
			var ratio = $('#header_wrapper').width()/$('#header_wrapper').height();
			
			if (ratio > 4) {
				$('.bg').removeClass('height');
				$('.bg').addClass('width');
			} else if (ratio < 4) {
				$('.bg').removeClass('width');
				$('.bg').addClass('height');
			}
		});
	}
}