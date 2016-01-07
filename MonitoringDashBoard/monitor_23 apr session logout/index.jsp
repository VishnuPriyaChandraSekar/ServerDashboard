<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<HTML lang="en">
<HEAD>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">	
	<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<link rel="stylesheet" href="css/login.css">

	<script src="js/TweenLite.min.js"></script>
	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/knockout-bootstrap.min.js"></script>
</HEAD>

<BODY>
<!-- This is a very simple parallax effect achieved by simple CSS 3 multiple backgrounds, made by http://twitter.com/msurguy -->


             
<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    		<h3 class="panel-title">Sign In </h3>
				</div>
				
				<div class="panel-body">

				 <div id="Login_Message" style="display:none" class="alert alert-danger" >
						<a href="#" class="close" data-dismiss="alert">&times;</a> Invalid Username or Password 
     				 </div>

				<form action="/monitor/Authorization" method="post" >
                    		<fieldset>
					
			    	  	<div class="form-group" id="login_name">
						<input class="form-control" placeholder="Username" name="username" type="text">
			    		</div>
			    		<div class="form-group" id="login_pass">
			    			<input class="form-control" placeholder="Password" name="password" type="password">
			    		</div>
			    		
			    		<input class="btn btn-lg btn-primary btn-block" type="submit" value="Login">
			    	</fieldset>
			      	</form>
				<%String  user_check=(String) request.getAttribute("login_check"); 
				pageContext.setAttribute("user_check", user_check);%>  
	
				<c:if test="${user_check eq 'fail'}">
					<script type="text/javascript">
											
						$("#Login_Message").show();
						$("#login_name").addClass("form-group has-error");
						$("#login_pass").addClass("form-group has-error");
					</script>
				</c:if>				
		
			    </div>
			</div>
		</div>
	</div>
</div>
</BODY>
</HTML>
