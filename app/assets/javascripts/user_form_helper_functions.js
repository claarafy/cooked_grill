$(document).ready(function() {
  if ($('#user_driver').is(":checked")) {
    $('#user_phone_number').prop('required',true);
  }
});

$("input:checkbox").on('click', function() {
  // in the handler, 'this' refers to the box clicked on
  var $box = $(this);
  if ($box.is(":checked") && $box.attr("id") == "user_driver") {
    $('#user_phone_number').prop('required',true);
  } else {
    $('#user_phone_number').prop('required',false);
  }
});
