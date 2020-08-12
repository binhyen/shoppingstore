<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.carousel {
    margin-bottom: 0;
    padding: 0 40px 30px 40px;
}
/* The controlsy */
.carousel-control {
	left: -12px;
    height: 40px;
	width: 40px;
    background: none repeat scroll 0 0 #222222;
    border: 4px solid #FFFFFF;
    border-radius: 23px 23px 23px 23px;
    margin-top: 90px;
}
.carousel-control.right {
	right: -12px;
}
/* The indicators */
.carousel-indicators {
	right: 50%;
	top: auto;
	bottom: -10px;
	margin-right: -19px;
}
/* The colour of the indicators */
.carousel-indicators li {
	background: #cecece;
}
.carousel-indicators .active {
background: #428bca;
}

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
</style>
<script>
$(document).ready(function() {
    $('#Carousel').carousel({
        interval: 5000
    })
});
</script>
<h2>TRANG CHỦ</h2>
<div class="row">
	<div class="col-md-12">
               <div id="Carousel" class="carousel slide">
                
               <ol class="carousel-indicators">
                   <li data-target="#Carousel" data-slide-to="0" class="active" ></li>
                   <li data-target="#Carousel" data-slide-to="1"></li>
                   <li data-target="#Carousel" data-slide-to="2"></li>
                   <li data-target="#Carousel" data-slide-to="3"></li>
               </ol>
                
               <!-- Carousel items -->
               <div class="carousel-inner">
               <c:forEach var="c" items="${randoms}" varStatus="loop">
               	<div class="item ${loop.index == 0? 'active': ''}">
                	<div class="caption label label-warning">${c.nameVN}</div>
                	<div class="row">
                		<c:forEach var="p" items="${c.products}">
                		<div class="col-md-3 h-100 d-inline-block">
							<div class="thumbnail">
								<a href="/product/detail/${p.id}"> <img class="estore-product"
									src="/static/image/products/${p.image}" alt="Lights" style="width: 100%">
								</a>
								<p class="text-overflow" >${p.name}</p>
							</div>
						</div>
						</c:forEach>
                	</div><!--.row-->
                	
                </div><!--.item-->
               </c:forEach>    
               <%-- <div class="item active">
               	<div class="caption">Đồng hồ</div>
               	<div class="row">
               		<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop1.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>Dell</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop2.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>Macbook</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop3.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>HP</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop4.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>Macbook</p>
						</div>
					</div>
               	</div><!--.row-->
               	
               </div><!--.item-->
                
               <div class="item">
               	<div class="caption">Laptop</div>
               	<div class="row">
               		<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop1.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>Macbook</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop1.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>Macbook</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop1.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>Macbook</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop1.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>Macbook</p>
						</div>
					</div>
               	</div><!--.row-->
               </div><!--.item-->
                
               <div class="item">
               	<div class="caption">Máy giặt</div>
               	<div class="row">
               		<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop1.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>Macbook</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop1.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>Macbook</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop1.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>Macbook</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="thumbnail">
							<a href="/product/detail/${p.id}"> <img class="estore-product"
								src="/static/image/products/laptop1.jfif" alt="Lights" style="width: 100%">
							</a>
							<p>Macbook</p>
						</div>
					</div>
               	</div><!--.row-->
               </div><!--.item--> --%>
                
               </div><!--.carousel-inner-->
                 <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
                 <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
                 
                 
               </div><!--.Carousel-->
                
	</div>
</div>

<jsp:include page="../product/list.jsp"/>


	
