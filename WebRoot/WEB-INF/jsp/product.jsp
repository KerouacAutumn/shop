<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ck" uri="http://ckeditor.com" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>农贸市场管理系统</title>
    <link href="${pageContext.request.contextPath}/css/common.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/product.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/slider.css"
          rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/index.css"
          rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="container header">
    <div class="span5">
        <div class="logo">
            <a> <img
                    src="${pageContext.request.contextPath}/images/logo.gif"
                    alt=""></a>
        </div>
    </div>

    <%@ include file="menu.jsp" %>
</div>
<div class="container productContent">
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

        <div class="productImage">
            <div class="zoomPad">
                <img style="opacity: 1;" title="" class="medium"
                     src="${pageContext.request.contextPath}/${product.image}">
                <div
                        style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;"
                        class="zoomPup"></div>
                <div
                        style="position: absolute; z-index: 5001; left: 312px; top: 0px; display: block;"
                        class="zoomWindow">
                    <div style="width: 368px;" class="zoomWrapper">
                        <div style="width: 100%; position: absolute; display: none;"
                             class="zoomWrapperTitle"></div>
                        <div style="width: 0%; height: 0px;" class="zoomWrapperImage">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="name">
            ${product.pname}
        </div>
        <div class="sn">
            <div>
                编号：
                ${product.pid}
            </div>
        </div>
        <div class="info">
            <dl>
                <dt>商城价:</dt>
                <dd>
                    <strong>￥： ${product.shopPrice} 元
                    </strong> 参 考 价：
                    <del>
                        ￥
                        ${product.marketPrice}
                        元
                    </del>
                </dd>
            </dl>
            <dl>
                <dt>促销:</dt>
                <dd>
                    <a target="_blank" title="限时抢购 ">限时抢购</a>
                </dd>
            </dl>
            <dl>
                <dt>库存：</dt>
                <dd>
                    ${product.stock}
                </dd>
            </dl>
        </div>
        <form id="cartForm" action="${pageContext.request.contextPath }/addCart.action" method="post">
            <input type="hidden" name="pid" value="${product.pid}"></input>
            <div class="action">
                <dl class="quantity">
                    <dt>购买数量:</dt>
                    <dd>

                        <input type=button value="+" onClick="javascript:this.form.count.value++;">
                        <input id="count" name=count value=1 maxlength="4"
                               type="text"/>

                        <input type=button value="-" onClick="javascript:this.form.count.value--;">
                    </dd>
                    <!-- <a href="javascript:void(0)" id="delNum" onclick="change(-1)">-</a>
                <input id="buyNumInp" name="buyNum" type="text" value="1" />
                <a href="javascript:void(0)" id="addNum" onclick="change(1)">+</a> -->
                    <dd>件</dd>
                </dl>
                <div class="buy">
                    <c:if test="${product.stock > 0 }">
                        <input id="addCart" class="addCart" value="加入购物车" type="submit" title="点击加入购物车"/>
                    </c:if>
                    <c:if test="${product.stock == 0 }">
                        <b style="color:red; font-size:20px">不好意思亲，商品已售空</b>

                    </c:if>

                </div>
            </div>
        </form>
        <div id="bar" class="bar">
            <ul>
                <li id="introductionTab"><a href="#introduction">商品介绍</a></li>

            </ul>
        </div>

        <div id="introduction" name="introduction" class="introduction">
            <div class="title">
                <strong>${product.pdesc}</strong>
            </div>
            <div>
                <img src="${pageContext.request.contextPath}/${product.image}">
            </div>
        </div>
        <div class="container cart">
            <table>
                <tr>
                    <td class="ta_01" align="center" bgColor="#f5fafe">
                        <table cellspacing="0" cellpadding="1" rules="all"
                               bordercolor="gray" border="1" id="DataGrid1"
                               style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                            <tr
                                    style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #FFE4C4">

                                <td align="center" width="18%">序号</td>
                                <td align="center" width="17%">用户昵称</td>
                                <td align="center" width="17%">留言</td>
                                <td align="center" width="17%">留言日期</td>

                            </tr>
                            <c:forEach items="${pageBean.list}" var="comment">
                                <tr onmouseover="this.style.backgroundColor = 'white'"
                                    onmouseout="this.style.backgroundColor = '#F5FAFE';">
                                    <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                        width="18%">${comment.id}</td>

                                    <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                        width="10%">${comment.uid}
                                    </td>
                                    <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                        width="50%"><strong><font color="red">${comment.replycontent}
                                    </font>
                                    </strong></td>
                                    <%--<td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                        width="30%">${comment.savetime}
                                    </td>--%>
                                </tr>
                            </c:forEach>
                        </table></td>
                </tr>
                <tr align="center">
                    <td colspan="7">
                        <div class="pagination">
                            <span>第${pageBean.page}/${pageBean.totlePage}页</span>
                            <c:if test="${pageBean.page!=1}">
                                <a href="${ pageContext.request.contextPath }/commentList.action?page=1" class="firstPage">&nbsp;</a>
                                <a
                                        href="${ pageContext.request.contextPath }/commentList.action?page=${pageBean.page-1}"
                                        class="previousPage">&nbsp;</a>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${pageBean.totlePage}">
                                <c:choose>
                                    <c:when test="${pageBean.page!=i}">
                                        <a
                                                href="${pageContext.request.contextPath }/commentList.action?page=${i}">
                                                ${i}
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="currentPage">${i}</span>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:if test="${pageBean.page!=pageBean.totlePage}">
                                <a class="nextPage"
                                   href="${ pageContext.request.contextPath }/commentList.action?page=${pageBean.page+1}">&nbsp;</a>
                                <a class="lastPage"
                                   href="${ pageContext.request.contextPath }/commentList.action?page=${pageBean.totlePage}">&nbsp;</a>
                            </c:if>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="7">
                        <form action="${ pageContext.request.contextPath }/saveComment.action" method="post">
                            <textarea rows="10" cols="10" id="commentinfo" name="commentinfo"></textarea>
                            <ck:replace replace="commentinfo" basePath="ckeditor"></ck:replace>
                            <input type="submit" value="发表留言"></input>
                        </form>
                    </td>
                </tr>
            </table>
        </div>


    </div>
</div>
<div class="container footer">
    <div class="span24">
        <ul class="bottomNav">
            <li>
                <hr></hr>
            </li>
        </ul>
    </div>
    <div class="span24">
        <div class="copyright">Copyright © 农贸市场管理系统 版权所有</div>
    </div>
</div>
</body>
</html>