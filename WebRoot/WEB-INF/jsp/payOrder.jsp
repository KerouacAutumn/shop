<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>支付页面</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a>
				<img src="${ pageContext.request.contextPath }/images/logo.gif" alt=""/>
			</a>
		</div>
	</div>
	<%@ include file="menu.jsp"%>
	<!-- 菜单栏 -->
</div>
<div class="container login">
		<div class="span12" align="center">
			<div class="wrap" >
				<div class="main">
					<div class="title">
						<strong>微信支付</strong>
					</div>
					<dir><img src="${ pageContext.request.contextPath }/image/Pay.png"/></dir>
					<div><p>请使用微信“扫一扫”<br>扫描二维码支付</p></div>
					<div><strong id="effectivePrice">￥ ${orders.money}</strong></div>
				</div>
			</div>
		</div>
	</div>
<div>
<div>微信支付</div>
<div>二维码</div>
<div><p>请使用微信扫一扫<br>扫描二维码支付</p></div>
</div>

<div class="container footer">
	<div class="span24">
		<ul class="bottomNav">
					<li><hr></hr></li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright ©  农贸市场管理系统 版权所有</div>
	</div>
</div>
</body>
</html>