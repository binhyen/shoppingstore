<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div class="row">
	<div class="col-sm-5">
		<img class="detail-img" src="/static/image/products/${prod.image}" />
	</div>
	<div class="col-sm-7">
		<ul calss="detail-info">
			<li>Name: ${prod.name}</li>
			<li>UnitPrice: <f:formatNumber value="${prod.unitPrice}"
					pattern="#,###,###,###₫" /></li>
			<li>productDate: <f:formatDate value="${prod.productDate}"
					pattern="dd-MM-yyyy" />
			</li>
			<li>Category: ${prod.category.nameVN}</li>
			<li>Quantity: ${prod.quantity}</li>
			<li>Discount: <f:formatNumber value="${prod.discount}"
					type="percent" /></li>
			<li>View Count: ${prod.viewCount}</li>
			<li>Available: ${prod.available?'Yes':'No'}</li>
			<li>Special: ${prod.special?'Yes':'No'}</li>
		</ul>
	</div>
</div>

<div class="text-justify">${prod.description}</div>

<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#tab1">HÀNG CÙNG
			LOẠI</a></li>
	<li><a data-toggle="tab" href="#tab2">HÀNG YÊU THÍCH</a></li>
	<li><a data-toggle="tab" href="#tab3">HÀNG ĐÃ XEM</a></li>
</ul>

<div class="tab-content">
	<div id="tab1" class="tab-pane fade in active">
		<div>
			<c:forEach var="p" items="${list}">
				<a href="/product/detail/${p.id}"> <img class="thumb-img"
					src="/static/image/products/${p.image}" alt="Lights">
				</a>
			</c:forEach>
		</div>


	</div>
	<div id="tab2" class="tab-pane fade">
		<div>
			<c:forEach var="p" items="${favos}">
				<a href="/product/detail/${p.id}"> <img class="thumb-img"
					src="/static/image/products/${p.image}" alt="Lights">
				</a>
			</c:forEach>
		</div>

	</div>
	<div id="tab3" class="tab-pane fade">
		<div>
			<c:forEach var="p" items="${vieweds}">
				<a href="/product/detail/${p.id}"> <img class="thumb-img"
					src="/static/image/products/${p.image}" alt="Lights">
				</a>
			</c:forEach>
		</div>
	</div>
</div>

