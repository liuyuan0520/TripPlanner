<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

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