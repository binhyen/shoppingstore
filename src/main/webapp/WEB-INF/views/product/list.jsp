<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<style>
.text-overflow {
	overflow: hidden; 
	white-space: nowrap; 
	text-overflow: ellipsis;
}

/* .text-overflow:hover {
	overflow: visible;
	white-space: normal; 
	word-break: keep-all;
} */

.product-margin {
	padding: 0px;
}

/* .img-div {
	transition-duration: 0.5s;
}

.img-div:hover {
	transform: scale(1.3);
	cursor: pointer;
} */

</style>

<c:forEach var="p" items="${list}">
	<div class="col-md-4 product-margin">
		<!-- <div class="img-div"> -->
			<div class="thumbnail product-icon-wrapper">
				<c:choose>
					<c:when test="${p.special}">
						<div class="caption label label-warning">Special</div>	
					</c:when>
					<c:when test="${p.discount > 0}">
						<div class="caption label label-danger">Sale ${p.discount*100}%</div>	
					</c:when>
					<c:when test="${p.available}">
						<div class="caption label label-success">New</div>	
					</c:when>
				</c:choose>
				<a href="/product/detail/${p.id}"> <img class="estore-product"
					src="/static/image/products/${p.image}" alt="Lights" style="width: 100%">
				</a>
				
				<div class="caption ">
					<p class="text-overflow">${p.name}</p>
					<div class="pull-right" data-id=${p.id}>
						<button class="btn btn-sm btn-danger btn-add-to-cart">
							<i class="glyphicon glyphicon-shopping-cart"></i>
						</button>
						<button class="btn btn-sm btn-warning btn-star">
							<i class="glyphicon glyphicon-star"></i>
						</button>
						<button class="btn btn-sm btn-warning btn-open-dialog" data-toggle="modal" data-target="#myModal">
							<i class="glyphicon glyphicon-envelope"></i>
						</button>
					</div>
					<p class="text-danger"><f:formatNumber value="${p.unitPrice}"
						pattern="#,###,###,###₫" /></p>
				</div>
				<!-- <img class="pro-icon" alt="new icon image" src="/static/image/new_icon.jpg"> -->
				
			</div>
		<!-- </div> -->
		
	</div>

</c:forEach>

<jsp:include page="dialog.jsp"></jsp:include>