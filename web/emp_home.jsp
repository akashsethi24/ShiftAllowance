<%-- 
    Document   : emp_home
    Created on : 24 Jun, 2015, 9:08:56 AM
    Author     : Akach
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="javax.servlet.http.HttpSession" %>
<%
HttpSession sessionsa = request.getSession(false);
HttpSession sessions = request.getSession(false);
String name = (String) sessionsa.getAttribute("name");
String email = (String) sessionsa.getAttribute("email");
String id = (String) sessionsa.getAttribute("id");
String date = (String) sessions.getAttribute("date");
%>
<html dir="ltr" lang="en-US">
   <head>
      <meta charset="UTF-8" />
      <title>AVS | The Creative People</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">
      <link rel="stylesheet" type="text/css" media="all" href="css/daterangepicker-bs3.css" />
      <script type="text/javascript" src="js/jquery.min.js"></script>
      <script type="text/javascript" src="js/bootstrap.min.js"></script>
      <script type="text/javascript" src="js/moment.js"></script>
      <script type="text/javascript" src="js/daterangepicker.js"></script>
      
	  <script language="JavaScript">
    <!--
    function openWin(){
      var myBars = 'directories=no,location=no,menubar=no,status=no';
      myBars += ',titlebar=no,toolbar=no';
      var myOptions = 'scrollbars=no,width=460,height=460,resizeable=no';
      var myFeatures = myBars + ',' + myOptions;
      var newWin = open('emp_leave.jsp', '', myFeatures);
      newWin.document.close();
      newWin.focus();
    }
    -->
    </script>
	  
	  
      <style type="text/css">
		.top{
		margin-top:50px;
		height:10px;
		width:100%;
		background:#FF5400;
		
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
            <li><a href="emp_view.jsp"><i class="fa fa-gear fa-fw"></i>View Shift</a></li>
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
  				<a href="emp_home.jsp" class="list-group-item active">
				<i class="fa  fa-angle-double-right"></i>&nbsp;
                Request Shift
  				</a>
  				<a href="emp_end.jsp" class="list-group-item">
            	Actual Shift
  				</a>
            	
				<a href="emp_view.jsp" class="list-group-item">
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
    			
                            <form class="form-horizontal" method='post' action="EmpReqController">
  <fieldset>
    <legend>Plan your shift.</legend>
    <div class="form-group">
      <label class="col-lg-2 control-label">Employee ID</label>
      <div class="col-lg-10">
        <label class="col-lg-2 control-label"><%= id%></label>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-lg-2 control-label">Name</label>
      <div class="col-lg-8">
        <label class="col-lg-4 control-label"><%= name%></label>
      </div>
    </div>
    <hr />
    
    
    <div class="form-group">
      <label for="select" class="col-lg-2 control-label">Type</label>
      <div class="col-lg-10">
        <select class="form-control" name="shifts" id="select">
          <option>..Select..</option>
		  <option value='day'>Day</option>
          <option value='evening'>Evening</option>
          <option value='night'>Night</option>
        </select>
      </div>
    </div>    
	
	<div class="form-group">
        <label for="select" class="col-lg-2 control-label">Shift Period</label>
            <div class="col-lg-10">

               <form class="form-horizontal">
                 <fieldset>
                  <div class="control-group">
                    <div class="controls">
                     <div class="input-prepend input-group">
                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span><input type="text" style="width: 200px" name="reservation" id="reservation" class="form-control" /> 
                     </div>
                    </div>
                  </div>
                 </fieldset>
               </form>

               <script type="text/javascript">
               $(document).ready(function() {
                  $('#reservation').daterangepicker(null, function(start, end, label) {
                    console.log(start.toISOString(), end.toISOString(), label);
                  });
               });
               </script>

            </div>
	</div>

	
<div class="form-group">
       <label for="select" class="col-lg-2 control-label">Leave</label>
      <div class="col-lg-8">
          <div class="form-group">
      <div class="col-lg-8">
        <button type="button" class="btn btn-primary" onClick='openWin()'>Select Date</button>
      </div>
    </div>
		
      </div>
    </div>  
     <div class="form-group">
      <label class="col-lg-2 control-label">Cab</label>
      <div class="col-lg-10">
        <div class="checkbox">
          <label>
            <input type="checkbox" name='cab' value='y'>
			</label>
        </div>
      </div>
    </div>
	<div class="form-group">
      <label class="col-lg-2 control-label">Weekend</label>
      <div class="col-lg-10">
        <div class="checkbox" name='weekend' value='y'>
          <label>
            <input type="checkbox">
			</label>
        </div>
      </div>
    </div>
	  
    
    <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">Description</label>
      <div class="col-lg-10">
        <textarea class="form-control" name='des' rows="3" id="textArea"></textarea>
        <span class="help-block">Mention the reason for your plan of the shift.</span>
      </div>
    </div>

    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>    
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
<script type="text/javascript">
               $(document).ready(function() {
                  $('#from').daterangepicker({ singleDatePicker: true }, function(start, end, label) {
                    console.log(start.toISOString(), end.toISOString(), label);
                  });
               });
			   $(document).ready(function() {
                  $('#to').daterangepicker({ singleDatePicker: true }, function(start, end, label) {
                    console.log(start.toISOString(), end.toISOString(), label);
                  });
               });
               </script>

   </body>
</html>