<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<c:set var="name" value="false" />
<c:set var="name1" value="false" />
<c:set var="backup_appln" value="" />
<HTML lang="en">
<HEAD>
	<meta charset="utf-8">
	<meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval};url=index.jsp">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">	

	<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/style_light.css">
	<link rel="stylesheet" href="css/teg-newsticker-v1.css">
	<link rel="stylesheet" href="css/tablecloth.css">
	<link rel="stylesheet" href="css/custom.css">

	<script type="text/javascript">
		function showElem(elem){
			document.getElementById(elem).style.display="block";
		}
		
		function hideElem(elem){
			document.getElementById(elem).style.display="none";		
		}

		function toggleDisplay(elem){
			var e = document.getElementById(elem);
			if(e.style.display=="none")
				e.style.display="block";		
			else
				e.style.display="none";		
		}
	</script>
</HEAD>

<BODY>
<nav class="navbar-wrapper navbar-default navbar-fixed-top nav_alignment" role="navigation">
<div class="container">
	<div class="navbar-header bottom-alignment">
		<ul class="ttw-notification-menu"> <a class="navbar-brand blue_color" href="#content_menu" id="menu"><img src="Images/MyHome.png"/>  Home</a> 
			<li id="tasks" class="notification-menu-item last-item"><a class="navbar-brand blue_color" href="#content_menu9" > <img src="Images/Bell.png"/> Alerts</a> </li>
	    	</ul>
	</div>

	<%String user_name =(String) session.getAttribute("user");
  	session.setAttribute("user_name", user_name);%>  
	<c:set var="user" value="${user_name}" scope="session" />

	<div class="pull-right">
		<img src="Images/tata.png" class="image_alignment"/>
                <ul class="nav pull-right">
			<li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <img src="Images/user.png"/> Welcome, ${user_name}  <b class="caret"></b></a>
	                	<ul class="dropdown-menu">  <li><a href="/monitor/Authorization" method="get"> <img src="Images/logout.png"/>  Logout</a></li> </ul>
			</li>
                </ul>
	</div>	
</div>
</nav>

<div class="container-fluid">
	<div class="jumbotron" align="center">
        	<span style="margin-bottom: 0px" class="gray_color">SERVER DASHBOARD</span>
        </div>
</div>
	
<div id="myModal" title="Basic dialog" style="display:none">
	CPU utilization has crossed the threshold limit(75%). Please turn down any of the applications.
</div>
	
<div id="Message" style="display:none" >
	<a href="#" class="close" data-dismiss="alert">&times;</a>
</div>

