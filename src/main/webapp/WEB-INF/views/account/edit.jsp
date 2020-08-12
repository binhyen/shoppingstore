<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h2>EDIT PROFILE</h2>

<form:form action="/account/edit" modelAttribute="form" enctype="multipart/form-data" >
	<h4>${message}</h4>
	<div class="form-group">
		<label>Username</label>
		<form:input path="id" class="form-control" readonly="true"/>
	</div>
	
	<div class="form-group">
		<label>Fullname</label>
		<form:input path="fullname" class="form-control"/>
	</div>
	<div class="form-group">
		<label>Email</label>
		<form:input path="email" class="form-control"/>
	</div>
	<div class="form-group">
		<label>Photo</label>
		<img alt="profile image" src="/static/image/customers/${form.photo}" style="width: 80px;height: 90px">
		<input type="file" name="photo-file">
		<form:hidden path="photo" class="form-control"/>
	</div>
	<div class="form-group">
		<form:hidden path="password"/>
		<form:hidden path="activated"/>
		<form:hidden path="admin"/>
		<button class="btn btn-sm btn-default">Update</button>
	</div>
</form:form>