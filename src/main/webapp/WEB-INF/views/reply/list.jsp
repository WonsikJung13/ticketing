<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/11/24
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<my:navBar/>

<table class="table">
    <tr>
        <td>후기 번호</td>
        <td>작성자</td>
        <td>제목</td>
        <td>작성일자</td>
        <td>게시물 번호</td>
    </tr>
    <c:forEach items="${replyList}" var="Reply">
        <tr>
            <td>
                <c:url value="/reply/get" var="getLink">
                    <c:param name="replyId" value="${Reply.replyId}" />

                </c:url>
                <a href="${getLink}">
                        ${Reply.replyId}
                </a>
            </td>
            <td>
                <c:url value="/reply/get" var="getLink">
                    <c:param name="replyId" value="${Reply.replyId}" />

                </c:url>
                <a href="${getLink}">
                        ${Reply.replyName}
                </a>
                    <%--                <c:if test="${board.countReply > 0}">--%>
                    <%--                                    <span class="badge text-bg-dark">--%>
                    <%--                                        <i class="fa-regular fa-comment-dots"></i>--%>
                    <%--                                        ${board.countReply}--%>
                    <%--                                    </span>--%>
                    <%--                </c:if>--%>
            </td>
            <td>${Reply.replyContent }</td>
            <td>${Reply.time }</td>
            <td>${Reply.contentId }</td>
        </tr>
    </c:forEach>
</table>

<button type="button" onclick="location.href='register'">후기작성</button>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>


