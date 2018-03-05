// 
// $(document).ready(function() {
//
// 		// Display Total On Order Form
// 		// $("#order_quantity").on('change', function(){
// 		// 			var total = $("#order_quantity").val() * parseFloat($("#meal_price_hidden").text()) ;
// 		// 			document.getElementById('total').innerHTML = total.toFixed(2);
// 		// 			alert("Change main.js")
// 		// });
//     //
// 		// if ($("#order_quantity").val() != null && $("#order_quantity").val() != ""){
// 		// 	var total = $("#order_quantity").val() * parseFloat($("#meal_price_hidden").text());
// 		// 	document.getElementById('total').innerHTML = total.toFixed(2);
// 		// 	alert("Initial main.js run")
// 		// }
//
// 		// https://stackoverflow.com/questions/9709209/html-select-only-one-checkbox-in-a-group
// 		// the selector will match all input controls of type :checkbox
// 		// and attach a click event handler
// 		$("input:checkbox").on('click', function() {
// 		  // in the handler, 'this' refers to the box clicked on
// 		  var $box = $(this);
//
// 			// NEW/EDIT MEAL --> Toggle Pickup/Delivery Address Required Attribute
// 			if(($box.attr("id") == "meal_pickup_only") || ($box.attr("id") == "order_delivery")){
// 				if ($box.is(":checked")) {
// 					$('#meal_location').prop('required',true);
// 					$('#order_delivery_address').prop('required',true);
// 				} else {
// 					$('#meal_location').prop('required',false);
// 					$('#order_delivery_address').prop('required',false);
// 				}
// 			}
//
// 		  if ($box.is(":checked")) {
// 				// NEW/EDIT MEAL --> Toggle Pickup/Delivery Address Required Attribute
// 				if(($box.attr("id") == "meal_delivery_only") || ($box.attr("id") == "order_pickup")){
// 					$('#meal_location').prop('required',false);
// 					$('#order_delivery_address').prop('required',false);
// 				}
//
// 		    // The name of the box is retrieved using the .attr() method
// 		    // as it is assumed and expected to be immutable
// 		    var group = "input:checkbox[second_name='" + $box.attr("second_name") + "']";
// 		    // The checked state of the group/box on the other hand will change
// 		    // and the current value is retrieved using .prop() method
// 		    $(group).prop("checked", false);
// 		    $box.prop("checked", true);
// 		  } else {
// 		    $box.prop("checked", false);
// 		  }
// 		});
//
// 	});
