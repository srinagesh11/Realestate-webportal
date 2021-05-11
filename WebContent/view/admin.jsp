<%@include file="/common/header.jspf" %>
<header>
 		<nav class="navbar navbar-default">
			
			<ul class="nav navbar-nav">
			    <li><a href="home.do">Home</a></li>
		 </ul>
		</nav>
 </header> 
<div class="container">
 
 	<form action="adminlogin.do" method="post" class="form-signin">
		<p>
			<font color="red">${error}</font>
		</p>
			<input type="text" class="form-control" name="name" placeholder="Name" required="" autofocus="" />
			<input type="password" class="form-control" name="password" placeholder="Password" required=""/>
			    	      
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button> 
			    	
	</form>

 
 </div>
 
			    	
<%@include file="/common/footer.jspf" %>