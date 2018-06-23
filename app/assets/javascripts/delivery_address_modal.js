// function getAddressModal(elem) {
//   // Modal to get delivery address
//   // Get the modal
//   var modal = document.getElementById('myModal');
//
//   // Get the <span> element that closes the modal
//   var span = document.getElementsByClassName("close")[0];
//
//   span.onclick = function() {
//       modal.style.display = "none";
//   }
//   // When the user clicks anywhere outside of the modal, close it
//   window.onclick = function(event) {
//       if (event.target == modal) {
//           modal.style.display = "none";
//       }
//   }
//   modal.style.display = "block";
// }

// Added by AV calculate distance
function calculateDeliveryFee(from, to) {
    var origin = from;
    var destination = to;
    var service = new google.maps.DistanceMatrixService();
    // storeDeliveryAddress(destination);
    service.getDistanceMatrix(
        {
            origins: [origin],
            destinations: [destination],
            travelMode: google.maps.TravelMode.DRIVING,
            unitSystem: google.maps.UnitSystem.IMPERIAL, // miles and feet.
            // unitSystem: google.maps.UnitSystem.metric, // kilometers and meters.
            avoidHighways: false,
            avoidTolls: true
        }, callback);
}
// END AV


function callback(response, status) {
    if (status != google.maps.DistanceMatrixStatus.OK) {
        $('#result').html(err);
    } else {
        var origin = response.originAddresses[0];
        var destination = response.destinationAddresses[0];
        if (response.rows[0].elements[0].status === "ZERO_RESULTS") {
            $('#result').html("Better get on a plane. There are no roads between "  + origin + " and " + destination);
        } else {
            var distance = response.rows[0].elements[0].distance;
            var duration = response.rows[0].elements[0].duration;
            console.log(response.rows[0].elements[0].distance);
            var distance_in_kilo = distance.value / 1000; // the kilom
            var distance_in_mile = distance.value / 1609.34; // the mile
            var duration_text = duration.text;
            var duration_value = duration.value;

            var originID = origin.replace(/\s+/g, '').replace(/,/g,'').substring(0,7);
            var destinationID = destination.replace(/\s+/g, '').replace(/,/g,'').substring(0,7);
            var uniqueID =  originID + destinationID;
            var cost = calculateCost(distance_in_mile.toFixed(2), duration_value / 60);
            var allMeals = document.getElementsByClassName(uniqueID);
            for (var i = 0; i < allMeals.length; i++) {
              allMeals[i].innerHTML = '$' + cost;
            }
        }
    }
}

function calculateCost(distance, duration){
  var cost = 3 + (1.1 * distance) + (.11 * duration);
  return cost.toFixed(2);
}

$(function() {
    // add input listeners
    google.maps.event.addDomListener(window, 'load', function () {
        // Added by AV
        var user_delivery_address = new google.maps.places.Autocomplete(document.getElementById('default_delivery_address'));
        var cook_pickup_address = new google.maps.places.Autocomplete(document.getElementById('default_pickup_address'));
        var cook_meal_location = new google.maps.places.Autocomplete(document.getElementById('meal_location'));
        // END AV

        // var from_places = new google.maps.places.Autocomplete(document.getElementById('from_places'));
        // var to_places = new google.maps.places.Autocomplete(document.getElementById('to_places'));
        //
        // google.maps.event.addListener(from_places, 'place_changed', function () {
        //     var from_place = from_places.getPlace();
        //     var from_address = from_place.formatted_address;
        //     $('#origin').val(from_address);
        // });
        //
        // google.maps.event.addListener(to_places, 'place_changed', function () {
        //     var to_place = to_places.getPlace();
        //     var to_address = to_place.formatted_address;
        //     $('#destination').val(to_address);
        // });

    });

    // calculate distance
    // function calculateDistance() {
    //     alert("calculateDistance...");
    //     var origin = $('#origin').val();
    //     var destination = $('#destination').val();
    //     var service = new google.maps.DistanceMatrixService();
    //     storeDeliveryAddress(destination);
    //     service.getDistanceMatrix(
    //         {
    //             origins: [origin],
    //             destinations: [destination],
    //             travelMode: google.maps.TravelMode.DRIVING,
    //             unitSystem: google.maps.UnitSystem.IMPERIAL, // miles and feet.
    //             // unitSystem: google.maps.UnitSystem.metric, // kilometers and meters.
    //             avoidHighways: false,
    //             avoidTolls: false
    //         }, callback);
    // }

    // get distance results
    // function callback(response, status) {
    //     alert("Callback...");
    //     if (status != google.maps.DistanceMatrixStatus.OK) {
    //         $('#result').html(err);
    //     } else {
    //         var origin = response.originAddresses[0];
    //         var destination = response.destinationAddresses[0];
    //         if (response.rows[0].elements[0].status === "ZERO_RESULTS") {
    //             $('#result').html("Better get on a plane. There are no roads between "  + origin + " and " + destination);
    //         } else {
    //             var distance = response.rows[0].elements[0].distance;
    //             var duration = response.rows[0].elements[0].duration;
    //             console.log(response.rows[0].elements[0].distance);
    //             var distance_in_kilo = distance.value / 1000; // the kilom
    //             var distance_in_mile = distance.value / 1609.34; // the mile
    //             var duration_text = duration.text;
    //             var duration_value = duration.value;
    //             $('#in_mile').text(distance_in_mile.toFixed(2));
    //             $('#in_kilo').text(distance_in_kilo.toFixed(2));
    //             $('#duration_text').text(duration_text);
    //             $('#duration_value').text(duration_value);
    //             $('#from').text(origin);
    //             $('#to').text(destination);
    //             showEstimates(distance, duration);
    //         }
    //     }
    // }

    // print results on submit the form
    // $('#distance_form').submit(function(e){
    //     e.preventDefault();
    //     calculateDistance();
    // });
});

// Added by Avan
// function storeDeliveryAddress(address) {
//     if(typeof(Storage) !== "undefined") {
//         sessionStorage.delivery_address = address
//         if (sessionStorage.delivery_address) {
//             // sessionStorage.delivery_address = Number(sessionStorage.delivery_address)+1;
//         } else {
//             // sessionStorage.delivery_address = 1;
//         }
//         // document.getElementById("result").innerHTML = "You have clicked the button " + 	  sessionStorage.delivery_address + " time(s) in this session.";
//     } else {
//         alert("Sorry, your browser does not support web storage...");
//         // document.getElementById("result").innerHTML = "Sorry, your browser does not support web storage...";
//     }
// }
// END AV

// function showEstimates(deliveryCost, pickupTime){
//   alert("Delivery Cost is $ " + deliveryCost);
//   alert(pickupTime + " Minutes to Pickup");
// }
