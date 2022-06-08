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
				<h1 class="text-success">Expense Details</h1>
				<a class="nav-link" href="/expenses">Home</a>
			</div>
			<div class="row">
				<ul class="list-unstyled list-group-flush">
					<li class="list-group-item">Expense Name: <c:out value="${expense.expenseName}"></c:out></li>
					<li class="list-group-item">Description: <c:out value="${expense.description}"></c:out></li>
					<li class="list-group-item">Vendor: <c:out value="${expense.vendor}"></c:out></li>
					<li class="list-group-item">Amount: <c:out value="${expense.amount}"></c:out></li>
				</ul>
			</div>
		</div>
	</body>
</html>
