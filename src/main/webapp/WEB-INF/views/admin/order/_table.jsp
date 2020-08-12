<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fm" %>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Id</th>
			<th>Customer</th>
			<th>Order Date</th>
			<th>Shipping Address</th>
			<th>Amount</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<thead>
			<c:forEach var="e" items="${list}">
				<tr>
					<td>${e.id}</td>
					<td>${e.customer.id}</td>
					<td>${e.orderDate}</td>
					<td>${e.address}</td>
					<td><fm:formatNumber value="${e.amount}" pattern="#,###,###,###₫"/></td>
					<td>
						<a class="btn btn-sm btn-info" href="${base}/edit/${e.id}">Edit</a>
						<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</thead>
	</tbody>
</table>
