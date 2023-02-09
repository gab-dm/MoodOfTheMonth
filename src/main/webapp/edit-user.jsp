<%@ page import="Model.Employees" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Edit member</title>
</head>
<body>

<%--    <%@include  file="resources/pages/edit_member.html" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mood of the month</title>

    <!-- Bootstrap CSS -->
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./resources/css/style.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top container-fluid" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../../../../resources/pages/index.html">Mood of the month</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle navlink" data-toggle="dropdown" href="#">
                    <i class="fa fa-gear fa-fw"></i> Manage MOTMs <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="add_member.html"><i class="fa fa-user fa-fw"></i> Add Member</a>
                    </li>
                    <li><a href="../../../../resources/pages/edit_motm.html"><i class="fa fa-calendar fa-fw"></i> Change MOTM Template</a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <div id="page-wrapper" class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Edit Member</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <form action="" method="post" class="">

                                    <div class="form-group">

                                        <!--<label for="name">Name</label>-->
                                    <input type="text" class="input-lg form-control" name="name2" placeholder="" value=<%=((Employees)request.getAttribute("employ")).getNameEmployee() %> >
                                    </div>
                                    <div class="form-group">
                                        <!--<label for="email">Email</label>-->
                                        <input type="email" class="input-lg form-control" name="email2" placeholder="" value=<%=((Employees)request.getAttribute("employ")).getEmailEmployee() %>>
                                    </div>
                                    <div class="form-group">
                                        <!--<label for="date">Birthdate</label>-->
                                        <input type="text" class="input-lg form-control" name="date2" placeholder="" value=<%=((Employees)request.getAttribute("employ")).getBirthDateEmployee() %>>
                                    </div>

                                    <div class="text-right">
                                        <button type="submit" class="btn btn-lg btn-primary">Save changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->
<footer class="footer">
    <div class="container">
        <div class="row text-center">
            Resourcepool &bullet; 2017
        </div>
    </div>
</footer>

<!-- jQuery -->
<script src="../../../../resources/js/jquery-3.1.1.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../../../resources/js/bootstrap.min.js"></script>

</body>

</html>

</body>
</html>
