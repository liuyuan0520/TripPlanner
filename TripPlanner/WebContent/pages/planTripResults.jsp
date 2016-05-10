<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Google Maps JavaScript API v3 Example: Transit</title>
    <link href="../dist/css/planResults.css" rel="stylesheet" type="text/css">
    <script
      src="//maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <style type="text/css">
      html, body {
        height: 100%;
        padding: 0;
        margin: 0;
        color: black;
        font-family: arial,sans-serif;
        font-size: 13px;
      }
      
      #map {
        position: absolute;
        top: 0%;
        bottom: 50%;
        left: 0;
        right: 0;
      }

      #panel-wpr {
        position: absolute;
        top: 50%;
        bottom: 0;
/*         left: 50%;
        right: 0; */
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

      .adp-directions {
        width: 100%;
      }
      

/*       .input {
        background-color: white;
        padding-left: 8px;
        border: 1px solid #D9D9D9;
        border-top: 1px solid silver;
        -webkit-border-radius: 1px;
        -moz-border-radius: 1px;
        border-radius: 1px;
      }

      .time {
        margin: 0;
        height: 17px;
        border: 1px solid;
        border-top-color: #CCC;
        border-right-color: #999;
        border-left-color: #999;
        border-bottom-color: #CCC;
        padding: 2px 15px 1px 1px;
      }
 */
      /* button {
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
      var directions = new google.maps.DirectionsService();
      var renderer = new google.maps.DirectionsRenderer();
      var map, transitLayer;

      function initialize() {
        var mapOptions = {
          zoom: 14,
          center: new google.maps.LatLng(40.443518, -79.945757),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(document.getElementById('map'), mapOptions);

/*         google.maps.event.addDomListener(document.getElementById('go'), 'click',
        route); */

        var input = document.getElementById('from');
        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);

        transitLayer = new google.maps.TransitLayer();

        var control = document.getElementById('transit-wpr');
        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(control);

        google.maps.event.addDomListener(control, 'click', function() {
          transitLayer.setMap(transitLayer.getMap() ? null : map);
        });

       /*  addDepart(); */
        route();
      }

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

      function route() {
        var departure = "";
        var arrival = "";
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

        var departureTime = new Date(ms);
        var origin = ${origin};
        var destination = ${destination}
        

        var request = {
          origin: origin,
          destination: destination,
          travelMode: google.maps.DirectionsTravelMode.TRANSIT,
          provideRouteAlternatives: true,
          transitOptions: {
            departureTime: departureTime,
           /*  arrivalTime: arrivalTime */
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

      }

      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>
  <body>
    <div id="transit-wpr">
      <button id="transit">Toggle transit layer</button>
    </div>
    <div id="map"></div>
    <div id="panel-wpr">
      <div id="info">
<!--         <div>
          <h2>Transit directions</h2>
        </div> -->
        
<!--         <div> 
          <label>from:</label>
          <input class="input" id="from" value="401 Shady Ave">
        </div>
        <div>
          <label>to:</label>
          <strong>5000 forbes ave</strong>
        </div> -->
        <!-- <div class = "time">Depart at <select id="depart"></select></div> -->
<!--         <div class="btn">
          <button id="go">Get Directions</button>
        </div> -->
      </div>
      <div id="panel"></div>
    </div>
  </body>
</html>
