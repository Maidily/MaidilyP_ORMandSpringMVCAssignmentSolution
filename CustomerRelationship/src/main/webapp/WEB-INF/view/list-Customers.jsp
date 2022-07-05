<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<style>
	.header {
		margin-left:50px;
		margin-right:50px;
		height:120px;
		background-color:#33cc33;
		padding:30px 20px;
	}
	h1 {
		letter-spacing:2px;
		font-size:55px;
		text-align:center;
		color:white;
	}
	div {
		margin-left:50px;
		margin-right:50px;
	}
	table, th, td {
		border: none;
		border-collapse: collapse;
	}
	button {
		color:white; 
		background-color: gray; 
		font-weight: bold; 
		cursor: pointer;
		padding: 8px 40px;
		border: none;
		border-radius: 12px;
	}
	#customer td {
		text-align: center;
	}
	#customer tr:nth-child(even) {
		background-color: #cccccc;
	}
</style>

<title>Customer Relationship Management System</title>
</head>

<body>

	<div class="header">
		
		<h1><B> CUSTOMER RELATIONSHIP MANAGEMENT </B></h1>
		
	</div>
	
	<br/><br/>
	
	<div>

		<br/>

		<!-- Add a Add-Customer form -->

		<form action="/customer/showFormForAdd">
			<!-- Add a button -->
			<button type="submit"> Add Customer </button>
		</form>
		
		<br/><br/>
		
		<table id="customer" style="width: 100%;" >
			<thead style="height: 50px; background-color:#33cc33; color: white; " >
				<tr>
	<!--				<th>Customer Id</th>	-->
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>				
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${Customers}" var="tempCustomer">
					<tr>
	<!--					<td><c:out value="${tempCustomer.id}" /></td>		-->
						<td><c:out value="${tempCustomer.firstName}" /></td>
						<td><c:out value="${tempCustomer.lastName}" /></td>
						<td><c:out value="${tempCustomer.email}" /></td>
						<td>
							<!-- Add "update" link --> 
							<a href="/customer/showFormForUpdate?customerId=${tempCustomer.id}"> Update </a> 
							
							 &nbsp; | &nbsp;
							 
							<!-- Add "delete" link -->
							<a href="/customer/delete?customerId=${tempCustomer.id}" style="color:red;"
							onclick="if (!(confirm('Are you sure you want to delete?'))) return false"> Delete </a>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<hr>
		<br/><br/>
		
		<!-- Add a Return to HomePage link -->
		<a href="/">Back to Home Page</a>
		
	</div>


</body>
</html>