<div class="container height_width">
	<div class="row">
        	<div class="col-lg-2 line well" >
                	<ul class="nav nav-list">
	                	<li><label class="tree-toggler nav-header"><img src="Images/server.png"/>   PRODUCTION</label>
                      			<ul class="nav nav-list tree">
                       				<li><label class="tree-toggler abc"> Web Server</label>
                        				<ul class="nav nav-list tree">
		                            			<li><a href="#" id ="menu1">CPU Info</a></li>
		                            			<li><a href="#" id ="menu2">Memory Info</a></li>
                		            			<li><a href="#" id ="menu3">Connection Info</a></li>
                       					</ul>
	                     			</li>
						
						<li><label class="tree-toggler abc">Application Server</label>
							<ul class="nav nav-list tree nav-header">
		                          			<li><a href="#" id ="menu4">Connection Info</a></li>
                        				</ul>
	                   			</li>
	        	                </ul>
            			</li>
            			
				<li class="divider"></li>
            			
				<li><label class="tree-toggler nav-header"><img src="Images/report.png"/> ARCHIVES </label>
                			<ul class="nav nav-list tree">
                  				<li><a href="#" id ="menu5">Web Server</a></li>
	                    			<li><a href="#" id ="menu6">Application Server</a></li>
               				</ul>
            			</li>
       				
				<c:if test ="${user eq 'admin' }">
		 			<li class="divider"></li>
					<li><label class="tree-toggler nav-header" id ="menu7"><img src="Images/setting.png"/>MANAGE SERVERS</label></li>		
				</c:if>
			</ul>
		</div>
		     	
		<div id="content_menu">
			<div class="col-lg-10"> 
 				<div class="row">
					<div class="col-lg-3"> <%@ include file="webserver.jspf" %> </div>
					<div class="col-lg-3"> <%@ include file="appserver.jspf" %> </div>
					<div class="col-lg-3">  <%@ include file="dbserver.jspf" %>  </div>
					<div class="col-lg-3"> 
						<div class="panel panel-default">	
							<div class="panel-heading"> <img src="Images/visitors.png"/>    Visitors  </div>
							<div class="panel-body">
								<div class="visitors blue_color" align="center"><%@include file="visitor.jspf"%></div>
							</div>
                				</div>
														
						<div class="panel panel-default">
							<div class="panel-heading"> <img src="Images/message.png"/>  Notifications</div>
								<div class="panel-body">
									<ul class="list-unstyled">
										<li class="blue_color" >
											<% Date date = new Date();
     											String str = String.format("%tc",date);
											pageContext.setAttribute("str", str);%> ${str}
										</li>
										
										<li> </br></li>
											
										<div>
											<li class="blue_color notification_date"> FEEDS </li>
											<ul class="gray_color notification_timely">  
											<li class="ticker-wrapper feeds">
												<div class="ticker-news"> <%@ include file="feeds.jspf" %> </div> 
											</li>
											</ul>
										</div>
	
										<li> </br></br></li>
											
										<div>							
											<li class="blue_color notification_date"> UPDATES </li>
											<ul class="gray_color notification_timely">
											<li class="ticker-wrapper updates">
												<div class="ticker-news"> <%@ include file="updates.jspf" %> </div> 
											</li>
											</ul>
										</div>
								
										<li> </br> </br></li>
			
										<div>
											<li class="blue_color notification_date"> DATALOAD </li>
											<ul class="gray_color notification_timely">
											<li class="ticker-wrapper dataload">
												<div class="ticker-news"> <%@ include file="dataload.jspf" %> </div> 
											</li>
											</ul>
										</div>

										<li> </br> </br></li>

										<div>											
											<li class="blue_color notification_date"> SCHEDULED JOBS </li>
											<ul class="gray_color notification_timely">
											<li class="ticker-wrapper jobs">
												<div class="ticker-news"><%@ include file="jobs.jspf" %></div>
											</li>
											</ul>
										</div>
										
										<li> </br> </br></li>
												
									</ul>
								</div>
						</div>
					</div>
                                </div>
			</div>
		</div> 
		
	        <div id="back_div" style="display:none">
			<a href="#"  id="back_button"><img src="Images/back_button.png"/></a> 
		</div>
			 
		<div id="content_menu1" style="display:none">
			<div class="col-lg-10" id="CPU"> <%@ include file="cpu.jspf" %> </div>
		</div>

     	     	<div id="content_menu2" style="display:none">
	  		<div class="col-lg-10" id="memory"> <%@ include file="memory.jspf" %> </div>
		</div>
		
		<div id="content_menu3" style="display:none">
			<div class="col-lg-10" id="connection"> <%@ include file="connectioninfo.jspf" %> </div>
		</div>		

		<div id="content_menu4" style="display:none">
			<div class="col-lg-10" id="application"> <%@ include file="applicationinfo.jspf" %> </div>
		</div>

		<div id="content_menu5" style="display:none">
			<div class="col-lg-10"> 
				<div class="row">
					<div class="col-lg-3"> </div>
					<div class="col-lg-4"> 
						<img class="waiting" id="gif_button_server" style="display: none;">
						<div class="panel panel-default" >
                                                	<div class="panel-heading"><img src="Images/calendar.png"/> Pick a date 
								<form>
									<div class="input-append" align="center">
			 						<input class="add-on" name="jspfpicker" id="datetimepicker2" size="10" type="text"></input>
									<button class="btn btn-primary"  onclick="form.action='/monitor/backup_appln';" id="button_server">Go</button>
									</div>
				 				</form>
							</div>   
						</div>
					</div>	
					<div class="col-lg-5"></div>
				</div>
				
				</br>

				<table id="backup_table" class="table table-striped">
					
					<thead>
						<tr>	
						<th class="{sorter: false}">Timestamp</th>
						<th class="headerSortable">Server</th>
						<th class="{sorter: false}">Up Since</th>
						<th class="{sorter: false}">Free RAM Memory</th>
						<th class="{sorter: false}">Cache Used</th>
						<th class="{sorter: false}">Swap Free</th>	
						<th class="{sorter: false}">CPU Utilization</th>
						<th class="{sorter: false}">CPU/IO Utilization Ratio</th>
						<th class="{sorter: false}">Server Status</th>
						<th class="{sorter: false}">Homepage Status</th>
						<th class="{sorter: false}">Memory Usage</th>
						<th class="{sorter: false}">No.of hits</th>
						<th class="{sorter: false}">No.of 404 errors</th>
						<th class="{sorter: false}">Active Threads</th>
						</tr>
					</thead>
					<tbody>
                                        <%String backup_appln =(String) request.getAttribute("backup"); 
					pageContext.setAttribute("backup_appln", backup_appln);%>
				
					<c:choose>
    						<c:when test="${empty backup_appln}">
							<%@ include file="backup.jspf" %>
						</c:when>
				
						<c:when test="${backup_appln eq 'empty'}">
							<script type="text/javascript">
								hideElem('content_menu5');
								showElem('content_menu');
							</script>
							<%@ include file="backup.jspf" %>
						</c:when>					
		
						<c:when test="${backup_appln eq 'notfound'}">
							<script type="text/javascript">
								var msgElem = document.getElementById('Message');
								msgElem.className += " " + "alert alert-info";
								msgElem.appendChild(document.createTextNode("Sorry! File not found for the particular day."));
								showElem('Message');
								hideElem('content_menu');
								showElem('content_menu5')
							</script>
							<%@ include file="backup.jspf" %>
						</c:when>
                         		
						<c:otherwise>
							<script>
								hideElem('content_menu');
								showElem('content_menu5');
							</script>
							<jsp:include page="<%= backup_appln %>" flush="true" />
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	
		<div id="content_menu6"  style="display:none">
			<div class="col-lg-10"> 
				<div class="row" >
					<div class="col-lg-3"></div>
					<div class="col-lg-4"> 
						<img class="waiting" id="gif_button_app" style="display: none;">
						<div class="panel panel-default">
							<div class="panel-heading"><img src="Images/calendar.png"/> Pick a date
								<form>
									<div class="input-append" align="center">
			 						<input class="add-on" name="jspfpicker" id="datetimepicker" size="10" type="text"></input>
									<button class="btn btn-primary" onclick="form.action='/monitor/backup_app_server';" id="button_app">Go</button>
									</div>
				 				</form>
							</div>   
						</div>
					</div>	
					<div class="col-lg-5"></div>
				</div>
				
				</br>
				<table id="application_backup_table" class="table table-striped">
					<thead>
						<tr>	
						<th class="{sorter: false}">Timestamp</th>
						<th class="headerSortable">Server</th>
						<th class="{sorter: false}">Up Since</th>
						<th class="{sorter: false}">Free RAM Memory</th>
						<th class="{sorter: false}">Cache Used</th>
						<th class="{sorter: false}">Swap Free</th>	
						<th class="{sorter: false}">CPU Utilization</th>
						<th class="{sorter: false}">CPU/IO Utilization Ratio</th>
						<th class="{sorter: false}">Server Status</th>
						<th class="{sorter: false}">Lookup Time</th>
						<th class="{sorter: false}">Connection Time</th>
						<th class="{sorter: false}">Transfer Time</th>
						<th class="{sorter: false}">Memory Used</th>
						<th class="{sorter: false}">Active Threads</th>
						</tr>
					</thead>
					<tbody>
					<%String backup_app =(String) request.getAttribute("app_backup"); 
					pageContext.setAttribute("backup_app", backup_app);%>
	
					<c:choose>
    						<c:when test="${empty backup_app}"> 		
							<%@ include file="application_backup.jspf" %> 
						</c:when>
				
						<c:when test="${backup_app eq 'empty'}">
							<script>
								hideElem('content_menu');
								showElem('content_menu6');
							</script>
							<%@ include file="application_backup.jspf" %>
						</c:when>					

						<c:when test="${backup_app eq 'notfound'}">
							<script type="text/javascript">
								var msgElem = document.getElementById('Message');
								msgElem.className += " " + "alert alert-info";
								msgElem.appendChild(document.createTextNode("Sorry! File not found for the particular day."));
								showElem('Message');
								hideElem('content_menu');
								showElem('content_menu6')
							</script>	
							<%@ include file="application_backup.jspf" %>
						</c:when>
                         		
						<c:otherwise>
							<script>
								hideElem('content_menu');
								showElem('content_menu6');
							</script>
							<jsp:include page="<%= backup_app %>" flush="true" />
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		 
			


