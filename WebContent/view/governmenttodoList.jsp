<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/header.jspf"%>


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
	<H1 align="center">Properties List</H1>
	
	
<form class="form-search" action="governmentsearchtodoservlet.do" >
		<div class="input-append">
			<input type="text" class="search-query input-medium" name="keyword">
			<button type="submit" class="btn btn-large">Search</button>
		</div>
	</form>

	


	<table class="table table-striped">
		<caption>Properties  are</caption>
		<thead>
			<th>Location Name</th>
			<th>Property Type</th>
			<th>Description</th>
			<th>Actions</th>
		</thead>
		<tbody>
			<c:forEach items="${todos}" var="todo">
				<tr>
					<td>${todo.location_name}</td>
					<td>${todo.property_type}</td>
				    <td>${todo.description}</td>
					<td>&nbsp;&nbsp;<a class="btn btn-danger"
						href="governmentdeletetodoservlet.do?user_id=${todo.user_id}">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<p>
		<font color="red">${errorMessage}</font>
	</p>
	

</div>


<%@include file="/common/footer.jspf"%>