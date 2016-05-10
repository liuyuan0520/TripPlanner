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
	<script>
  $(function() {
    var availableTags = [
    ];
     <c:forEach var="u" items="${routeId}">
    	availableTags.push("${u}");
 	</c:forEach> 
    $("#bus").autocomplete({
      source: availableTags
    });
  });
  </script>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
             <!-- /.navbar-header -->
            <%@include file="topNav.jsp"%>
            <!-- /.navbar-top-links -->
 
            <%@include file="leftNav.jsp"%>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Search Next Bus</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Search for a next possible bus.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                             <form role="form">
                             	<table class="table table-striped table-hover" id="dataTables-example">                   
                             		<tbody>
                                		<tr>
											<td><label class="radio-inline">
      											<input type="radio" name="bound" value = "inBound" checked = "checked">inBound
    										</label></td>
    										<td><label class="radio-inline">
      											<input type="radio" name="bound" value = "outBound">outBound
    										</label></td>
                                        </tr>
                                        <tr>        
                                             <td class="center"><input class="form-control" placeholder="Bus" name="bus" id="bus" autofocus></td>
                                             <td class="center"><input class="form-control" placeholder="Bus Stop" name="busStop"></td>
                                        </tr>                       
                                        <tr>
                                             <td><a href="searchResult.jsp" class="btn btn-primary btn-lg">Search</a></td>
                                        </tr>
                                	</tbody>
                             	</table>
                             </form>
                            </div>
                            <!-- /.table-responsive -->

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
                
            <!-- /.row -->

            <!-- /.row -->
            <div id="map" style="width:100%;height:500px"></div>
        </div>
        <!-- /#page-wrapper -->
    <script>
		
      // The following example creates complex markers to indicate beaches near
      // Sydney, NSW, Australia. Note that the anchor is set to (0,32) to correspond
      // to the base of the flagpole.
      var thisLat = 40.443518, thisLng = -79.945757;
      var map;
      var infoWindow;
      var pos;
      var service;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 17,
          center: {lat: thisLat, lng: thisLng}
        });
        //var infoWindow = new google.maps.InfoWindow({map: map});
        var latitude, longitude;
        navigator.geolocation.getCurrentPosition(function(position) {
        	latitude = position.coords.latitude;
        	longitude = position.coords.longitude;
            pos = {
              lat: latitude,
              lng: longitude
            };
            var marker = new google.maps.Marker({
                position: pos,
                map: map,
                title: 'you are here'
              });
            map.setCenter(pos);
          });
        infowindow = new google.maps.InfoWindow();
        service = new google.maps.places.PlacesService(map);
        var pyrmont = {lat: thisLat, lng: thisLng};
        service.nearbySearch({
          location: pyrmont,
          radius: 10000,
          type: ['bus_station']
        }, callback);
      }
      

      function callback(results, status) {
        if (status == google.maps.places.PlacesServiceStatus.OK) {
        	console.log("1"); 
          for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
          }
        }
      }
      function createMarker(place) {
          var placeLoc = place.geometry.location;
          var marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location
          });
          var content='<strong style="font-size:1.2em">'+place.name+'</strong>'+
                      '<br/><strong>Latitude:</strong>'+placeLoc.lat()+
                      '<br/><strong>Longitude:</strong>'+placeLoc.lng()+
                      '<br/><strong>Type:</strong>'+place.types[0]+
                      '<br/><strong>Rating:</strong>'+(place.rating||'n/a');
          var more_content='<img src="http://googleio2009-map.googlecode.com/svn-history/r2/trunk/app/images/loading.gif"/>';
          
          //make a request for further details
          service.getDetails({reference:place.reference}, function (place, status) 
                                      {
                                        if (status == google.maps.places.PlacesServiceStatus.OK) 
                                        {
                                          more_content='<hr/><strong><a href="'+place.url+'" target="details">Details</a>';
                                          
                                          if(place.website)
                                          {
                                            more_content+='<br/><br/><strong><a href="'+place.website+'" target="details">'+place.website+'</a>';
                                          }
                                        }
                                      });


          google.maps.event.addListener(marker, 'click', function() {
            
            infowindow.setContent(content+more_content);
            infowindow.open(map, this);
          });
        }

      // Data for the markers consisting of a name, a LatLng and a zIndex for the
      // order in which these markers should display on top of each other.
      var cars = [
        ['Bondi Beach', thisLat - 0.1, thisLng + 0.1, 4],
        ['Coogee Beach', thisLat - 0.2, thisLng + 0.1, 5],
        ['Cronulla Beach', thisLat + 0.1, thisLng + 0.1, 3],
        ['Manly Beach', thisLat + 0.1, thisLng + 0.2, 2],
        ['Maroubra Beach', thisLat - 0.1, thisLng + 0.3, 1]
      ];

      function setMarkers(map) {
        // Adds markers to the map.

        // Marker sizes are expressed as a Size of X,Y where the origin of the image
        // (0,0) is located in the top left of the image.

        // Origins, anchor positions and coordinates of the marker increase in the X
        // direction to the right and in the Y direction down.
        var image = {
          url: 'https://maps.gstatic.com/mapfiles/ms2/micons/bus.png',
          // This marker is 20 pixels wide by 32 pixels high.
          // size: new google.maps.Size(20, 20),
          // The origin for this image is (0, 0).
          origin: new google.maps.Point(0, 0),
          // The anchor for this image is the base of the flagpole at (0, 32).
          anchor: new google.maps.Point(0, 32)
        };
        // Shapes define the clickable region of the icon. The type defines an HTML
        // <area> element 'poly' which traces out a polygon as a series of X,Y points.
        // The final coordinate closes the poly by connecting to the first coordinate.
        var shape = {
          coords: [1, 1, 1, 20, 18, 20, 18, 1],
          type: 'poly'
        };
        for (var i = 0; i < cars.length; i++) {
          var beach = cars[i];
          var marker = new google.maps.Marker({
            position: {lat: beach[1], lng: beach[2]},
            map: map,
            icon: image,
            shape: shape,
            title: beach[0],
            zIndex: beach[3]
          });
        }
      }
    </script>
    <script async defer
    	src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBPLZvtXmpwTONHCfU6gEz_GQ-ocwHvumk&callback=initMap">
    </script>
    </div>
    <!-- /#wrapper -->
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
</body>

</html>