<div id="content_menu7" style="display:none">
	<c:if test ="${user eq 'admin' }">
		<div class="col-lg-10">
			<div class="col-lg-5">
				<div class="panel panel-default">
					<div class="panel-heading"> <img src="Images/message.png"/>  Notifications</div>
						<div class="panel-body">
							<div class="row">
					   			<div class="span4" style="padding-bottom:0; text-align:center">
                                     				
								</br>            									
								<form accept-charset="UTF-8" action="/monitor/Notification" method="POST"  style="height: 375px;">  Category :
									<select class="span3" id="subject" name="subject">
				                    				<option selected value="feeds">Feeds</option>
										<option value="updates">Updates</option>
			        	           				<option value="jobs">Scheduled Jobs</option>
				   						<option value="dataload">Dataload</option>
				                			</select>	

								</br> </br>		
		     						<textarea class="span4" id="new_message" name="new_message" placeholder="Type in your message" rows="11" cols="30"></textarea>

								</br> </br>		
		       						<button class="btn btn-primary" type="submit" id="feeds_button">Send</button>
								</form>
							</div>
						</div>
					</div>
				</div>	
			</div>
			<div class="col-lg-1"> 	</div>
			<div class="col-lg-6">
				<div class="row">	
					<div class="panel panel-default">
						<div id="server_list" class="panel-heading"> <img src="Images/server_settings.png"/> Manage Servers </div>
							<div class="panel-body">
								<img class="waiting_server" id="gif_button_server" style="display: none;">
				                      		<form>
        	               					<table width="330px" align="center">
									<tr><td colspan="2" align="center" class="gray_color"> Please select a server </td></tr>
									<tr> <td colspan="2"> </br><td></tr>
									<tr>
										<td colspan="2" align="center">    	  
											<select name="server_list">
 												<option>httpd</option>
                        	                                		       		<option>server1</option>
											</select>
										</td>
									</tr>
				<tr> <td colspan="2"> </br><td></tr>
				<tr> 
					<td align="center"> <button class="btn btn-primary" id="button_server_start" onclick="form.action='/monitor/MyServlet';">Start</button> </td>
					<td align="center"> <button class="btn btn-primary" id="button_server_stop"onclick="form.action='/monitor/MyStopServer';">Stop</button> </td>
		 	  	</tr>
			   					</table>
								</form>								
							</div>
					</div>
				</div>
				
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading"><img src="Images/console.png"/> Console</div>
						<div class="panel-body"  style="height: 200px;">
							<%String con_message =(String) request.getAttribute("console_message");
			                                pageContext.setAttribute("con_message", con_message);
							String con_err_message=(String) request.getAttribute("console_error_message");
							pageContext.setAttribute("con_err_message", con_err_message);%> 
							${con_message}
							${con_err_message}
						</div>	
					</div>					
				</div>
			</div>
		</div>
	</c:if>
