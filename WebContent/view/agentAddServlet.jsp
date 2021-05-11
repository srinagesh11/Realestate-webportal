<%@include file="/common/header.jspf" %>
<header>
 		<nav class="navbar navbar-default">
			
			<ul class="nav navbar-nav">
				<li class="active"><a href="home.do">Home</a></li>
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
			
			<li><a href="agentTodoList.do">My Properties</a></li>
				<li><a href="agentAccountUpdate.do"><font size="4">Hi ${name},update account</font></a></li>
				<li><a href="logout.do">Logout</a></li>
				
			</ul>
		</nav>
 </header>	
 
 
 
   <div class="container">
 
 <H1 align="center">ADD PROPERTY </H1>
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
 

 
 	<form action="agentAddServlet.do" method="post" class="form-signin">
		<p>
			<font color="red">${error}</font>
		</p>
			<input type="text" class="form-control" name="location_name" placeholder="Location_Name" required="" autofocus="" />
			<input type="text" class="form-control" name="property_type" placeholder="property_type" required="" autofocus="" />
			<input type="text" class="form-control" name="description" placeholder=" description" required="" autofocus="" />
			    	      
      <button id="submit" class="btn btn-lg btn-primary btn-block" type="submit">Add</button> 
			    	
	</form>
 </div>
 
<%@include file="/common/footer.jspf" %>