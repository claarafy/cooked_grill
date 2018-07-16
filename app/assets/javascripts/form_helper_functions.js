// Calcualte taxes, subtotal, total based on quantity and Price
// $("#order_quantity").on('change', function(){
//       var sub_total = $("#order_quantity").val() * parseFloat($("#meal_price_hidden").text()) ;
//       var taxes = sub_total * 0.095
//       var total = sub_total + taxes;
//       document.getElementById('total').innerHTML = sub_total.toFixed(2);
//       document.getElementById('sub_total').innerHTML = sub_total.toFixed(2);
//       document.getElementById('tax_amount').innerHTML = taxes.toFixed(2);
//       document.getElementById('total_amount').innerHTML = total.toFixed(2);
// });
//


// Setup
  if ($("#order_quantity").val() == null && $("#order_quantity").val() == ""){
    $("#order_quantity").val(1);
  }

  var include_delivery = false;
  // var delivery_cost = 2;
  var delivery_cost = parseFloat($("#delivery_amount").text().replace('$',''));
  // alert($("#delivery_amount").text());
  var sub_total = $("#order_quantity").val() * parseFloat($("#meal_price_hidden").text());
  var taxes = sub_total * 0.095
  var total;
  if(include_delivery){
    total = sub_total + taxes + delivery_cost;
  }else {
    total = sub_total + taxes;
  }

  divs = document.getElementsByClassName( 'sub_total' );
  [].slice.call( divs ).forEach(function ( div ) {
      div.innerHTML = sub_total.toFixed(2);;
  });
  if(document.getElementById('tax_amount') != null && document.getElementById('total_amount') != null){
    document.getElementById('tax_amount').innerHTML = taxes.toFixed(2);
    document.getElementById('total_amount').innerHTML = total.toFixed(2);
  }

// Increment Quantity
$("#increment_qty").on("click", function() {
  var oldValue = $("#order_quantity").val();
	var newVal = parseFloat(oldValue) + 1;
  $("#order_quantity").val(newVal);

  sub_total = $("#order_quantity").val() * parseFloat($("#meal_price_hidden").text());
  taxes = sub_total * 0.095
  if(include_delivery){
    total = sub_total + taxes + delivery_cost;
  }else {
    total = sub_total + taxes;
  }
  divs = document.getElementsByClassName( 'sub_total' );

  [].slice.call( divs ).forEach(function ( div ) {
      div.innerHTML = sub_total.toFixed(2);;
  });
  document.getElementById('tax_amount').innerHTML = taxes.toFixed(2);
  document.getElementById('total_amount').innerHTML = total.toFixed(2);
});

// Decrement Quantity
$("#decrement_qty").on("click", function() {
  var oldValue = $("#order_quantity").val();
  if(oldValue > 1){
    var newVal = parseFloat(oldValue) - 1;
  } else {
    var newVal = 1;
  }
  $("#order_quantity").val(newVal);

  sub_total = $("#order_quantity").val() * parseFloat($("#meal_price_hidden").text());
  taxes = sub_total * 0.095
  if(include_delivery){
    total = sub_total + taxes + delivery_cost;
  }else {
    total = sub_total + taxes;
  }
  divs = document.getElementsByClassName( 'sub_total' );
  [].slice.call( divs ).forEach(function ( div ) {
      div.innerHTML = sub_total.toFixed(2);;
  });
  document.getElementById('tax_amount').innerHTML = taxes.toFixed(2);
  document.getElementById('total_amount').innerHTML = total.toFixed(2);
});

// Handle Delivery and Pickup Dropdown Selection on change
$("#inputPickupDelivery").on("change", function() {
   if (this.value == "Delivery"){
     deliveryOption(true);
   } else {
    deliveryOption(false);
   }
});

// Handle Delivery and Pickup Dropdown Selection on load
 if ($("#inputPickupDelivery").val() == "Delivery"){
  deliveryOption(true);
 } else {
  deliveryOption(false);
 }

$("input:checkbox").on('click', function() {
  alert("checked");
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

// Make sure at least one checkbox selection is checked
$('#order_submit').click(function() {
     checked = $("input[type=checkbox]:checked").length;
     checkboxes_exist = $("input[type=checkbox]").length;
     dropdown_selection = $("#inputPickupDelivery").val();

     if(dropdown_selection != "Pickup" && dropdown_selection != "Delivery"){
       alert("Please select either pickup or delivery");
       return false;
     }

     if(!checked && checkboxes_exist) {
       alert("Please check either the pickup or delivery option.");
       return false;
     }
   });

 //Helper methods
 function deliveryOption(want_delivered){
   if(want_delivered){
     include_delivery = true;
     $('#delivery-panel').show();
     $('#delivery_fee').show();
     $('#order_delivery_address').prop('required',true);
     updateTotal();
   }else {
     include_delivery = false;
     $('#delivery-panel').hide();
     $('#delivery_fee').hide();
     $('#order_delivery_address').prop('required',false);
     updateTotal();
   }
 }

 function updateTotal(){
   sub_total = $("#order_quantity").val() * parseFloat($("#meal_price_hidden").text());
   delivery_cost = parseFloat($("#delivery_amount").text().replace('$',''));
   if(include_delivery){
     total = sub_total + taxes + delivery_cost;
   }else {
     total = sub_total + taxes;
   }
   divs = document.getElementsByClassName( 'sub_total' );
   [].slice.call( divs ).forEach(function ( div ) {
       div.innerHTML = sub_total.toFixed(2);;
   });
   document.getElementById('total_amount').innerHTML = total.toFixed(2);
 }
