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
	.container {
		margin-left:50px;
		margin-right:50px;
		width: 100%;
	}
	table, th, td {
		border: none;
		border-collapse: collapse;
		padding: 15px;
		font-weight: bold;
	}
	#customer {
		margin-left: 15%;
	}
	button {
		color: white; 
		background-color: gray; 
		font-weight: bold; 
		cursor: pointer;
		padding: 8px 40px;
		margin: auto;
		border: none;
		border-radius: 12px;
		margin-left: 20%;
	}
	p {
		font-weight: bold;
	}
	input {
		height: 20px;
		border-radius: 4px;
	}
</style>

<title>Customer Relationship Management System</title>

<script type="text/javascript">
	function validate() {
		var fName = document.customer.firstName.value;
		if(fName == null || fName == "") {
			alert("Please Enter the First Name");
			return false;
		}
		var lName = document.customer.lastName.value;
		if(lName == null || lName == "") {
			alert("Please Enter the Last Name");
			return false;
		}
		var email = document.customer.email.value;
		if(email == null || email == "") {
			alert("Please Enter the Email");
			return false;
		}
	}
</script>

</head>

<body>

	<div class="header">
		
		<h1><B> CUSTOMER RELATIONSHIP MANAGEMENT </B></h1>
		
	</div>
	
	<br/><br/>
	
	<div class="container" >
		
		<br/><br/>
		
		<h2>Save Customer</h2>
		
		<form action="/customer/save" method="POST" style="width:100%;" name="customer" >
			
			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="id" value="${Customer.id}" />
			
			<table id="customer" >
				<tbody>
					<tr>
						<td> First Name: </td>
						<td> <input type="text" name="firstName" value="${Customer.firstName}" placeholder="Enter the First Name"> </td>							                </tr>
					<tr>
						<td> Last Name: </td>
						<td> <input type="text" name="lastName" value="${Customer.lastName}" placeholder="Enter the Last Name"> </td>							                </tr>
					<tr>
						<td> Email: </td>
						<td> <input type="text" name="email" value="${Customer.email}" placeholder="Enter the Email"> </td>
					</tr>
				</tbody>
			</table>
						
			<br/><br/>
			
			<button type="submit" onClick="return validate();" > Save </button>
		</form>
		
		<hr>
		<br/><br/>
		
		<!-- Add a Return to Customer List link -->
		<a href="/customer/list" >Back to List</a>
		
	</div>
</body>

</html>
