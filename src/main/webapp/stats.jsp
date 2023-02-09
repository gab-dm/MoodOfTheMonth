<%@ page import="DAO.MoodDao" %>
<%@ page import="Model.Mood" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Collections" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Stats</title>
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
                <a class="navbar-brand" href="/helloworld/adminPanel">Mood of the month</a>
            </div>
            <!-- /.navbar-header -->
        </nav>

        <div id="page-wrapper" class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Statistics</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-body" id="statistics">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div>
                                        <div class="dropdown pull-right selectbtn">
                                            <a class="dropdown-toggle btn btn-primary btn-lg" data-toggle="dropdown" href="#">
                                                <i class="fa fa-gear fa-fw"></i> Select month <i class="fa fa-caret-down"></i>
                                            </a>
                                            <ul class="dropdown-menu dropdown-user">
                                                <li><a href="#">March 2017</a></li>
                                                <li><a href="#">February 2017</a></li>
                                                <li><a href="#">January 2017</a></li>
                                                <li><a href="#">December 2016</a></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <%  MoodDao moodDao = new MoodDao();
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
                                    <div class="container-fluid" id="dashboard">
                                        <div class="half">
                                            <div class="month">
                                                <p class="title">FEBRUARY 2023</p>
                                                <p class="subtitle">MOOD OF THE MONTH</p>
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
                                                            <div class="progress-bar progress-bar-neutral" role="progressbar" aria-valuenow="<%=Math.round(count3/moodsSize*100)%>"
                                                                 aria-valuemin="0" aria-valuemax="100" style="width:<%=Math.round(count3/moodsSize*100)%>%">
                                                                <span class=""><%=Math.round(count3/moodsSize*100)%>%</span>
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
                                        </div>
                                        <div class="half-2">
                                            <div class="global">
                                                <div class="global-mood">
                                                    <div class="img-container">
                                                        <img class="mood" src="./resources/img/<%=Math.round(avg/10)%>.png" alt=""/>
                                                    </div>
                                                    <div class="notation">
                                                        <p class="title">GLOBAL MOOD</p>
                                                        <span class="note"><%=avg/10%></span>
                                                        <span class="note-on">/5</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="comments">
                                                <h2 class="title">Comments</h2>
                                                <%  ArrayList<Mood> publicMood = new ArrayList<Mood>();
                                                    for (Mood m : moods) {
                                                        if (m.getPublicly().equals("yes")) {
                                                            publicMood.add(m);
                                                        }
                                                    }
                                                    Integer count = 0;
                                                    Collections.reverse(publicMood);
                                                    for (Mood m : publicMood) {
                                                        count = count + 1;
                                                %>
                                                <div class="comment-container">
                                                    <div class="note">
                                                        <img class="mood" src="./resources/img/<%=m.getMark()%>.png" alt=""/>
                                                    </div>
                                                    <div class="comment">
                                                        <%=m.getComment()%>
                                                    </div>
                                                </div>
                                                <%
                                                        if (count == 4) {
                                                            break;
                                                        }
                                                    }
                                                %>

                                            </div>
                                        </div>
                                    </div>

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
    <script src="../js/jquery-3.1.1.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- CKEditor -->
    <script src="https://cdn.ckeditor.com/4.6.2/basic/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('content');
    </script>

    </body>

    </html>


</body>
</html>