<%-- 
    Document   : emp_view
    Created on : 17 Jul, 2015, 3:14:05 PM
    Author     : Akach
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="shiftModel.GetEmpData" %>
<%@page import="java.sql.ResultSet" %>
<%
HttpSession sessionsa = request.getSession(false);
HttpSession sessions = request.getSession(false);
String name = (String) sessionsa.getAttribute("name");
String email = (String) sessionsa.getAttribute("email");
String id = (String) sessionsa.getAttribute("id");
String date = (String) sessions.getAttribute("date");
int sid=0;
%>
<%
ResultSet rs=null;
try{
sid = GetEmpData.getData(email);
System.out.println(sid);
 rs= GetEmpData.empData(sid);
}
catch(Exception e){}
%>
<html dir="ltr" lang="en-US">
   <head>
      <meta charset="UTF-8" />
      <title>A date range picker for Bootstrap</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">
      <link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-bs3.css" />
      <script type="text/javascript" src="js/jquery.min.js"></script>
      <script type="text/javascript" src="js/bootstrap.min.js"></script>
      <script type="text/javascript" src="js/moment.js"></script>
      <script type="text/javascript" src="js/daterangepicker.js"></script>
      
      <style type="text/css">
		.top{
		margin-top:50px;
		height:10px;
		width:100%;
		background:#0096ff;
		
		}

		</style>
      
   </head>
   <body>
	
    
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="img/AVS-logo.png"></a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>&nbsp;<label><%= name%></label>&nbsp;<i class="fa fa-caret-down"></i>
                    </a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="emp_home.jsp"><i class="fa fa-user fa-fw"></i>Request Shift</a></li>
            <li><a href="emp_end.jsp"><i class="fa fa-gear fa-fw"></i> Final Shift</a></li>
            <li><a href="#"><i class="fa fa-gear fa-fw"></i>View Shift</a></li>
            <li class="divider"></li>
            <li><a href="index.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
          </ul>
        </li>
      </ul>

    </div>
  </div>
</nav>

<!--/nav-bar-->
	
      <div class="top"></div>
<div class="container">
	<div class="container-fluid">
    <!--Navigation-->
    	<div class="col-lg-3">
         <div class="panel active1">
  			<div class="panel-heading">
    			<h3 class="panel-title"><i class="fa fa-list-ul"></i>&nbsp;<b>Options</b></h3>
  			</div>
	    	 <div class="list-group">
  				<a href="emp_home.jsp" class="list-group-item">
				<i class="fa  fa-angle-double-right"></i>&nbsp;
                Request Shift
  				</a>
  				<a href="emp_end.jsp" class="list-group-item">
            	Actual Shift
  				</a>
            	
				<a href="#" class="list-group-item active">
            	View
  				</a>
			 </div>
			</div>
		</div>
	<!--/Navigation-->
    <div class="col-lg-9">
        <div class="panel panel-default">
  			<div class="panel-heading">
    			<h3 class="panel-title">Hello&nbsp;<label><%= name%></label>!</h3>
  			</div>
  			<div class="panel-body">
    			
                <form class="form-horizontal">
  <fieldset>
    <legend>View your shift.</legend>
    <div class="form-group">
      <label class="col-lg-3 control-label">Employee ID</label>
      <div class="col-lg-8">
        <label class="col-lg-4 control-label"><%= id%></label>
      </div>
    </div>
      <div class="col-lg-10">
      <table class="table table-bordered">
          <% while(rs.next()){%>
          <tr>
          <th>Employee Name</th>
          <td><%= rs.getString("emp_name")%></td>
          </tr>
          <tr>
          <th>Employee Email</th>
          <td><%= rs.getString("emp_email")%></td>
          </tr>
          <tr>
          <th>Employee Shift Starts</th>
          <td><%= rs.getDate("emp_shiftfrom")%></td>
          </tr>
          <tr>
          <th>Employee Shift Ends</th>
          <td><%= rs.getDate("emp_shiftto")%></td>
          </tr>
          <tr>
          <th>Employee Shift</th>
          <td><%= rs.getString("emp_shifts")%></td>
          </tr>
          <tr>
          <th>Employee Expected Allowance</th>
          <td><%= rs.getInt("emp_salary")%></td>
          </tr>
          <%}%>
      </table>
      </div>
    <div class="form-group">
    </div>   
    <hr />
    	  
    
   	
  </fieldset>
</form>
                
  			</div>
		</div>
	</div>
  </div>
   	<footer>
            <div class="row navbar">
                <div class="col-lg-9">
                    <p>Copyright &copy; AVS Technologies 2015</p>
                </div>
            </div>
        </footer>	
</div>

   </body>
</html>
