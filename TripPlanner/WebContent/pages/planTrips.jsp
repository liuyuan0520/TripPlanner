<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Google Maps JavaScript API v3 Example: Transit</title>
    <script
      src="//maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="http://vitalets.github.io/combodate/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="http://vitalets.github.io/combodate/prettify/prettify-bootstrap.css">
	<link rel="stylesheet" href="http://www.jqueryrain.com/wp-content/plugins/wp-bar/wpbar.css">
	
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script src="http://vitalets.github.io/combodate/momentjs/moment.min.2.5.0.js"></script>
  <script src="http://platform.twitter.com/widgets.js"></script>
  <script src="https://mc.yandex.ru/metrika/watch.js"></script>
  <script src="../dist/js/combodate.js"></script>
  <script src="http://vitalets.github.io/combodate/prettify/prettify.js"></script>
    <style type="text/css">
      html, body {
        height: 100%;
        padding: 0;
        margin: 0;
        color: black;
        font-family: arial,sans-serif;
        font-size: 13px;
      }
	
/*       #map {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 50%;
      } */

      #panel-wpr {
        position: absolute;
        top: 30;
        bottom: 70;
        left: 0;
        right: 0;
        overflow: auto;
      }

      #panel {
        font-family: arial;
        padding: 0 5px;
      }

      #info {
        padding: 5px;
      }

      #from {
        width: 90%;
        font-size: 1.2em;
      }
      
      #to {
        width: 90%;
        font-size: 1.2em;
      }
      .formfield {
    	vertical-align: middle;
	  }
      .adp-directions {
        width: 100%;
      }

      .input {
        background-color: white;
        padding-left: 8px;
        border: 1px solid #D9D9D9;
        border-top: 1px solid silver;
        -webkit-border-radius: 1px;
        -moz-border-radius: 1px;
        border-radius: 1px;
      }

/*       .time {
        margin: 0;
        height: 17px;
        border: 1px solid;
        border-top-color: #CCC;
        border-right-color: #999;
        border-left-color: #999;
        border-bottom-color: #CCC;
        padding: 2px 15px 1px 1px;
      } */

/*       button {
        border: 1px solid #3079ED;
        color: white;
        background-color: #4D90FE;
        background-image: -webkit-gradient(linear,left top,left bottom,from(#4D90FE),to(#4787ED));
          background-image: -webkit-linear-gradient(top,#4D90FE,#4787ED);
          background-image: -moz-linear-gradient(top, #4D90FE,#4787ED);
          background-image: -ms-linear-gradient(top,#4D90FE,#4787ED);
          background-image: -o-linear-gradient(top,#4D90FE,#4787ED);
          background-image: linear-gradient(top,#4D90FE, #4787ED);
          filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#4d90fe',EndColorStr='#4787ed');
          display: inline-block;
          min-width: 54px;
          text-align: center;
          font-weight: bold;
          padding: 0 8px;
          line-height: 27px;
          -webkit-border-radius: 2px;
          -moz-border-radius: 2px;
          border-radius: 2px;
          -webkit-transition: all 0.218s;
          -moz-transition: all 0.218s;
          -o-transition: all 0.218s;
          transition: all 0.218s;
          } */

        #info div {
          line-height: 22px;
          font-size: 110%;
          }

        .btn {
        }

        #panel-wpr {
          border-left: 1px solid #e6e6e6;
        }

        #info {
          border-bottom: 1px solid #E6E6E6;
          margin-bottom: 5px;
        }

        h2 {
          margin: 0;
          padding: 0;
        }

    </style>

    <script>
