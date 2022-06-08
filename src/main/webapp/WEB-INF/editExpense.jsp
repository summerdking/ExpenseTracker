<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Expense Tracker</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	</head>
	<body>
		<div class="container-lg">
			<div class="navbar bg-light">
			<h1 class="text-success">Edit Expense</h1>
			<a class="nav-link" href="/expenses">Home</a>
			</div>
			<div class="row">
				<form:form action="/expenses/edit/${expense.id}" method="POST" modelAttribute="expense">
					<input type="hidden" name="_method" value="put"/>
					
					<form:label class="form-label" path="expenseName">Expense Name:</form:label>
					<form:errors class="text-danger" path="expenseName"/>
					<form:input class="form-control" type="text" path="expenseName"/>
					
					<form:label class="form-label" path="vendor">Vendor:</form:label>
					<form:errors class="text-danger" path="vendor"/>
					<form:input class="form-control" type="text" path="vendor"/>
					
					<form:label class="form-label" path="amount">Amount:</form:label>
					<form:errors class="text-danger" path="amount"/>
					<form:input class="form-control" type="number" step="0.01" path="amount"/>
					
					<form:label class="form-label" path="description">Description:</form:label>
					<form:errors class="text-danger" path="description"/>
					<form:textarea class="form-control" path="description"></form:textarea>
					
					<input class="btn-success mt-3" type="submit" value="Submit">
				</form:form>
			</div>
		</div>
	</body>
</html>
