// App uses turbo links so I have to use page:change to detect a new page.

$(document).on("page:change", parallax);

function parallax() {
	$(window).unbind();
	if ($('body').data("controller") == "parallax") // Checks if we are on the right page
	{
		var header_height = $('#header_container_blurred').height();
		$("#sidebar").data("top", $("#sidebar").offset().top); // set original position on load
		
		// Do the following on scroll...
		$(window).bind('scroll', function(e) {
			var scrolled = $(window).scrollTop(); // Both parallax and fader need this, might as well set here.
			parallaxScroll(scrolled);

			$('#header_container_blurred').css('opacity', ((scrolled / header_height) * 2.5)); // Fader, no need for separate function
			sidebar_location(); // Freezes the sidebar once scrolled past the header
		});
		
		var post_height = $('#post_height').height(); // Height of the div containing the Date and Post Title, not changing might as well hard set

		
		function parallaxScroll(scrolledY) {		
			$('#header_container, #header_container_blurred').css('top', '-' + ((scrolledY * 0.1)) + 'px');
			var visible_container_height = ($('#header_wrapper').height() + $('#header_container').position().top) - scrolledY;
			console.log(visible_container_height);
			// Prevents post title paralax effect from going outside of the parent div
			if (visible_container_height >= post_height) {
				if (post_height > 120) {
					$('.post_title').css('top', (scrolledY * 0.75) + 'px');
				} else {
					$('.post_title').css('top', (scrolledY * 0.99) + 'px');
				}
			}
		}

		function sidebar_location() {
			if ($(window).scrollTop() > $("#sidebar").data("top") && $(window).width() > 970) { // Freeze sidebar once scrolled past header
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
	}
}