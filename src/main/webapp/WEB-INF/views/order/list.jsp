<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fm" %>
<h2>ORDER LIST</h2>
<table class="table">
	<thead>
		<tr>
			<th>Id</th>
			<th>Order Date</th>
			<th>Address</th>
			<th>Amount</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="o" items="${orders}">
			<tr>
				<td>${o.id}</td>
				<td>${o.orderDate}</td>
				<td>${o.address}</td>
				<td><fm:formatNumber value="${o.amount}" pattern="#,###,###,###₫"/></td>
				<td>
					<a href="/order/detail/${o.id}" class="btn btn-sm btn-default">Detail</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

