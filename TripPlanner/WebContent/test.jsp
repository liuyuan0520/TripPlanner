<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>

<script src="<c:url value="/js/jquery.js" />"></script>
</head>
<body>
<input type="button" value="click me" id="test" />
<script>


	$("#test").click(function(){
		$.post("test.do", {vid:3565}, function(d){
			console.log(d);
		});
		/*
		// for findstops
		$.post("test.do",{rt:"71C", dir:"INBOUND"}, function(d){
		
			$.each(d.stops, function(index, item) {
		        console.log(item.stopName);
		    });		    
			
		});
		*/
	});
	
</script>
</body>
</html>