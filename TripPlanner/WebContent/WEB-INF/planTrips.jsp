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
    <script
      src="//maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="<c:url value="/dist/css/timeForm.css" />">  
<!-- 	<link rel="stylesheet" href="http://vitalets.github.io/combodate/prettify/prettify-bootstrap.css">
	<link rel="stylesheet" href="http://www.jqueryrain.com/wp-content/plugins/wp-bar/wpbar.css"> -->
	
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script src="http://vitalets.github.io/combodate/momentjs/moment.min.2.5.0.js"></script>
  <script src="http://platform.twitter.com/widgets.js"></script>
  <script src="https://mc.yandex.ru/metrika/watch.js"></script>
  <script src="<c:url value="/dist/js/combodate.js" />"></script>
  <script src="http://vitalets.github.io/combodate/prettify/prettify.js"></script>

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
		
        <div id="page-wrapper">
		<div class="row">
				<br />
                <div class="col-lg-12">
                <div id="map"></div>
                <div ALIGN=CENTER>
                    <h2>Let's Go Places</h2>
                </div>
                <br/>
                <div>
	                <form role="form" action="planTrips.do" method="POST">
	                <div>
	                    <div class="form-group input-group">
	                        <span class="input-group-addon">FROM</span>
<!-- 	                        <input type="text" class="form-control" placeholder="From"> -->
	                        <input type="text" class="form-control" placeholder="From" name="origin" id="from" value="5000 Forbes Avenue">
	                    </div>
	                    <div class="form-group input-group">
	                        <span class="input-group-addon">&nbsp;&nbsp;TO&nbsp;&nbsp;&nbsp;</span>
	                        <input type="text" class="form-control" name="destination" id="to" value="">
	                    </div>
	                </div>
	                <br/>                  
	                <div ALIGN=CENTER>
	               		<h4>
	                        <small>I WANT TO LEAVE AT</small>
	                    </h4>
	                    
			         	<input type="text" id="depart" data-format="MM-DD-YYYY hh:mm a" data-max=2016 data-template="MM / DD / YYYY     hh : mm a" name="departureTime" value="">
						<script>
						$(function(){
						    $('#depart').combodate({minYear: 2016, maxYear: 2016});
						});
						var date = new Date();
						var curTime = dateFormat(date, "mm-dd-yyyy hh:MM tt"); 
						console.log(curTime); 
						$("#depart").attr("value", curTime);
						</script>
			        </div>
			        <div ALIGN=CENTER>
			        	<h4>
	                        <small>I WANT TO ARRIVE AT</small>
	                    </h4>
			         	<input type="text" id="arrival" data-format="MM-DD-YYYY h:mm a" data-template="MM / DD / YYYY     hh : mm a" name="arrivalTime" value="">
							<script>
							$(function(){
								$('#arrival').combodate({minYear: 2016, maxYear: 2016}); 
							});
							</script>
			        </div>
			        <div class="panel-body">
			       		<button type="submit" class="btn btn-outline btn-primary btn-lg btn-block"><small>GO</small></button>
			        </div>
			        </form>
		        </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
            
        </div>
        <!-- /#page-wrapper -->
    
    <!-- /#wrapper -->
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
</body>

</html>
