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
                    <h1 class="page-header">Create Customer</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Create Customer Account
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                             <form role="form">
                             <table class="table table-striped table-hover" id="dataTables-example">                   
                                <tbody>
                                        <tr class="odd gradeX">                                                            
                                             <td>User Name</td> 
                                             <td class="center"><input class="form-control" placeholder="User Name" name="username" type="username" autofocus></td>
                                             <td></td><td></td><td></td><td></td><td></td>
                                        
                                        </tr>
                                        <tr class="even gradeC">
                                             <td>Password</td>
                                             <td class="center"><input class="form-control" placeholder="Password" name="password" type="password" value=""></td>
                                             <td></td><td></td><td></td><td></td><td></td>
                                        </tr>
                                        <tr class="even gradeC">
                                             <td>First Name</td>
                                             <td class="center"><input class="form-control" placeholder="First Name" name="firstName" type="firstName" value=""></td>
                                             <td></td><td></td><td></td><td></td><td></td>
                                        </tr>
                                        <tr class="even gradeC">
                                             <td>Last Name</td>
                                             <td class="center"><input class="form-control" placeholder="Last Name" name="lastName" type="lastName" value=""></td>
                                             <td></td><td></td><td></td><td></td><td></td>
                                        </tr>
                                        <tr class="even gradeC">
                                             <td>Address</td>
                                             <td class="center"><input class="form-control" placeholder="Address" name="address" type="address" value=""></td>
                                             <td></td><td></td><td></td><td></td><td></td>
                                        </tr>
                                        <tr class="even gradeC">
                                             <td>Address 2</td>
                                             <td class="center"><input class="form-control" placeholder="Address 2" name="address2" type="address2" value=""></td>
                                             <td></td><td></td><td></td><td></td><td></td>
                                        </tr>
                                        <tr class="even gradeC">
                                             <td>City</td>
                                             <td class="center"><input class="form-control" placeholder="City" name="city" type="city" value=""></td>
                                             <td></td><td></td><td></td><td></td><td></td>
                                        </tr>
                                        <tr class="even gradeC">
                                             <td>State</td>
                                             <td class="center"><input class="form-control" placeholder="State" name="state" type="state" value=""></td>
                                             <td></td><td></td><td></td><td></td><td></td>
                                        </tr>
                                        <tr class="even gradeC">
                                             <td>Zip</td>
                                             <td class="center"><input class="form-control" placeholder="Zip" name="zip" type="zip" value=""></td>
                                             <td></td><td></td><td></td><td></td><td></td>
                                        </tr>
                                        <tr class="even gradeC">
                                             <td><input type="submit" class="btn btn-primary btn-lg"></td>
                                             <td></td><td></td><td></td><td></td><td></td><td></td>
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
