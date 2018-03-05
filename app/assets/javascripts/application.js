// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require cable
//= require popper
//= require bootstrap-sprockets
//= require  ./template/jquery.scrollTo.min
//= require  ./template/jquery.localScroll.min
//= require  ./template/jquery-animate-css-rotate-scale
//= require  ./template/fastclick.min
//= require  ./template/jquery.animate-colors-min
//= require  ./template/jquery.animate-shadow-min
//= require  ./template/main
//= require ./pickadate/picker
//= require ./pickadate/picker.date
//= require ./pickadate/picker.time
//= require  cable
//= require  charges
//= require  form_datepicker
//= require  home
//= require  meals
//= require  orders


/* PRELOADER */

function preloader() {
if (document.images) {
  var img1 = new Image();
  var img2 = new Image();
  var img3 = new Image();
  var img4 = new Image();
  var img5 = new Image();
  var img6 = new Image();
  var img7 = new Image();
  var img8 = new Image();
  var img9 = new Image();
  var img10 = new Image();
  var img11 = new Image();
  var img12 = new Image();
  var img13 = new Image();
  var img14 = new Image();
  var img15 = new Image();
  var img16 = new Image();
  var img17 = new Image();
  var img18 = new Image();
  var img19 = new Image();
  var img20 = new Image();

  img1.src = "/assets/template/psd-4.jpg";
  img2.src = "/assets/template/font-1.jpg";
  img3.src = "/assets/template/psd-1.jpg";
  img4.src = "/assets/template/psd-2.jpg";
  img5.src = "/assets/template/ai-1.jpg";
  img6.src = "/assets/template/theme-2.jpg";
  img7.src = "/assets/template/psd-3.jpg";
  img8.src = "/assets/template/font-2.jpg";
  img9.src = "/assets/template/font-3.jpg";
  img10.src = "/assets/template/ai-2.jpg";
  img11.src = "/assets/template/icons-1.jpg";
  img12.src = "/assets/template/ui-1.jpg";
  img13.src = "/assets/template/font-5.jpg";
  img14.src = "/assets/template/theme-2.jpg";
  img15.src = "/assets/template/psd-5.jpg";
  img16.src = "/assets/template/icons-3.jpg";
  img17.src = "/assets/template/font-4.jpg";
  img18.src = "/assets/template/theme-3.jpg";
  img19.src = "/assets/template/font-6.jpg";
  img20.src = "/assets/template/theme-4.jpg";
}
}
function addLoadEvent(func) {
var oldonload = window.onload;
if (typeof window.onload != 'function') {
  window.onload = func;
} else {
  window.onload = function() {
    if (oldonload) {
      oldonload();
    }
    func();
  }
}
}
addLoadEvent(preloader);
