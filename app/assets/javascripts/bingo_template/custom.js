//MAGNIFIC POPUP
$(document).ready(function() {
  // Slick Stuff
  $('.featured-chefs').slick({
    dots: true,
     infinite: false,
     speed: 300,
     slidesToShow: 4,
     slidesToScroll: 4,
     responsive: [
       {
         breakpoint: 1024,
         settings: {
           slidesToShow: 3,
           slidesToScroll: 3,
           infinite: true,
           dots: true
         }
       },
       {
         breakpoint: 600,
         settings: {
           slidesToShow: 2,
           slidesToScroll: 2
         }
       },
       {
         breakpoint: 480,
         settings: {
           slidesToShow: 1,
           slidesToScroll: 1
         }
       }
       // You can unslick at a given breakpoint now by adding:
       // settings: "unslick"
       // instead of a settings object
     ]
   });

  $('.images-block').magnificPopup({
    delegate: 'a',
    type: 'image',
    gallery: {
      enabled: true
    }
  });

  (function($) {

  	"use strict";

  	// TOOLTIP
  	$(".header-links .fa, .tool-tip").tooltip({
  	placement: "bottom"
  	});
  	$(".btn-wishlist, .btn-compare, .display .fa").tooltip('hide');

  	// Product Owl Carousel
  	$("#owl-latest-product").owlCarousel({
  		autoPlay: false, //Set AutoPlay to 3 seconds
  		items : 4,
  		stopOnHover : true,
  		navigation : true, // Show next and prev buttons
  		pagination : false,
  		navigationText : ["<span class='fa fa-chevron-left'></span>","<span class='fa fa-chevron-right'></span>"]
  	});
  	$("#owl-featured-product").owlCarousel({
  		autoPlay: false, //Set AutoPlay to 3 seconds
  		items : 2,
  		stopOnHover : true,
  		navigation : true, // Show next and prev buttons
  		pagination : false,
  		navigationText : ["<span class='fa fa-chevron-left'></span>","<span class='fa fa-chevron-right'></span>"]
  	});

  	// TABS
  	$('.nav-tabs a').click(function (e) {
  	e.preventDefault();
  	$(this).tab('show');
  	});

  })(jQuery);
});
