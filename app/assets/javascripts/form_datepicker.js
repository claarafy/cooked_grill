$(document).ready(function() {

  var datepicker_from = $('#date_from').pickadate({
      container: '#outlet_from',
      onSet: function(item) {
          if ( 'select' in item ) setTimeout( timepicker_from.open, 0 )
      }
  }).pickadate('picker')

  var timepicker_from = $('#time_from').pickatime({
      container: '#outlet_from',
      onRender: function() {
          $('<button>back to date</button>').
              on('click', function() {
                  timepicker_from.close()
                  datepicker_from.open()
              }).prependTo( this.$root.find('.picker__box') )
      },
      onSet: function(item) {
          if ( 'select' in item ) setTimeout( function() {
              $datetime_from.
                  off('focus').
                  val( datepicker_from.get() + ' @ ' + timepicker_from.get() ).
                  focus().
                  on('focus', datepicker_from.open)
          }, 0 )
      }
  }).pickatime('picker')

  if (datepicker_from !== 'undefined' && datepicker_from != null){
    var $datetime_from = $('#meal_availability_from').
    on('focus', datepicker_from.open).
    on('click', function(event) { event.stopPropagation();
      datepicker_from.open() })
    }

// ------------------------------------------------------------------


  	var datepicker = $('#date_to').pickadate({
  			container: '#outlet_to',
  			onSet: function(item) {
  					if ( 'select' in item ) setTimeout( timepicker.open, 0 )
  			}
  	}).pickadate('picker')

  	var timepicker = $('#time_to').pickatime({
  			container: '#outlet_to',
  			onRender: function() {
  					$('<button>back to date</button>').
  							on('click', function() {
  									timepicker.close()
  									datepicker.open()
  							}).prependTo( this.$root.find('.picker__box') )
  			},
  			onSet: function(item) {
  					if ( 'select' in item ) setTimeout( function() {
  							$datetime_to.
  									off('focus').
  									val( datepicker.get() + ' @ ' + timepicker.get() ).
  									focus().
  									on('focus', datepicker.open)
  					}, 0 )
  			}
  	}).pickatime('picker')

    if (datepicker !== 'undefined' && datepicker != null){
    	var $datetime_to = $('#meal_availability_to').
    	on('focus', datepicker.open).
    	on('click', function(event) { event.stopPropagation(); datepicker.open() })
    }
  });


// ------------------------------------------------------------------

var datepicker = $('#date').pickadate({
        container: '#outlet',
        onSet: function(item) {
            if ( 'select' in item ) setTimeout( timepicker.open, 0 )
        }
    }).pickadate('picker')

var timepicker = $('#time').pickatime({
        container: '#outlet',
        onRender: function() {
            $('<button>back to date</button>').
                on('click', function() {
                    timepicker.close()
                    datepicker.open()
                }).prependTo( this.$root.find('.picker__box') )
        },
        onSet: function(item) {
            if ( 'select' in item ) setTimeout( function() {
                $datetime.
                    off('focus').
                    val( datepicker.get() + ' @ ' + timepicker.get() ).
                    focus().
                    on('focus', datepicker.open)
            }, 0 )
        }
    }).pickatime('picker')

if (datepicker !== 'undefined' && datepicker != null){
  var $datetime = $('#datetime').
      on('focus', datepicker.open).
      on('click', function(event) { event.stopPropagation(); datepicker.open() })
}
