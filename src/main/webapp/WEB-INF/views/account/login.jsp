<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<h2>ĐĂNG NHẬP</h2>

<form action="/account/login" method="post" >
	<h4>${message}</h4>
	<div class="form-group">
		<label>Username</label>
		<input name="id" class="form-control" value="${uid}">
	</div>
	<div class="form-group">
		<label>Password</label>
		<input name="pw" class="form-control" value="${pwd}">
	</div>
	<div class="form-group">
		<div class="form-control">	
			<input name="rm" type="checkbox">
			<label>Remember me?</label>
		</div>
	</div>
	<div class="form-group">
		<button class="btn btn-sm btn-default">Login</button>
	</div>
</form>