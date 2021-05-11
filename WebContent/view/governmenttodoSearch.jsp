<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/common/header.jspf" %>

 <header>
 		<nav class="navbar navbar-default">
			<p>
		
		</p>
			<ul class="nav navbar-nav navbar-right">
			<li class="active"><a href="home.do">Home</a></li>
				<li><a href="governmentlogout.do">Logout</a></li>
			</ul>
		</nav>
 </header>

 
 <div class="container">
 	<H1 align="center">Property Search List</H1>
 	<table class="table table-striped">
		<caption>Searched for <b>${keyword}</b> and found <b>${searchSize}</b> Properties</caption>
		<thead>
			<th>Location Name</th>
			<th>Property Type</th>
			<th>Description</th>
		</thead>
		<tbody>
			<c:forEach items="${todos1}" var="todo">
				<tr>
					<td>${todo.location_name}</td>
					<td>${todo.property_type}</td>
					<td>${todo.description}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<p>
		<font color="red">${errorMessage}</font>
	</p>
	<a class="btn btn-success" href="governmenttodolist.do">Back</a>
 	
 </div>
 
 
 
 <%@include file="/common/footer.jspf" %>