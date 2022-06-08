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
			<div class="row bg-light">
				<h1 class="text-center text-success">Expense Tracker</h1>
			</div>
			<div class="row">
				<div class="col">
					<h3 class="text-center">Expense List</h3>
					<table class="table table-hover table-success">
						<thead class="text-center">
							<tr>
								<th>Expense Name</th>
								<th>Vendor</th>
								<th>Amount</th>
								<th>Description</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="expense" items="${expenses}">
							<tr>
								<td><a href="/expenses/view/${expense.id}"><c:out value="${expense.expenseName}"></c:out></a></td>
								<td><c:out value="${expense.vendor}"></c:out></td>
								<td class="text-center"><c:out value="${expense.amount}"></c:out></td>
								<td><c:out value="${expense.description}"></c:out></td>
								<td><a href="/expenses/${expense.id}">Edit</a> | 
									<form:form action="/expenses/delete/${expense.id}" method="POST">
										<input type="hidden" name="_method" value="delete"/>
										<input class="btn btn-link" type="submit" value="Delete"/>
									</form:form>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col">
					<h3 class="text-center">Add New Expense</h3>
					<form:form class="form" action="/expenses/add" method="POST" modelAttribute="expense">
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
		</div>
	</body>
</html>
