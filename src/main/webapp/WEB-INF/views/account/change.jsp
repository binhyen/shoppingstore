<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<h2>CHANGE PASSWORD</h2>

<form action="/account/change" method="post">
	<h4>${message}</h4>
	<div class="form-group">
		<label>Username</label>
		<input name="id" class="form-control">
	</div>
	<div class="form-group">
		<label>Current password</label>
		<input name="pw" class="form-control">
	</div>
	<div class="form-group">
		<label>New password</label>
		<input name="pw1" class="form-control">
	</div>
	<div class="form-group">
		<label>Confirm password</label>
		<input name="pw2" class="form-control">
	</div>
	
	<div class="form-group">
		<button class="btn btn-sm btn-default">Change Password</button>
	</div>
</form>