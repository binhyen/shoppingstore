<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/admin/home/index">Trang chủ</a>
		</div>
		
		<ul class="nav navbar-nav">
			<li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Quản lý<span class="caret"></span></a>
        		<ul class="dropdown-menu">
		          <li><a href="/admin/category/index">Thể loại</a></li>
		          <li><a href="/admin/product/index">Sản phẩm</a></li>
		          <li><a href="/admin/customer/index">Khách hàng</a></li>
		          <li><a href="/admin/order/index">Đơn hàng</a></li>
		        </ul>
	      	</li>
	      	<li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Thống kê<span class="caret"></span></a>
        		<ul class="dropdown-menu">
		          <li><a href="/admin/inventory/index">Tồn kho theo loại</a></li>
		          <li><a href="/admin/revenue/category">Doanh số theo loại</a></li>
		          <li><a href="/admin/revenue/customer">Doanh số theo khách hàng</a></li>
		          <li><a href="/admin/revenue/year">Doanh số theo năm</a></li>
		          <li><a href="/admin/revenue/quarter">Doanh số theo quý</a></li>
		          <li><a href="/admin/revenue/month">Doanh số theo tháng</a></li>
		        </ul>
	      	</li>
			<li><a href="/home/index">Trang người dùng</a></li>
		</ul>
		<!-- <ul class="nav navbar-nav navbar-right">
			<li><a href="#">Tiếng Việt</a></li>
			<li><a href="#">English</a></li>
		</ul> -->
	</div>
</nav>