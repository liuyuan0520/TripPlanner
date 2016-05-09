<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>

<script src="/js/jquery.js"></script>
</head>
<body>
<input type="button" value="click me"/>
<script>
	$.post("test.do", {vid:"71C"}, function(d){
		console.log("hahahah");
	});
</script>
</body>
</html>