<%@include file="/common/header.jspf" %>
<<style>
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>
<header>
 		<nav class="navbar navbar-default">
			
			<ul class="nav navbar-nav navbar-right">
			<li class="active"><a href="home.do">Home</a></li>
				<li><a href="account-update.do"><font size="4">Hi, ${name}</font></a></li>
				<li><a href="logout.do">Logout</a></li>
			</ul>
		</nav>
 </header>	
 
 <%
 if(request.getAttribute("msg")!=null)
 {
	 if(request.getAttribute("msg").equals("success"))
	 {
		 %>
		 <div class="alert alert-success alert-dismissible fade in">
		 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong></strong>${success}
		 </div>
		 <% 
	 }
	 else
	 {
	 %>
		 <div class="alert alert-danger alert-dismissible fade in">
		 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>Error</strong>${error}
		 </div>
    <%
	 }
 }
 %>
 
 <div class="container">
 
 <H1>POST YOUR PROPERTY </H1>
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
 

 
 	<form action="register1.do" method="post" class="form-signin">
		<p>
			<font color="red">${error}</font>
		</p>
		<label for="fname"></label>
    <input type="text" id="fname" name="locationname" placeholder="Enter Location Name">

   
    <label for="property type"></label>
    <select id="property type" name="Type Of Property">
      <option value="apartment">Apartment</option>
      <option value="agriculture land">Agriculture land</option>
      <option value="commercial land">Commercial land</option>
       <option value="plot">Plot</option>
      
    </select>
    
     <label for="lname"></label>
    <input type="text" id="lname" name="description" placeholder="Enter Description">
    
  
    <input type="submit" value="Submit">
			    	
	</form>
 </div>
<%@include file="/common/footer.jspf" %>