<%-- 
    Document   : adm_approve
    Created on : 18 Jul, 2015, 8:46:27 AM
    Author     : Akach
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="javax.servlet.http.HttpSession" 
   import="java.sql.ResultSet"
   import="shiftModel.Admin"%>
<%
HttpSession sessionsa = request.getSession(false);
HttpSession sessions = request.getSession(false);
String name = (String) sessionsa.getAttribute("name");
String id = (String) sessionsa.getAttribute("id");
%>
<%
int offset=0,limit=10;
ResultSet rs = Admin.selectRequested(offset, limit);
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
      <script type="text/javascript">
    $(function () {
     

      $('.chkSelectAll').click(function () {
        $('.chkNumber').prop('checked', $(this).is(':checked'));
      });

      $('.chkNumber').click(function () {
        if ($('.chkNumber:checked').length == $('.chkNumber').length) {
          $('.chkSelectAll').prop('checked', true);
        }
        else {
          $('.chkSelectAll').prop('checked', false);
        }
      });

    });
  </script>
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
            <li><a href="#"><i class="fa fa-user fa-fw"></i>Profile</a></li>
            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
            <li class="divider"></li>
            <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
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
  				<a href="ManagerHome.html" class="list-group-item">
                View
  				</a>
  				<a href="TransportHome.html" class="list-group-item">
            	Label 1
  				</a>
            	<a href="AdminHome.html" class="list-group-item">
            	Label 2
  				</a>
				<a href="Admin2Home.html" class="list-group-item active">
				<i class="fa  fa-angle-double-right"></i>&nbsp;
            	Label 3
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
    			
                            <form class="form-horizontal" method="post" action="Adm_ApproveController">
  <fieldset>
    <legend>Plan your shift.</legend>
    <div class="form-group">
      <label class="col-lg-2 control-label">Admin ID</label>
      <div class="col-lg-10">
        <label class="col-lg-2 control-label"><%= id%></label>
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-2 control-label">Select All</label>
      <div class="col-lg-10">
        <input type="checkbox" class="chkSelectAll" onchange="checkall(this)" />
      </div>
    </div>
      <div class="col-lg-10">
          <table class="table table-bordered">
              <tr>
                  <th>Status</th>
                  <th>Employee Name</th>
                  <th>Shift</th>
                  <th>From</th>
                  <th>To</th>
                  <th>Leaves</th>
                  <th>Allowance</th>
              </tr>
       
              <%while(rs.next()){%>
              <tr>
                  <td><input type="checkbox" onchange="check(this)" value=<%= rs.getInt("emp_sur")%>  class="chkNumber" name="abc" id=<%= rs.getInt("emp_sur")%> /></td>
                  <td><%= rs.getString("emp_name")%></td>
                  <td><%= rs.getString("emp_shifts")%></td>
                  <td><%= rs.getDate("emp_shiftfrom")%></td>
                  <td><%= rs.getDate("emp_shiftto")%></td>
                  <td><%= rs.getString("emp_leave")%></td>
                  <td><%= rs.getInt("emp_salary")%></td>
              </tr>
          <%}%>
          </table>
          
      </div>
      
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Reset</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
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
          <script>
 function check(a)
        {
            alert("Done")
           if(a.checked==true)
           {
               a.value=a.id;
           }
           else
           {
               a.value=false;
               alert('happen')
           }
        }
        
        </script>
        <script>
            function checkall(a)
            {
                if(a.checked==true)
                {
                    
                }
                else
                {
                    document.getElementsByClassName("chkNumber").value=false;
                }
            }
            
        </script>
   </body>
</html>