</div>
              <!--content menu8--->
                       
		<div id="content_menu8"  style="display:block">
               		<div class="col-lg-10">
  				<div class="row">
					<div class="col-lg-6"> <div id="cpuChart"> </div> </div>
					<div class="col-lg-6"> <div id="piechart"> </div> </div>
                        	</div>
                                <div class="row"> 
					<div class="col-lg-1"> </div>
					<div class="col-lg-10"> <div id="linechart"> </div> </div>
					<div class="col-lg-1"> 
				</div>
			<div>
	       	</div> 	
		
</div>
               			

		<%String name =(String) request.getAttribute("flag1"); 
		String server_name=(String) request.getAttribute("server_name");
		pageContext.setAttribute("name", name);%>  
		<c:choose>
    			<c:when test="${name eq 'Success'}">
		        	<script type="text/javascript">
					var server= '<%=server_name%>';
					var msgElem = document.getElementById('Message');
					msgElem.className += " " + "alert alert-success";
					msgElem.appendChild(document.createTextNode(server+" "));
					msgElem.appendChild(document.createTextNode(" server is started successfully"));
					showElem('Message');
					hideElem('content_menu');
					showElem('content_menu7');
			        </script>
   			</c:when>
			<c:when test="${name eq 'Failure'}">
		        	<script type="text/javascript">
					var server= '<%=server_name%>';
					var msgElem = document.getElementById('Message');
					msgElem.className += " " + "alert alert-error";
					msgElem.appendChild(document.createTextNode(" Error occured while starting server "));
					msgElem.appendChild(document.createTextNode(server));
					showElem('Message');
					hideElem('content_menu');
					showElem('content_menu7');
			        </script>
			</c:when>
                       	<c:otherwise>
				<c:if test="${name eq 'Already'}">
		        	<script type="text/javascript">
					var server= '<%=server_name%>';
					var msgElem = document.getElementById('Message');
					msgElem.className += " " + "alert alert-warning";
					msgElem.appendChild(document.createTextNode(server));
					msgElem.appendChild(document.createTextNode(" is already started "));
					showElem('Message');
					hideElem('content_menu');
					showElem('content_menu7');
				</script>
				</c:if>
			</c:otherwise>
		</c:choose>

		<%String name1 =(String) request.getAttribute("flag2");
		String stop_server_name=(String) request.getAttribute("stop_server_name"); 
		pageContext.setAttribute("name1", name1);%>  
		<c:choose>
    			<c:when test="${name1 eq 'Success'}">
		        	<script type="text/javascript">
					var server= '<%=stop_server_name%>';
					var msgElem = document.getElementById('Message');
					msgElem.className += " " + "alert alert-success";
					msgElem.appendChild(document.createTextNode(server));
					msgElem.appendChild(document.createTextNode(" is stopped successfully. "));
					showElem('Message');
					hideElem('content_menu');
					showElem('content_menu7');
			        </script>
			</c:when>
			
			<c:when test="${name1 eq 'Failure'}">
		        	<script type="text/javascript">
					var server= '<%=stop_server_name%>';
					var msgElem = document.getElementById('Message');
					msgElem.className += " " + "alert alert-error";
					msgElem.appendChild(document.createTextNode(" Error occured while stopping server"));
					msgElem.appendChild(document.createTextNode(server));
					showElem('Message');
					hideElem('content_menu');
					showElem('content_menu7');
			        </script>
			</c:when>
                   	<c:otherwise>
				<c:if test="${name1 eq 'Already'}">
		        	<script type="text/javascript">
					var server= '<%=stop_server_name%>';
					var msgElem = document.getElementById('Message');
					msgElem.className += " " + "alert alert-warning";
					msgElem.appendChild(document.createTextNode(server));
					msgElem.appendChild(document.createTextNode("  is already stopped "));
					showElem('Message');
					hideElem('content_menu');
					showElem('content_menu7');
				</script>
				</c:if>
			</c:otherwise>
		</c:choose>	

		<%String notify =(String) request.getAttribute("notified");
			pageContext.setAttribute("notify", notify);%>
			<c:if test="${notify eq 'posted'}">
				<script type="text/javascript">
					var server= '<%=stop_server_name%>';
					var msgElem = document.getElementById('Message');
					msgElem.className += " " + "alert alert-success";
					msgElem.appendChild(document.createTextNode("  Message has been posted successfully!"));
					showElem('Message');
					hideElem('content_menu');
					showElem('content_menu7');
				</script>
			</c:if>
	
       </div><!--- Main row ends--->       
</div><!--- Main Container ends--->  
	    
		<div class="clear"></div>
		<footer style="background-color: rgb(237, 237, 237);">  
		        <div class="container">
				<div class="row"> 
			        	<div class="col-md-4"></div>
					<div class="col-md-4">
			          		<ul class="nav nav-pills">
							<li><a href="#">Support 24x7</a></li>
							<li><a href="#">Privacy Policy</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>

		<script data-main="js/main" src="js/lib/require.js"></script>
</BODY>	
</HTML>
