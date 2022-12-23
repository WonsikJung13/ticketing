<%--
  Created by IntelliJ IDEA.
  User: sunggyu-lim
  Date: 2022/11/24
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>전시회 목록</title>
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
          crossorigin="anonymous">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="/static/fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
  <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
  <!-- https://fonts.google.com/ -->

</head>
<body>
<my:sideBar active="contentList"/>

<div class="container-fluid">
  <main class="tm-main">
    <p>총 ${contentDto.countContent} 개의 상품이 있습니다.</p>

    <div class="row tm-row">
      <c:forEach items="${contentList}" var="content">
      <c:url value="/content/get" var="getLink">
        <c:param name="contentId" value="${content.contentId}"></c:param>
      </c:url>
        <input type="hidden" class="scrolling" data-contentId="${content.contentId}">
      <article class="col-12 col-md-6 tm-post" style="min-width:50%;max-width:calc(100 - 50%);">

        <hr class="tm-hr-primary">

        <div class="tm-post-link-inner" style="">
          <a href="${getLink}" class="effect-lily tm-post-link tm-pt-60" style="max-height: 626px;">
              <%-- 이미지 --%>
            <img src="${imgUrl}/${content.contentId}/${content.contentPosterName}" alt="Image" class="img-fluid" style="max-width:470px">
          </a>
        </div>
              <%-- 제목 --%>
            <h2 class="tm-pt-30 tm-color-primary tm-post-title">"${content.contentName}"</h2>

          <%-- 날짜 --%>
        <div class="d-flex justify-content-between tm-pt-45">
          <span class="tm-color-primary">기간 :${content.contentStartDate} ~ ${content.contentEndDate}</span>
        </div>
        <hr>
        <div class="d-flex justify-content-between">
            <%-- 위치 --%>
          <span>${content.contentRegion}</span>
        </div>
      </article>
      </c:forEach>
<%--        <div class="pagination">페이지네이션</div>--%>

<%--      <div class="row tm-row tm-mt-100 tm-mb-75">--%>
  </main>
</div>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>