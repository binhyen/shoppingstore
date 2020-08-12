<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<h2>FORGOT PASSWORD</h2>

<form action="/account/forgot" method="post">
	<h4>${message}</h4>
	<div class="form-group">
		<label>Username</label>
		<input name="id" class="form-control">
	</div>
	<div class="form-group">
		<label>Email</label>
		<input name="email" class="form-control">
	</div>
	
	<div class="form-group">
		<button class="btn btn-sm btn-default">Retrieve Password</button>
	</div>
</form>