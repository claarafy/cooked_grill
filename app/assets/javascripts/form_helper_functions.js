// var total = $("#order_quantity").val() * parseFloat($("#meal_price_hidden").text());
// document.getElementById('total').innerHTML = total.toFixed(2);
// alert("claculate_total ran");
$("#order_quantity").on('change', function(){
      var total = $("#order_quantity").val() * parseFloat($("#meal_price_hidden").text()) ;
      document.getElementById('total').innerHTML = total.toFixed(2);
});

if ($("#order_quantity").val() != null && $("#order_quantity").val() != ""){
  var total = $("#order_quantity").val() * parseFloat($("#meal_price_hidden").text());
  document.getElementById('total').innerHTML = total.toFixed(2);
}

$("input:checkbox").on('click', function() {
  // in the handler, 'this' refers to the box clicked on
  var $box = $(this);

  // NEW/EDIT MEAL/ORDER--> Toggle Pickup/Delivery Address Required Attribute
  if(($box.attr("id") == "meal_pickup_only") || ($box.attr("id") == "order_delivery")){
    if ($box.is(":checked")) {
      $('#meal_location').prop('required',true);
      $('#order_delivery_address').prop('required',true);
    } else {
      $('#meal_location').prop('required',false);
      $('#order_delivery_address').prop('required',false);
    }
  }

  if ($box.is(":checked")) {
    // NEW/EDIT MEAL/ORDER --> Toggle Pickup/Delivery Address Required Attribute
    if(($box.attr("id") == "meal_delivery_only") || ($box.attr("id") == "order_pickup")){
      $('#meal_location').prop('required',false);
      $('#order_delivery_address').prop('required',false);
      // $('#order_delivery').prop('required',false);
    }

    // The name of the box is retrieved using the .attr() method
    // as it is assumed and expected to be immutable
    var group = "input:checkbox[second_name='" + $box.attr("second_name") + "']";
    // The checked state of the group/box on the other hand will change
    // and the current value is retrieved using .prop() method
    $(group).prop("checked", false);
    $box.prop("checked", true);
  } else {
    $box.prop("checked", false);
  }
});

// Make sure at least one checkbox is checked
$('#order_submit').click(function() {
     checked = $("input[type=checkbox]:checked").length;
     checkboxes_exist = $("input[type=checkbox]").length;
     if(!checked && checkboxes_exist) {
       alert("Please check either the pickup or delivery option.");
       return false;
     }

   });
