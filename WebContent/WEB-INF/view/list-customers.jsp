<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<DOCTYPE html>

<html>

<head>
	<title>List of Customers</title>
	
	<link type="text/css" rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>CRM - CUSTOMER RELATIONSHIP MANAGER</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
			
			<input type="button" value="Add Customer" onclick="window.location.href='showFormForAdd';return false;"
				Class="add-button" />
			
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>	
					<th>Action</th>
				</tr>
				
				
				<c:forEach var="tempCustomer" items="${customers}">
					
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}"></c:param>
					</c:url>
					
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}"></c:param>
					</c:url>
					
					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<td>
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
							onclick="if(!(confirm('Are you sure want to delete this Customer'))) return false">Delete</a>
						</td>
					</tr>
				
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>














