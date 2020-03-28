<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>农贸市场管理系统--商品搜索</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container header">
		<div class="span5">
			<div class="logo"> <img
					src="${pageContext.request.contextPath}/images/logo.gif"
					alt=""> 
			</div>
		</div>
		<%@ include file="menu.jsp"%>
	</div>
	<div class="container productList">
		<div class="span6">
			<div class="hotProductCategory">
				<c:forEach var="c" items="${cList}">
						<dl>
							<dt>
								<a
									href="${pageContext.request.contextPath}/findCategorySecond.action?cid=${c.cid}&page=1">
									${c.cname} </a>
							</dt>
							<c:forEach items="${c.csList}" var="cs">
								<dd>
									<a
										href="${pageContext.request.contextPath}/findCategorySecond1.action?csid=${cs.csid}&page=1">
										${cs.csname}</a>
								</dd>
							</c:forEach>
						</dl>
					</c:forEach>
			</div>
		</div>
		<div class="span18 last"> 

				<div id="result" class="result table clearfix">
					<ul>
						<c:forEach items="${srList}" var="p">
							<li><a
								href="${ pageContext.request.contextPath }/productFindByPid.action?pid=${p.pid}">
									<img
									src="${pageContext.request.contextPath}/${p.image}"
									width="170" height="170" style="display: inline-block;">

										<span style='color: green'> ${p.pname} 
									</span> <span class="price"> 农贸市场价： ￥ ${p.shopPrice} 
									</span>
							</a></li>
						</c:forEach>
					</ul>
				</div> 
		</div>
	</div>
	<div class="container footer">
		<div class="span24">
			<ul class="bottomNav">
				<li><hr></hr></li>
			</ul>
		</div>
		<div class="span24">
			<div class="copyright">Copyright©  农贸市场管理系统 版权所有</div>
		</div>
	</div>
</body>
</html>