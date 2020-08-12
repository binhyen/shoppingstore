<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<h2 class="alert alert-success">REVENUE BY CUSTOMER</h2>

<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#home">Chart</a></li>
  <li><a data-toggle="tab" href="#menu1">Data</a></li>
</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
  	<jsp:include page="_revenue_customer.jsp"></jsp:include>
  </div>
  <div id="menu1" class="tab-pane fade">
  	<table class="table table-hover">
		<thead>
			<tr>
				<th>Category</th>
				<th>Quantity</th>
				<th>Revenue</th>
				<th>Min</th>
				<th>Max</th>
				<th>Avg</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<thead>
				<c:forEach var="e" items="${data}">
					<tr>
						<td>${e[0]}</td>
						<td>${e[1]}</td>
						<td>$<f:formatNumber value="${e[2]}" pattern="#,###.00"/></td>
						<td>$<f:formatNumber value="${e[3]}" pattern="#,###.00"/></td>
						<td>$<f:formatNumber value="${e[4]}" pattern="#,###.00"/></td>
						<td>$<f:formatNumber value="${e[5]}" pattern="#,###.00"/></td>
					</tr>
				</c:forEach>
			</thead>
		</tbody>
	</table>
  </div>
</div>