<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>订单页面</title>
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

<div class="container cart">
		<div class="span24">
			<div class="step step1">
				<ul>
					<li  class="current"></li>
					<li>生成订单成功</li>
				</ul>
			</div>
				<table>
					<tbody>
						<th colspan="5">订单编号:${orders.oid}&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
					<c:forEach items="${orders.oiList}" var="orderItem">
						<tr>
							<td width="60">
								<input type="hidden" name="id" value="22"/>
								<img src="${pageContext.request.contextPath }/${orderItem.product.image}">
							</td>
							<td>
								<a target="_blank"> ${orderItem.product.pname}</a>
							</td>
							<td>
								${orderItem.product.shopPrice}
							</td>
							<td class="quantity" width="60">
							${orderItem. count}
							</td>
							<td width="140">
								<span class="subtotal">${orderItem.subtotal}</span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
					商品金额: <strong id="effectivePrice">${orders.money}</strong>
				</div>
			<form id="orderForm" action="${pageContext.request.contextPath}/payOrder.action" method="post">
				<input type="hidden" name="oid" value="${orders.oid}"/>
				<div class="span24">
						<p>
							收货地址：<input name="receiveInfo" type="text" value="" style="width:350px" />
								<br />
							收货人&nbsp;&nbsp;&nbsp;：<input name="accepter" type="text" value="" style="width:150px" />
								<br /> 
							联系方式：<input name="phoNum" type="text" value="" style="width:150px" />
						</p>
						<hr />
						
						<div>
							<img src="${ pageContext.request.contextPath }/images/commitment.jpg"/>
							<!-- 在超链接中添加javascript:document.getElementById('orderForm').submit();代码 功能就相当于提交表单 -->
							<a  href="javascript:document.getElementById('orderForm').submit();">
								<img src="${ pageContext.request.contextPath }/images/finalbutton.gif" width="204" height="51" border="0" />
							</a>
						</div>
				</div>
			</form>
		</div>
		
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