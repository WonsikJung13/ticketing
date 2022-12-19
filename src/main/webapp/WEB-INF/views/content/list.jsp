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
  <title>상품 목록</title>
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
          crossorigin="anonymous">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="../fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
  <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
  <!-- https://fonts.google.com/ -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link href="../css/templatemo-xtra-blog.css" rel="stylesheet">
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
      <article class="col-12 col-md-6 tm-post">

        <hr class="tm-hr-primary">

        <div class="tm-post-link-inner" style="">
          <a href="${getLink}" class="effect-lily tm-post-link tm-pt-60" style="height: 500.66px;">
              <%-- 이미지 --%>
            <img src="${imgUrl}/${content.contentId}/${content.contentPosterName}" alt="Image" class="img-fluid" style="">
          </a>
        </div>
              <%-- 제목 --%>
            <h2 class="tm-pt-30 tm-color-primary tm-post-title">"${content.contentName}"</h2>
          <%--                    &lt;%&ndash; 내용 &ndash;%&gt;--%>
          <%--                <p class="tm-pt-30">--%>
          <%--                        ${content.contentBoard}--%>
          <%--                </p>--%>

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
      <div class="row tm-row tm-mt-100 tm-mb-75">
        <div class="tm-prev-next-wrapper">
          <a href="#" class="mb-2 tm-btn tm-btn-primary tm-prev-next disabled tm-mr-20">Prev</a>
          <a href="#" class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
        </div>
        <div class="tm-paging-wrapper">
          <span class="d-inline-block mr-3">Page</span>
          <nav class="tm-paging-nav d-inline-block">
            <ul>
              <li class="tm-paging-item active">
                <a href="#" class="mb-2 tm-btn tm-paging-link">1</a>
              </li>
              <li class="tm-paging-item">
                <a href="#" class="mb-2 tm-btn tm-paging-link">2</a>
              </li>
              <li class="tm-paging-item">
                <a href="#" class="mb-2 tm-btn tm-paging-link">3</a>
              </li>
              <li class="tm-paging-item">
                <a href="#" class="mb-2 tm-btn tm-paging-link">4</a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
      <footer class="row tm-row">
        <hr class="col-12">
        <div class="col-md-6 col-12 tm-color-gray">
          Design: <a rel="nofollow" target="_parent" href="https://templatemo.com" class="tm-external-link">TemplateMo</a>
        </div>
        <div class="col-md-6 col-12 tm-color-gray tm-copyright">
          Copyright 2020 Xtra Blog Company Co. Ltd.
        </div>
      </footer>
  </main>
</div>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script src="src/main/resources/static/js/jquery.min.js"></script>
<script src="src/main/resources/static/js/templatemo-script.js"></script>
</body>
</html>