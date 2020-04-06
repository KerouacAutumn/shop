<%--
  Created by IntelliJ IDEA.
  User: waqwb
  Date: 2020/4/3
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="ck" uri="http://ckeditor.com" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
                    <%--							<jsp:useBean id="pageBean" scope="request" type="javafx.collections.ListChangeListener.Change"/>--%>
                    <c:forEach items="${pageBean.list}" var="comment">
                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="18%">${comment.id}</td>

                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="10%">${comment.pid}
                            </td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="50%"><strong><font color="red">${comment.pid}
                            </font>
                            </strong></td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center"
                                width="30%">${comment.pid}
                            </td>
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
</body>
</html>
