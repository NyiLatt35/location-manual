<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WEB JDBC</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container pt-4">
		<h1>WEB JDBC</h1>
		<h3>Manual Connection</h3>
		<c:choose>
			<c:when test="${empty list }">
				<a href="locations" class="btn btn-primary">Load Data</a>
			</c:when>
			<c:otherwise>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Burmese</th>
							<th>Capital</th>
							<th>Region</th>
							<th>Type</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="loc" items="${list}">
							<tr>
								<td>${loc.id}</td>
								<td>${loc.name}</td>
								<td>${loc.burmese}</td>
								<td>${loc.capital}</td>
								<td>${loc.region}</td>
								<td>${loc.type}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:otherwise>

		</c:choose>
	</div>
</body>
</html>