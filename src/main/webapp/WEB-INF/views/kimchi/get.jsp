<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/12/13
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.net.*" %>
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
<my:sideBar/>
<div class="container-fluid">
    <main class="tm-main">
        <div class="row tm-row">
            <h1>${content.contentName}
                <div class="col-12">
                <hr class="tm-hr-primary tm-mb-55">
                <img src="${imgUrl}/${content.contentId}/${content.contentPosterName}" alt="Image" class="img-fluid">
            </div>
            <aside class="col-lg-4 tm-aside-col">
                <div class="tm-post-sidebar">
                    <hr class="mb-3 tm-hr-primary">
                    <h2 class="tm-mb-40 tm-post-title tm-color-primary">Related Posts</h2>
                    <figcaption class="tm-color-primary">기간</figcaption>
                    <p>${content.contentStartDate} ~ ${content.contentEndDate}</p>
                    <figcaption class="tm-color-primary">가격</figcaption>
                    <p>${content.contentPrice}원</p>
                </div>
                <hr class="mb-3 tm-hr-primary">
            </aside>
        </div>
        <div class="row tm-row">
            <div class="col-lg-8 tm-post-col">
                <div class="tm-post-full">
                    <div class="mb-4">
                        <h2 class="pt-2 tm-color-primary tm-post-title">${content.contentName}</h2>
                        <p class="tm-mb-40">${content.time}</p>
                        <p class="tm-mb-40">작성자</p>
                        <hr class="tm-hr-primary tm-mb-45">
                        <c:forEach items="${content.contentDetailName}" var="contentDetailName"
                                   varStatus="status">
                            <div class="row">
                                <div class="col-2 d-flex justify-content-center align-items-center">
                                <div class="col-10">
                                    <img class="img-fluid img-thumbnail" width=""
                                         src="${imgUrl}/${content.contentId}/${URLEncoder.encode(contentDetailName, 'utf-8')}"
                                         alt="">
                                </div>
                                </div>
                            </div>
                        </c:forEach>
                        <p>
                            ${content.contentBoard}
                        </p>
                    </div>
                    <hr class="tm-hr-primary tm-mb-45">
                    <h2 class="mb-4 tm-post-title tm-color-primary">위치</h2>
                    <p>${content.contentAddress}</p>
                    <p>${content.contentAddrDetail}</p>
                    <c:url value="https://map.kakao.com/link/to/" var="after">
                        <c:param name=""
                                 value="${content.contentAddress},${content.contentMapEntX },${content.contentMapEntY }"/>
                    </c:url>
                    <a href="${after},${content.contentAddress},${content.contentMapEntX },${content.contentMapEntY }">
                        <i class="fa-solid fa-location-arrow" style="font-size: 30px"></i>
                    </a>
                    <div id="map" style="width:400px;height:350px;"></div>
                    <hr class="tm-hr-primary tm-mb-55">
                    <!-- Comments -->
                    <div>
                        <c:url value="/reply/register" var="registerLink">
                            <c:param name="contentId" value="${kimchi.contentId}" />
                        </c:url>
                        <h2 class="tm-color-primary tm-post-title">
                            후기
<%--                            <i href="${registerLink}" onclick="location.href='register'" class="fa-solid fa-plus"></i>--%>
                            <a href="${registerLink}" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">
                                <i class="fa-solid fa-plus"></i>
                            </a>
                        </h2>

                        <hr class="tm-hr-primary tm-mb-45">
                        <c:forEach items="${replyy}" var="reply">
                            <div class="tm-comment tm-mb-45">
                            <input type="hidden" id="replyId" value="${reply.replyId}" >
                                <figure class="tm-comment-figure">
                                    <figcaption class="tm-color-primary text-center">
                            <c:url value="/reply/get" var="getLink">
                                <c:param name="replyId" value="${reply.replyId}" />
                            </c:url>
                                        <a href="${getLink}" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">
                                                ${reply.replyName}
                                        </a>
                                    </figcaption>
                                </figure>
                                <div>
                                    <a href="${getLink}" onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;">
                                            ${reply.replyContent}
                                    </a>
                                    <div class="d-flex justify-content-between">
                                        <span class="tm-color-primary">${reply.time}</span>
                                    </div>
                                </div>
                        </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
        </div>
        <footer class="row tm-row">
            <div class="col-md-6 col-12 tm-color-gray">
                Design: <a rel="nofollow" target="_parent" href="https://templatemo.com" class="tm-external-link">TemplateMo</a>
            </div>
            <div class="col-md-6 col-12 tm-color-gray tm-copyright">
                Copyright 2020 Xtra Blog Company Co. Ltd.
            </div>
        </footer>
    </main>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c69650c14dccf7d58695456e5f600e2"></script>
<script>
    // document.addEventListener("DOMContentLoaded", function () {

    // Handler when the DOM is fully loaded


    var a = "${content.contentMapEntX }";
    var b = "${content.contentMapEntY }";
    console.log(a, b);

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(a, b), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 마커가 표시될 위치입니다
    var markerPosition = new kakao.maps.LatLng(a, b);
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>
