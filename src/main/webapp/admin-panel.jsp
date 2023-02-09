<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Employees" %>
<%@ page import="Service.EmployeeService" %>
<%@ page import="DAO.EmployeesDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="DAO.MoodDao" %>
<%@ page import="Model.Mood" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>


<%  
    EmployeesDAO employeesDAO = new EmployeesDAO();
    MoodDao moodDao = new MoodDao();
    Integer count = employeesDAO.getNumberOfEmployees(); 
    Integer count_moods = moodDao.getNumberOfMoods(); 
    Integer nb_pages = (count-1)/10 + 1;

    ArrayList<Employees> employees = EmployeesDAO.getListOfEmployees();
    ResultSet rs = employeesDAO.getEmployees();
    
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Admin panel</title>
</head>
<body>
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
    <link href="./resources/css/bootstrap.min.css" type="text/css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./resources/css/style.css" type="text/css" rel="stylesheet">

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
            <a class="navbar-brand" href="../../index.html">Mood of the month</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle navlink" data-toggle="dropdown" href="#">
                    <i class="fa fa-gear fa-fw"></i> Manage MOTMs <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="addUser"><i class="fa fa-user fa-fw"></i> Add member</a>
                    </li>
                    <li><a href="editMOTM"><i class="fa fa-calendar fa-fw"></i> Change MOTM Template</a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <div id="page-wrapper" class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Administration Panel</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-4 col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-user fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                    <div class="huge"><%= count %></div>
                                    <div class="huge-label">Registered members</div>
                            </div>
                        </div>
                    </div>
                    <!--<a href="../../add_member.html">-->
                    <a href="addUser">
                        <div class="panel-footer">
                            <span class="pull-left">Add member</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="panel panel-green">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-smile-o fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge"><%=count_moods%></div>
                                <div class="huge-label">Moods Closed</div>
                            </div>
                        </div>
                    </div>
                    <a href="editMOTM">
                        <div class="panel-footer">
                            <span class="pull-left">Edit MOTM content</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="panel panel-blue">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-tachometer fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">Dashboard</div>
                                <div class="huge-label">View & Export</div>
                            </div>
                        </div>
                    </div>
                    <a href="dashboard">
                        <div class="panel-footer">
                            <span class="pull-left">Show dashboard</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-8">
                <!-- /.panel -->
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-user fa-fw"></i> Manage Members
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Birthdate</th>
                                            <th class="text-right">Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <%
                                                int current_page_num = 1;

                                                if ( ! (request.getParameter("page") == null)){
                                                    current_page_num = Integer.parseInt(request.getParameter("page"));
                                                }

                                                for(int i = 0; i < (current_page_num-1)*10; i+=1) {
                                                    rs.next();
                                                } 

                                                %>
                                                <% int j = 0  ;%>
                                                <% while (rs.next() && j<10) { %>
                                                <% j = j+1  ;%> 
                                                <td><%= rs.getString("name") %></td>
                                                <td><%= rs.getString("email")%></td>
                                                <td><%= rs.getDate("birthdate")%></td>
                                                <% int id = rs.getInt("uuid"); %>
                                                <td class="text-right">
                                                    <a href="/helloworld/updateUser?name=<%= rs.getString("name") %>&email=<%= rs.getString("email")%>&birthdate=<%= rs.getDate("birthdate")%>&uuid=<%=id%>" class="btn btn-sm btn-warning"><i class="fa fa-pencil"></i> Edit</a>
                                                    <a href="#" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> Remove</a>
                                                </td>
                                            </tr>
                                        <%  } %>
                                        </tbody>
                                    </table>
                                    <div class="text-center">
                                        <ul class="pagination">
                                            <% for(int i = 1; i < nb_pages+1; i+=1) { %>
                                                <li><a href="adminPanel?page=<%= i %>"> <%= i %> </a></li>
                                            <%  } %>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-tachometer fa-fw"></i> Stats
                    </div>
                    <div class="panel-body" id="stats">
                        <%  
                            ArrayList<Mood> moods = new ArrayList<Mood>();
                            ResultSet moodRs = moodDao.getMood();
                            while (moodRs.next()) {
                                moods.add(new Mood(moodRs.getInt("mark"), moodRs.getString("comment"), moodRs.getString("name")));
                            }
                            Integer moodsSize = moods.size();
                            if (moods.size() == 0) {
                                moodsSize = 1;
                            }
                            float avg = 0;
                            for (Mood m : moods) {
                                avg = avg + m.getMark();
                            }
                            avg = Math.round(avg * 10 / moodsSize);
                        %>
                        <div class="note">
                            <%=avg/10%><small>/5</small>
                            <p>Avg Mood</p>
                        </div>

                        <div class="details">
                            <div class="mood">
                                <div class="img-container">
                                    <img src="./resources/img/1.png" alt="super"/>
                                </div>
                                <div class="progress-bar-container">
                                    <%  long count1 = moods.stream().filter(m -> m.getMark().equals(1)).count(); %>
                                    <span class="desc">Vote count: <%=count1%></span>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="<%=Math.round(count1*100/moodsSize)%>"
                                             aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.round(count1*100/moodsSize)%>%">
                                            <span class=""><%=Math.round(count1*100/moodsSize)%>%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mood">
                                <div class="img-container">
                                    <img src="./resources/img/2.png" alt="super"/>
                                </div>
                                <div class="progress-bar-container">
                                    <%  long count2 = moods.stream().filter(m -> m.getMark().equals(2)).count(); %>
                                    <span class="desc">Vote count: <%=count2%></span>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="<%=Math.round(count2*100/moodsSize)%>"
                                             aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.round(count2*100/moodsSize)%>%">
                                            <span class=""><%=Math.round(count2*100/moodsSize)%>%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mood">
                                <div class="img-container">
                                    <img src="./resources/img/3.png" alt="super"/>
                                </div>
                                <div class="progress-bar-container">
                                    <%  long count3 = moods.stream().filter(m -> m.getMark().equals(3)).count(); %>
                                    <span class="desc">Vote count: <%=count3%></span>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-neutral" role="progressbar" aria-valuenow="<%=Math.round(count3*100/moodsSize)%>"
                                             aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.round(count3*100/moodsSize)%>%">
                                            <span class=""><%=Math.round(count3*100/moodsSize)%>%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mood">
                                <div class="img-container">
                                    <img src="./resources/img/4.png" alt="super"/>
                                </div>
                                <div class="progress-bar-container">
                                    <%  long count4 = moods.stream().filter(m -> m.getMark().equals(4)).count(); %>
                                    <span class="desc">Vote count: <%=count4%></span>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-midsuccess" role="progressbar" aria-valuenow="<%=Math.round(count4*100/moodsSize)%>"
                                             aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.round(count4*100/moodsSize)%>%">
                                            <span class=""><%=Math.round(count4*100/moodsSize)%>%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mood">
                                <div class="img-container">
                                    <img src="./resources/img/5.png" alt="super"/>
                                </div>
                                <div class="progress-bar-container">
                                    <%  long count5 = moods.stream().filter(m -> m.getMark().equals(5)).count(); %>
                                    <span class="desc">Vote count: <%=count5%></span>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="<%=Math.round(count5*100/moodsSize)%>"
                                             aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.round(count5*100/moodsSize)%>%">
                                            <span class=""><%=Math.round(count5*100/moodsSize)%>%</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a href="stats" class="btn btn-default btn-block">View more reports</a>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-cog fa-fw"></i> Settings
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table class="table settings">
                            <tbody>
                            <tr>
                                <td>Mailing Date</td>
                                <td>Last friday of each month</td>
                            </tr>
                            <tr>
                                <td>Time </td>
                                <td>10:00</td>
                            </tr>
                            </tbody>
                        </table>
                        <table class="table editsettings hidden">
                            <tbody>
                            <tr>
                                <td>Mailing Date</td>
                                <td>
                                    <select name="date" class="form-control" id="senddate">
                                        <option value="1">Last friday of each month</option>
                                        <option value="2">Last office-day of each month</option>
                                        <option value="3">First monday of each month</option>
                                        <option value="4">First office-day of each month</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Time </td>
                                <td><input type="text" class="form-control"></td>
                            </tr>
                            <tr><td colspan="2" align="right"><input type="submit" class="btn btn-sm btn-primary"></td></tr>
                            </tbody>
                        </table>

                        <!-- /.list-group -->
                        <a class="btn btn-default btn-block edit">Change Settings</a>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-4 -->
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
<script src="../js/jquery-3.1.1.min.js"></script>

<!-- togggle.js -->
<script src="../js/toggle.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>

</body>

</html>

</body>
</html>