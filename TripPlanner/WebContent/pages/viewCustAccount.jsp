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

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                    <h1 class="page-header">Customer Profiles</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">                             
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             View Customer Account Details                 
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>First Name</th>
                                            <th>Last Name</th>
                                            <th>Username</th>                                           	
                                            <th>View Details</th>											
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>100</td>
                                            <td>IBM</td>
                                            <td>500</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>300</td>
                                            <td>GOOGLE</td>
                                            <td>1500</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>                                        
                                        <tr class="odd gradeA">
                                            <td>2008</td>
                                            <td>INTEL</td>
                                            <td>1000</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>
                                         <tr class="gradeU">
                                           
                                            <td>$ 200</td>
                                            <td>Walmart</td>
                                            <td>1000</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            
                                            <td>$ 100</td>
                                            <td>IBM</td>
                                            <td>500</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>3003</td>
                                            <td>GOOGLE</td>
                                            <td>1500</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>                                        
                                        <tr class="odd gradeA">
                                            <td>2002</td>
                                            <td>INTEL</td>
                                            <td>1000</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>
                                         <tr class="gradeU">
                                            <td>2001</td>
                                            <td>Walmart</td>
                                            <td>1000</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>
                                        <tr class="odd gradeX">
                                            <td>1010</td>
                                            <td>IBM</td>
                                            <td>500</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>1300</td>
                                            <td>GOOGLE</td>
                                            <td>1500</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>                                        
                                        <tr class="odd gradeA">                                           
                                            <td>1200</td>
                                            <td>INTEL</td>
                                            <td>1000</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>
                                         <tr class="gradeU">                                          
                                            <td>2200</td>
                                            <td>Walmart</td>
                                            <td>1000</td>
                                            <td class="center"><a href="custAccountDetail.jsp" class="btn btn-primary btn-sm">View</a></td>
                                        </tr>
                                    </tbody>
                                </table>
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
