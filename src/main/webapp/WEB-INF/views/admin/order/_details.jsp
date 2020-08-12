<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fm"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Unit Price</th>
			<th>Discount</th>
			<th>Quantity</th>
			<th>Amount</th>
		</tr>
	</thead>
	<tbody>
		<thead>
			<c:forEach var="e" items="${details}">
				<tr>
					<td>${e.product.id}</td>
					<td>${e.product.name}</td>
					<td><fm:formatNumber value="${e.unitPrice}" pattern="#,###,###,###₫" /></td>
					<td>${e.discount}</td>
					<td>${e.quantity}</td>
					<td><fm:formatNumber value="${e.unitPrice*e.quantity*(1-e.discount)}" pattern="#,###,###,###₫" /></td>
				</tr>
			</c:forEach>
		</thead>
	</tbody>
</table>
