<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<h2>Shopping Cart</h2>
<table class="table">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Unit Price</th>
			<th>Discount</th>
			<th>Quantity</th>
			<th>Amount</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="p" items="${sessionScope['scopedTarget.cartService'].items}">
			<tr data-id="${p.id}" data-price="${p.unitPrice}" data-discount="${p.discount}">
				<td>${p.id}</td>
				<td>${p.name}</td>
				<td><f:formatNumber value="${p.unitPrice}" pattern="#,###,###,###₫" /></td>
				<td>${p.discount}</td>
				<td><input value="${p.quantity}" type="number" min="1" style="width: 70px"></td>
				<td class="amt"><f:formatNumber value="${p.quantity*p.unitPrice*(1-p.discount)}" pattern="#,###,###,###₫" /></td>
				<td>
					<button class="btn btn-sm btn-warning btn-cart-remove">
						<i class="glyphicon glyphicon-trash"></i>
					</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<td>
	<button class="btn btn-sm btn-danger btn-cart-clear">Clear</button>
	<button class="btn btn-sm btn-info">Continue</button>
	<a href="/order/checkout" class="btn btn-sm btn-success">Checkout</a>
</td>