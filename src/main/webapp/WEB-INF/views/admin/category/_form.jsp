<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="form-group">
				<label>Id</label>
				<form:input path="id" class="form-control" readonly="true"/>
			</div>
			<div class="form-group">
				<label>Name</label>
				<form:input path="name" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Name VN</label>
				<form:input path="nameVN" class="form-control"/>
			</div>
			<div class="form-group">
				<button class="btn btn-sm btn-primary" formaction="${base}/create">Create</button>
				<button class="btn btn-sm btn-warning" formaction="${base}/update">Update</button>
				<button class="btn btn-sm btn-danger" formaction="${base}/delete">Delete</button>
				<a class="btn btn-sm btn-default" href="${base}/index">Reset</a>
			</div>
		</form:form>
	</div>
</div>

