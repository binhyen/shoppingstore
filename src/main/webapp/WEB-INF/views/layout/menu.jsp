<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags"  prefix="s"%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/home/index">
				<s:message code="lyt.menu.home"/>
			</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/home/about"><s:message code="lyt.menu.about"/></a></li>
			<li><a href="/home/contact"><s:message code="lyt.menu.contact"/></a></li>
			<li><a href="/home/feedback"><s:message code="lyt.menu.feedback"/></a></li>
			<li><a href="/home/faq"><s:message code="lyt.menu.faqs"/></a></li>
			<li class="dropdown">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><s:message code="lyt.menu.account"/><span class="caret"></span></a>
		        <c:choose>
		        	<c:when test="${empty sessionScope.user}">
		        		<ul class="dropdown-menu">
				          <li><a href="/account/login"><s:message code="lyt.menu.login"/></a></li>
				          <li><a href="/account/register"><s:message code="lyt.menu.register"/></a></li>
				          <li><a href="/account/forgot"><s:message code="lyt.menu.forgotpass"/></a></li>
				        </ul>
		        	</c:when>
		        	<c:otherwise>
		        		<ul class="dropdown-menu">
				          <li><a href="/account/logout"><s:message code="lyt.menu.logout"/></a></li>
				          <li><a href="/account/change"><s:message code="lyt.menu.changepass"/></a></li>
				          <li><a href="/account/edit"><s:message code="lyt.menu.updateaccount"/></a></li>
				          <li><a href="/order/list"><s:message code="lyt.order.list"/></a></li>
				          <li><a href="/order/items"><s:message code="lyt.order.items"/></a></li>
				        </ul>
		        	</c:otherwise>
		        </c:choose>
		      </li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/admin/home/index">Trang quản trị</a></li>
			<li><a href="#" data-lang="vi">Tiếng Việt</a></li>
			<li><a href="#" data-lang="en">English</a></li>
		</ul>
	</div>
</nav>

<script>
	$(function(){
		console.log("aaaaaaaaaa");
		$('a[data-lang]').click(function(){
			var lang = $(this).attr("data-lang");
			console.log(lang);
			$.ajax({
				url:'/home/language?lang='+lang,
				success:function(){
					location.reload();
				}
			});
			return false;
		})
	})
</script>