/*       var directions = new google.maps.DirectionsService();
      var renderer = new google.maps.DirectionsRenderer(); */
      
      var dateFormat = function () {
    		var	token = /d{1,4}|m{1,4}|yy(?:yy)?|([HhMsTt])\1?|[LloSZ]|"[^"]*"|'[^']*'/g,
    			timezone = /\b(?:[PMCEA][SDP]T|(?:Pacific|Mountain|Central|Eastern|Atlantic) (?:Standard|Daylight|Prevailing) Time|(?:GMT|UTC)(?:[-+]\d{4})?)\b/g,
    			timezoneClip = /[^-+\dA-Z]/g,
    			pad = function (val, len) {
    				val = String(val);
    				len = len || 2;
    				while (val.length < len) val = "0" + val;
    				return val;
    			};

    		// Regexes and supporting functions are cached through closure
    		return function (date, mask, utc) {
    			var dF = dateFormat;

    			// You can't provide utc if you skip other args (use the "UTC:" mask prefix)
    			if (arguments.length == 1 && Object.prototype.toString.call(date) == "[object String]" && !/\d/.test(date)) {
    				mask = date;
    				date = undefined;
    			}

    			// Passing date through Date applies Date.parse, if necessary
    			date = date ? new Date(date) : new Date;
    			if (isNaN(date)) throw SyntaxError("invalid date");

    			mask = String(dF.masks[mask] || mask || dF.masks["default"]);

    			// Allow setting the utc argument via the mask
    			if (mask.slice(0, 4) == "UTC:") {
    				mask = mask.slice(4);
    				utc = true;
    			}

    			var	_ = utc ? "getUTC" : "get",
    				d = date[_ + "Date"](),
    				D = date[_ + "Day"](),
    				m = date[_ + "Month"](),
    				y = date[_ + "FullYear"](),
    				H = date[_ + "Hours"](),
    				M = date[_ + "Minutes"](),
    				s = date[_ + "Seconds"](),
    				L = date[_ + "Milliseconds"](),
    				o = utc ? 0 : date.getTimezoneOffset(),
    				flags = {
    					d:    d,
    					dd:   pad(d),
    					ddd:  dF.i18n.dayNames[D],
    					dddd: dF.i18n.dayNames[D + 7],
    					m:    m + 1,
    					mm:   pad(m + 1),
    					mmm:  dF.i18n.monthNames[m],
    					mmmm: dF.i18n.monthNames[m + 12],
    					yy:   String(y).slice(2),
    					yyyy: y,
    					h:    H % 12 || 12,
    					hh:   pad(H % 12 || 12),
    					H:    H,
    					HH:   pad(H),
    					M:    M,
    					MM:   pad(M),
    					s:    s,
    					ss:   pad(s),
    					l:    pad(L, 3),
    					L:    pad(L > 99 ? Math.round(L / 10) : L),
    					t:    H < 12 ? "a"  : "p",
    					tt:   H < 12 ? "am" : "pm",
    					T:    H < 12 ? "A"  : "P",
    					TT:   H < 12 ? "AM" : "PM",
    					Z:    utc ? "UTC" : (String(date).match(timezone) || [""]).pop().replace(timezoneClip, ""),
    					o:    (o > 0 ? "-" : "+") + pad(Math.floor(Math.abs(o) / 60) * 100 + Math.abs(o) % 60, 4),
    					S:    ["th", "st", "nd", "rd"][d % 10 > 3 ? 0 : (d % 100 - d % 10 != 10) * d % 10]
    				};

    			return mask.replace(token, function ($0) {
    				return $0 in flags ? flags[$0] : $0.slice(1, $0.length - 1);
    			});
    		};
    	}();

    	// Some common format strings
    	dateFormat.masks = {
    		"default":      "ddd mmm dd yyyy HH:MM:ss",
    		shortDate:      "m/d/yy",
    		mediumDate:     "mmm d, yyyy",
    		longDate:       "mmmm d, yyyy",
    		fullDate:       "dddd, mmmm d, yyyy",
    		shortTime:      "h:MM TT",
    		mediumTime:     "h:MM:ss TT",
    		longTime:       "h:MM:ss TT Z",
    		isoDate:        "yyyy-mm-dd",
    		isoTime:        "HH:MM:ss",
    		isoDateTime:    "yyyy-mm-dd'T'HH:MM:ss",
    		isoUtcDateTime: "UTC:yyyy-mm-dd'T'HH:MM:ss'Z'"
    	};

    	// Internationalization strings
    	dateFormat.i18n = {
    		dayNames: [
    			"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat",
    			"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"
    		],
    		monthNames: [
    			"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
    			"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
    		]
    	};

    	// For convenience...
    	Date.prototype.format = function (mask, utc) {
    		return dateFormat(this, mask, utc);
    	};
    	
    	
      var map, transitLayer;

      function initialize() {
        var mapOptions = {
          zoom: 14,
          center: new google.maps.LatLng(40.443518, -79.945757),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(document.getElementById('map'), mapOptions);

       /*  google.maps.event.addDomListener(document.getElementById('go'), 'click',
        route); */

        var inputFrom = document.getElementById('from');
        var autocomplete = new google.maps.places.Autocomplete(inputFrom);
        
        var inputTo = document.getElementById('to');
        var autocomplete = new google.maps.places.Autocomplete(inputTo);
        
        autocomplete.bindTo('bounds', map);

/*         transitLayer = new google.maps.TransitLayer();

        var control = document.getElementById('transit-wpr');
        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(control); */

/*         google.maps.event.addDomListener(control, 'click', function() {
          transitLayer.setMap(transitLayer.getMap() ? null : map);
        });

        addDepart();
        route();
      } */

/*       function addDepart() {
        var depart = document.getElementById('depart');
        for (var i = 0; i < 24; i++) {
          for (var j = 0; j < 60; j += 15) {
          var x = i < 10 ? '0' + i : i;
          var y = j < 10 ? '0' + j : j;
          depart.innerHTML += '<option>' + x + ':' + y + '</option>';
        }
        }
      } */

/*       function route() {
        var departure = document.getElementById('depart').value;
        var bits = departure.split(':');
        var now = new Date();
        var tzOffset = (now.getTimezoneOffset() + 60) * 60 * 1000;

        var time = new Date();
        time.setHours(bits[0]);
        time.setMinutes(bits[1]);

        var ms = time.getTime() - tzOffset;
        if (ms < now.getTime()) {
          ms += 24 * 60 * 60 * 1000;
        }

        var departureTime = new Date(ms); */

        /* var request = {
          origin: document.getElementById('from').value,
          destination: document.getElementById('to').value,
          travelMode: google.maps.DirectionsTravelMode.TRANSIT,
          provideRouteAlternatives: true,
          transitOptions: {
            departureTime: departureTime
          }
        };

        var panel = document.getElementById('panel');
        panel.innerHTML = '';
        directions.route(request, function(response, status) {
          if (status == google.maps.DirectionsStatus.OK) {
            renderer.setDirections(response);
            renderer.setMap(map);
            renderer.setPanel(panel);
          } else {
            renderer.setMap(null);
            renderer.setPanel(null);
          }
        });
 */
      }

      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>
  <body>
<!--     <div id="transit-wpr">
      <button id="transit">Toggle transit layer</button>
    </div> -->
    <div id="map"></div>
    <div id="panel-wpr">
      <div id="info">
        <div>
          <h2>Transit directions</h2>
        </div>
        <div>
        	<form role="form" action="planTrips.do" method="POST">
		        <div> 
		          <label>From:</label>
		          <input class="input" name="origin" id="from" value="5000 Forbes Avenue, Pittsburgh, PA, United States">
		        </div>
		        <div>
		          <label>To:</label>
		          <input class="input" name="destination" id="to" value="">
		        </div>
		        <div>
		        	<label>Departure Time:</label>
		         	<input type="text" id="depart" data-format="MM-DD-YYYY h:mm a" data-max=2016 data-template="MM / DD / YYYY     hh : mm a" name="departureTime" value="">
						<script>
						$(function(){
						    $('#depart').combodate({minYear: 2016, maxYear: 2016});
						});
						var date = new Date();
						var curTime = dateFormat(date, "mm-dd-yyyy h:MM tt"); 
						console.log(curTime);
						/* var curTime = "12-21-2012 8:30 pm"; */
						$("#depart").attr("value", curTime);
						</script>
		        </div>
		        <div>
		        	<label>Arrival Time:</label>
		         	<input type="text" id="arrival" data-format="MM-DD-YYYY h:mm a" data-template="MM / DD / YYYY     hh : mm a" name="arrivalTime" value="">
						<script>
						$(function(){
							$('#arrival').combodate({minYear: 2016, maxYear: 2016}); 
						});
						</script>
		        </div>
		        <input type="submit" name="action" class="" value="GO">
		     </form>
	    </div>  
      </div>
      <div id="panel"></div>
    </div>
  </body>
</html>
