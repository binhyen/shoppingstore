<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="form-group">
				<label>Order Id</label>
				<form:input path="id" class="form-control" readonly="true" />
			</div>
			<div class="form-group">
				<label>Customer</label>
				<form:input path="customer.id" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Order Date</label>
				<form:input path="orderDate" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Address</label>
				<form:input path="address" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Total Amount</label>
				<form:input path="amount" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Total Amount</label>
				<form:textarea path="description" class="form-control"/>
			</div>
			<div class="form-group">
				<button class="btn btn-sm btn-primary" formaction="${base}/create">Create</button>
				<button class="btn btn-sm btn-warning" formaction="${base}/update">Update</button>
				<button class="btn btn-sm btn-danger" formaction="${base}/delete">Delete</button>
				<a class="btn btn-sm btn-default" href="${base}/index">Reset</a>
			</div>
		</form:form>
		<c:if test="${!empty details}">
			<jsp:include page="_details.jsp"></jsp:include>
		</c:if>
	</div>
</div>

