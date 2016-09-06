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
	 var thisLat = ${stopLat}, thisLng = ${stopLon};
     var map;
     var infoWindow;
     var pos;
     var service;
     var vid;
     var markers = [];
     var cars = [];
     <c:forEach var="bus" items="${busList}">
     	var temp = [];
     	temp.push("${bus.routeId}");
     	temp.push(${bus.latitude});
     	temp.push(${bus.longitude});
     	vid = ${bus.vid};
     	cars.push(temp);
	 </c:forEach> 
     var stops = [];
     var temp = [];
	temp.push("${stopName}");
	temp.push(${stopLat});
	temp.push(${stopLon});
	stops.push(temp);

     function initMap() {
       map = new google.maps.Map(document.getElementById('map'), {
         zoom: 12,
         center: {lat: thisLat, lng: thisLng}
       });

        //setMarkers(cars, map, 'https://maps.gstatic.com/mapfiles/ms2/micons/bus.png');
        setMarkers(stops, map, '<c:url value="/dist/css/busstop.png" />');
        //setMarkers(stops, map, 'https://d30y9cdsu7xlg0.cloudfront.net/png/98017-200.png');
        setMarkers(cars, map, 'https://maps.gstatic.com/mapfiles/ms2/micons/bus.png');
       setInterval(function(){
    	   $.post("vehicle-ajax.do", {vid: vid}, function(d){
    		   cars = [];
    		   var temp = [];
    		   clearMarkers();
    	     	temp.push(d.routeId);
    	     	temp.push(parseFloat(d.lat));
    	     	temp.push(parseFloat(d.lon));
    	     	cars.push(temp);
    	     	setMarkers(cars, map, 'https://maps.gstatic.com/mapfiles/ms2/micons/bus.png');
    	     	//setMarkers(stops, map, 'https://www.niagararegion.ca/transit/images/bus-marker-icon.png');
    	     	setMarkers(stops, map, '<c:url value="/dist/css/busstop.png" />');
    	   });
       }, 20000);
       
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
           markers.push(marker);
         }
       }
     function setMapOnAll(map) {
         for (var i = 0; i < markers.length; i++) {
        	 markers[i].setMap(map);
         }
       }

       // Removes the markers from the map, but keeps them in the array.
       function clearMarkers() {
         setMapOnAll(null);
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
 
        </nav>

        <div id="page-wrapper">
            <div class="row">
            <br/>
                <div class="col-lg-12">
                <div ALIGN=CENTER>
                    <h2>BUS DETAILS</h2>
                </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                             
                             <table class="table table-striped table-hover" id="dataTables-example">                   
                                <tbody>
                                	     <c:forEach var="bus" items="${busList}">
										  <tr class="odd gradeX">                                                            
                                             <td><span class="label label-default">${bus.routeId}</span></td> 
                                             <td>${bus.direction}</td>
                                          </tr>
                                          <tr class="even gradeC">
                                             <td width="250"><a class="text-primary">Stop Name</a></td>
                                             <td width="500">${bus.stopName}</td> 
                                          </tr>
                                          <%-- <tr class="even gradeC">
                                             <td><a class="text-primary">Arrive At</a></td>
                                             <td>${bus.predTime}</td> 
                                            
                                          </tr> --%>
                                         <tr class="odd gradeC">
                                             <td><a class="text-primary">Arrival Time</a></td>
                                             <td>${bus.predTime} (After ${bus.gapTime} Minutes)</td> 
                                           
                                          </tr>
                                          <tr class="even gradeC">
                                             <td><a class="text-primary">Remind Me</a></td>
                                             <td>
                                             <label class="radio-inline">
                                             <input type="radio" name="time" value="5" />5
                                             </label>
                                             <label class="radio-inline">
                                             <input type="radio" name="time" value="10" />10
                                             </label>
                                             
                                             &nbsp;Minutes In Advance.
                                             </td> 
                                            
                                          </tr>
                                         <tr class="odd gradeC">
                                             <td><a class="text-primary">Phone Number</a></td>
                                             <td><input type="text" id="phoneNumber" name="phoneNumber" value=""></input>&nbsp;&nbsp;<button type="button" id="notify-button" class="btn btn-primary btn-sm">Notify Me</button></td> 
                                          
                                           
                                          </tr>
                                          <tr class="even gradeC">
                                          <td colspan="2">
                                          <form action="chat.do">
                                          <button type="submit" class="btn btn-outline btn-primary btn-lg btn-block"><small>Enter Info Room</small></button></a>
                                          </form>
                                          </td>
                                          </tr>
                                          
                                          <script>
                                          $(document).ready(function(){
                                        	  $("#notify-button").click(function(){
                                        		  var time = $("input:radio[name=time]:checked").val();
                                        		  var phone = $("input:text[name=phoneNumber]").val();
                                        		  //console.log(time + phone);
                                        		  $.post("notify.do", {time:time, phone:phone}, function(d){
                                        			  alert("A message will be sent to your phone " + time + " mins before bus arrives");
                                        		  }); 
                                        		  
                                        	  });
                                        	  
                                        
                                          });
                                          </script>
                                          
                                          <!-- <tr class="even gradeC">
                                             <td>REMIND ME 
	                                             
                                             </td>
                                             <td><select class="form-control" style="width:50px;">
	                                                <option>3</option>
	                                                <option>5</option>
	                                                <option>10</option>
	                                            </select></td>
	                                            <td>AHEAD</td>
	                                            <td><button type="button" class="btn btn-info">Notify Me</button></td> 
                                             <td></td><td></td>
                                          </tr> -->
	 									 </c:forEach> 
                                </tbody>
                             </table>
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
