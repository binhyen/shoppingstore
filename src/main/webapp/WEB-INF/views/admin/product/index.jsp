<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<h2 class="alert-warning">PRODUCT MANAGER</h2>
<c:set var="base" value="/admin/product" scope="request"></c:set>
<h4 class="label label-success">${message}${param.message}</h4>
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#tab1">Edit</a></li>
  <li><a data-toggle="tab" href="#tab2">List</a></li>
</ul>

<div class="tab-content">
  <div id="tab1" class="tab-pane fade in active">
  	<jsp:include page="_form.jsp"></jsp:include>
  </div>
  <div id="tab2" class="tab-pane fade">
  	<jsp:include page="_table.jsp"></jsp:include>
  </div>
</div>