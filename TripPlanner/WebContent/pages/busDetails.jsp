<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <%@include file="import.jsp"%>
	<script>
	 var thisLat = 40.443518, thisLng = -79.945757;
     var map;
     var infoWindow;
     var pos;
     var service;
     
     var cars = [];
     <c:forEach var="bus" items="${busList}">
     	var temp = [];
     	temp.push("${bus.routeId}");
     	temp.push(${bus.latitude});
     	temp.push(${bus.longitude});
     	cars.push(temp);
	 </c:forEach> 
     var stops = [];
    <c:forEach var="stop" items="${stopList}">
  		var temp = [];
  		temp.push("${bus.routeId}");
  		temp.push("${bus.latitude}");
  		temp.push("${bus.longitude}");
  		stops.push(temp);
	 </c:forEach> 
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
       setMarkers(cars, map, 'https://maps.gstatic.com/mapfiles/ms2/micons/bus.png');
       setMarkers(stops, map, 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png');
     }
     
     // draw the bus;
     function setMarkers(target, map, myUrl) {
         // Adds markers to the map.

         // Marker sizes are expressed as a Size of X,Y where the origin of the image
         // (0,0) is located in the top left of the image.

         // Origins, anchor positions and coordinates of the marker increase in the X
         // direction to the right and in the Y direction down.
         
         var image = {
           url: myUrl,
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
         for (var i = 0; i < target.length; i++) {
           var mark = target[i];
           var marker = new google.maps.Marker({
             position: {lat: mark[1], lng: mark[2]},
             map: map,
             icon: image,
             shape: shape,
             title: mark[0],
             zIndex: mark[3]
           });
         }
       }
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
                    <h1 class="page-header">Bus Details	</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="label label-default">View Bus Details</span>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                             <form role="form">
                             <table class="table table-striped table-hover" id="dataTables-example">                   
                                <tbody>
                                	     <c:forEach var="bus" items="${busList}">
										  <tr class="odd gradeX">                                                            
                                             <td><span class="label label-default">${bus.routeId}</span></td> 
                                             <td></td><td></td><td></td><td></td><td></td>
                                          </tr>
                                          <tr class="even gradeC">
                                             <td>Next Stop</td>
                                             <td>${bus.stopName}</td> 
                                             <td></td><td></td><td></td><td></td><td></td>
                                          </tr>
                                          <tr class="odd gradeC">                                                             
                                             <td>Direction</td> 
                                             <td>${bus.direction}</td>
                                             <td></td><td></td><td></td><td></td><td></td>
                                          </tr>
                                          <tr class="even gradeC">
                                             <td>arrival time</td>
                                             <td>${bus.predTime}</td> 
                                             <td></td><td></td><td></td><td></td><td></td>
                                          </tr>
                                         <tr class="odd gradeC">
                                             <td>waiting time</td>
                                             <td>${bus.gapTime}</td> 
                                             <td></td><td></td><td></td><td></td><td></td>
                                          </tr>
	 									 </c:forEach> 
                                </tbody>
                             </table>
                             </form>
                            </div>
                            <!-- /.table-responsive -->
                            <div id="map" style="width:100%;height:500px"></div>
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
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    <script async defer
    	src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBPLZvtXmpwTONHCfU6gEz_GQ-ocwHvumk&callback=initMap">
    </script>
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
