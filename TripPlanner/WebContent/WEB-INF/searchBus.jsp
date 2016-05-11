<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
    <%@include file="import.jsp"%>
</head>
<body>
<%@include file="topNav.jsp"%>
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
                             <form role="form" action="predict.do" method="GET">
                             	<table class="table table-striped table-hover" id="dataTables-example">                   
                             		<tbody>
                                		<tr>
											<td><label class="radio-inline">
      											<input type="radio" name="bound" value = "INBOUND" checked="checked" />InBound
    										</label></td>
    										<td><label class="radio-inline">
      											<input type="radio" name="bound" value = "OUTBOUND" />OutBound
    										</label></td>
                                        </tr>
                                        <tr>        
                                             <td class="center"><input class="form-control" placeholder="Bus" name="bus" id="bus" /></td>
                                             <td class="center"><input class="form-control" placeholder="Bus Stop" name="busStop" id="input_busstop"></td>
                                        </tr>                       
                                        <tr>
                                             <td><!-- <a href="searchResult.jsp" class="btn btn-primary btn-lg">Search</a> -->
                                             	<input type="submit" value="Search" />
                                             </td>
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

</body>
</html>