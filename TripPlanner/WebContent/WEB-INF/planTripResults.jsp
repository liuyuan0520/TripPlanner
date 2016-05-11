<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <!-- Bootstrap Core JavaScript -->
    
    <script src="<c:url value="/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="<c:url value="/bower_components/metisMenu/dist/metisMenu.min.js"/>"></script>
    <!-- Custom Theme JavaScript -->
  	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	
    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/bower_components/bootstrap/dist/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<c:url value="/bower_components/metisMenu/dist/metisMenu.min.css" />" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="<c:url value="/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" />" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value="/dist/css/sb-admin-2.css" />" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/bower_components/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <link rel="stylesheet" href="<c:url value="/dist/css/planResults.css" />"> 
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
        top: 10%;
        bottom: 45%;
        left: 0;
        right: 0;
      }

      #panel-wpr {
        position: absolute;
        top: 55%;
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

      function route() {
        var departure = "${departureTime}";
        var arrival = "${arrivalTime}";

        var departureTime = new Date(+departure);
        var arrivalTime = "";
        if (arrival != "") {
        	arrivalTime = new Date(+arrival);
        }
        
        console.log(arrival);
        console.log(arrivalTime);
        console.log(departureTime);

        var origin = "${origin}";
        var destination = "${destination}";
        var request;
		if (arrivalTime == "") {
	      request = {
	        origin: origin,
	        destination: destination,
	        travelMode: google.maps.DirectionsTravelMode.TRANSIT,
	        provideRouteAlternatives: true,
	        transitOptions: {
	          departureTime: departureTime,
          	}
       	  };
      	} else {
      	  request = {
 		    origin: origin,
 		    destination: destination,
 		    travelMode: google.maps.DirectionsTravelMode.TRANSIT,
 		    provideRouteAlternatives: true,
 		    transitOptions: {
 		      arrivalTime: arrivalTime,
      	    }
      	  };
      	}

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

    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
             <!-- /.navbar-header -->
            <%@include file="topNav.jsp"%>
            <!-- /.navbar-top-links -->
 
        </nav>
		
        <!-- <div id="page-wrapper">
		<div class="row">
				<br />
                <div class="col-lg-12"> -->
                
                    <div id="transit-wpr">
      <button id="transit">Toggle transit layer</button>
    </div>
    <div id="map"></div>
    <div id="panel-wpr">
      <div id="info">
      </div>
      <div id="panel"></div>
    </div>
                </div>
                <!-- /.col-lg-12 -->
            <!-- </div>
        </div>
            
        </div> -->
        <!-- /#page-wrapper -->
    
    <!-- /#wrapper -->
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
</body>

</html>
