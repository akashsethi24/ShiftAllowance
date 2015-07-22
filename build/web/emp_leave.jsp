<%-- 
    Document   : emp_leave
    Created on : 26 Jun, 2015, 11:38:34 AM
    Author     : Akach
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="javax.servlet.http.HttpSession" %>
<html dir="ltr" lang="en-US">
    <%
HttpSession sessions = request.getSession(false);
String dates = (String) sessions.getAttribute("date");
%>
   <head>
      <meta charset="UTF-8" />
      <title>AVS | The Creative People</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">
      <script type="text/javascript" src="js/jquery.min.js"></script>
	  <script type="text/javascript" src="Leave/js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="Leave/js/jquery-ui-1.11.1.js"></script>
		<!-->
		<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.11.1.js"></script>
		<!-- -->
		
		<!-- loads mdp -->
		<script type="text/javascript" src="Leave/js/jquery-ui.multidatespicker.js"></script>

		<!-- mdp demo code -->
		<script type="text/javascript">
		<!--
			var latestMDPver = $.ui.multiDatesPicker.version;
			var lastMDPupdate = '2014-09-19';
			
			$(function() {
				// Version //
				//$('title').append(' v' + latestMDPver);
				$('.mdp-version').text('v' + latestMDPver);
				$('#mdp-title').attr('title', 'last update: ' + lastMDPupdate);
				
				// Documentation //
				$('i:contains(type)').attr('title', '[Optional] accepted values are: "allowed" [default]; "disabled".');
				$('i:contains(format)').attr('title', '[Optional] accepted values are: "string" [default]; "object".');
				$('#how-to h4').each(function () {
					var a = $(this).closest('li').attr('id');
					$(this).wrap('<'+'a href="#'+a+'"></'+'a>');
				});
				$('#demos .demo').each(function () {
					var id = $(this).find('.box').attr('id') + '-demo';
					$(this).attr('id', id)
						.find('h3').wrapInner('<'+'a href="#'+id+'"></'+'a>');
				});
				
				// Run Demos
				$('.demo .code').each(function() {
					eval($(this).attr('title','NEW: edit this code and test it!').text());
					this.contentEditable = true;
				}).focus(function() {
					if(!$(this).next().hasClass('test'))
						$(this)
							.after('<button class="test">test</button>')
							.next('.test').click(function() {
								$(this).closest('.demo').find('.hasDatepicker').multiDatesPicker('destroy');
								eval($(this).prev().text());
								$(this).remove();
							});
				});
			});
		// -->
		</script>
                <script>
                    function openWin(a)
                    {
                         
                        window.close();
                    }
                </script>
		<!-- loads some utilities (not needed for your developments) -->
		<link rel="stylesheet" type="text/css" href="Leave/css/mdp.css">
		<link rel="stylesheet" type="text/css" href="Leave/css/prettify.css">
	  
	  
	  
      <style type="text/css">
		.top{
		margin-top:50px;
		height:10px;
		width:100%;
		background:#FF5400;
		
		}

		</style>
      
   </head>
   <body onBlur="self.focus();">
    
    <!--multiDatespicker-->
    <form method="post" action="EmpLeaveController">
        <%Object a = request.getAttribute("value"); %>
<% if(a!=null){ %>
    <div class="alert alert-success" role="alert">Successfully Saved</div>
<%}%>
    <div class="form-group">
      
      <div class="col-lg-10">
				<ul >
					<li class="demo">
						<div id="withAltField" class="box">
							<div id="with-altField" class="col-lg-10"></div>
                                                        <input type="text" id="altField" class="form-control" name="date">
							<div id="with-altField" class="col-lg-10"></div>
                     
							<button type="submit" class="btn btn-primary" >Submit</button>
                                                        <button type="button" class="btn btn-primary" onclick='openWin(this)'>Close</button>
						</div>
						
						<script>
							$('#with-altField').multiDatesPicker({
							altField: '#altField'
							});
                        </script>
						
					</li>
				</ul>
		<div class="clear"></div>
		</div>
   </div>
    <!--/multiDatespicker-->
  
  </fieldset>
</form>
                
  			</div>
		</div>
	</div>
  </div>
 	
</div>

   </body>
</html>