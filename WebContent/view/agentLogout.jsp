<%@include file="/common/header.jspf" %>
<header>
 		<nav class="navbar navbar-default">
			
			<ul class="nav navbar-nav">
				<li class="active"><a href="home.do">Home</a></li>
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<li><a href="agentAddServlet.do">add properties</a></li>
			<li><a href="agentTodoList.do">My Properties</a></li>
				<li><a href="agentAccountUpdate.do"><font size="4">Hi ${name},update account</font></a></li>
				<li><a href="logout.do">Logout</a></li>
				
			</ul>
		</nav>
 </header>	
 
  

 

<!--  <TABLE cellpadding="20" border="1" style="background-color:white;" align="center">-->


<%@include file="/common/footer.jspf" %>