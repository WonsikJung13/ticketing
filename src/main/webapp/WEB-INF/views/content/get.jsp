<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.net.*" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상품 리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>


    <style>
        div {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            font-size: 100%;
            vertical-align: baseline;
            background: transparent;
            display: block;
        }

        .nav {
            display: block;
            position: sticky;
            top: 0;
            background: #ffffff;
        }

        .navSticky {
            width: 83rem;
            z-index: 5;
            /*position: -webkit-sticky;*/
            background: #ffffff;
        }

        .navList {
            border-bottom: 0.1rem solid #b6bdc7;
        }

        .navItem {
            position: relative;
            display: inline-block;
            font-size: 1.3rem;
            font-weight: bold;
            margin-left: 1.5rem;
        }

        .navItem.is-active:before {
            display: block;
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 5px;
            background-color: #333;
        }

        .navLink {
            display: block;
            padding: 0.7rem;
            color: inherit;
            text-decoration: none;
            /*line-height: 2.5rem;*/
        }

        button {
            background: none;
        }

        .blind {
            position: absolute;
            overflow: hidden;
            clip: rect(0 0 0 0);
            margin: -0.1rem;
            width: 0.1rem;
            height: 0.1rem;
        }

        .popCenter {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            text-align: center;
        }

        .popup {
            z-index: 300;
        }

        .popup.popInfoPlace > .popupWrap {
            /*width: 71rem;*/
            max-height: 90vh;
            overflow-y: auto;
        }

        .popCenter .popupWrap {
            position: relative;
            display: inline-block;
            vertical-align: middle;
            min-height: 150px;
            background: #fff;
            z-index: 10;
        }

        .popup .popupWrap {
            position: relative;
            display: inline-block;
            font-size: 1.4rem;
            background-color: #fff;
            border: 0.1rem solid #ccc;
            border-radius: 1rem;
            box-shadow: 0 0.5rem 1rem rgb(0 0 0 / 20%);
            box-sizing: border-box;
        }

        .popCenter .popupHead {
            overflow: hidden;
            height: 5rem;
            padding: 0 2rem;
            line-height: 5rem;
            text-align: left;
            border-bottom: 0.1rem solid #dde4ec;
            border-top-left-radius: 1rem;
            border-top-right-radius: 1rem;
        }

        .popCenter .popupTitle {
            font-size: 1.6rem;
            font-weight: bold;
            color: #000;
        }

        .popup .popupCloseBtn {
            background-image: url(//openimage.interpark.com/ticket-desktop/pages/product/icon_close.png);
            background-repeat: no-repeat;
            position: absolute;
            top: 0.3rem;
            right: 0.6rem;
            width: 4.4rem;
            height: 4.4rem;
            background-size: 1.8rem 1.8rem;
            background-color: transparent;
            background-repeat: no-repeat;
            background-position: 50% 50%;
            border: 0;
            cursor: pointer;
        }

        button {
            padding: 0;
            margin: 0;
            border: 0;
            background: none;
            font-family: -apple-system, system-ui, BlinkMacSystemFont, '맑은 고딕', 'Malgun Gothic', '돋움', Dotum, Helvetica, 'Apple SD Gothic Neo', sans-serif;
            box-sizing: border-box;
            cursor: pointer;
            outline-offset: -1px;
        }

        .popupBody {
            text-align: left;
            overflow: hidden;
        }

        .popInfoPlace {
            text-align: left;
            padding: 1.6rem 2.5rem 2.5rem;
        }

        .popPlaceWrap {
            text-align: left;
            padding: 1.6rem 2.5rem 2.5rem;
        }

        .popInfoPlace .popPlaceTitle {
            display: inline-block;
            margin-bottom: 0.8rem;
            max-width: 55rem;
            margin-right: 0.2rem;
            font-size: 1.6rem;
            font-weight: bold;
            color: #000;
        }

        .popup.popInfoPlace .popPlaceInfo {
            color: #666;
            font-size: 1.4rem;
            max-width: 66rem;
        }

        .popup.popInfoPlace .popPlaceInfo p {
            display: -webkit-box;
            overflow: hidden;
            text-overflow: ellipsis;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            line-height: 160%;
        }

        .popup.popInfoPlace .placeMap {
            overflow: hidden;
            margin-top: 2.3rem;
            width: 66rem;
            height: 44rem;
            border: 0.1rem solid #ccc;
        }

        #map {
            position: relative;
            overflow: hidden;
            background: url(https://ssl.pstatic.net/static/maps/mantle/1x/pattern_1.png) 0px 0px repeat transparent;
            width: 660px;
            height: 440px;
        }
    </style>
    <style>
        *{margin: 0;padding:0px}

        .showLeft{
            text-shadow: none !important;
            color:#000000 !important;
            padding:10px;
        }

        .icons li {
            background: none repeat scroll 0 0 #999999;
            height: 4px;
            width: 4px;
            line-height: 0;
            list-style: none outside none;
            margin-right: 15px;
            margin-top: 3px;
            vertical-align: top;
            border-radius:50%;
            pointer-events: none;
        }

        .btn-left {
            left: 0.4em;
        }

        .btn-right {
        }

        .btn-left, .btn-right {
            position: absolute;
            top: 0.24em;
        }

        .dropbtn {
            background-color: transparent;
            font-size: 1px;
            border: none;
            cursor: pointer;
            width: 4px;
        }

        .TreeDotDropdown {

            position: relative;
            /*display: inline-block;*/
            left: 680px;

        }

        .dropdown-content {
            display: none;
            position: absolute;
            margin-left: -130px;

            margin-top: 40px;

            background-color: #ffffff;
            border: 1px solid #d5d5d5;
            border-radius: 3px;
            min-width: 160px;
            overflow: auto;
            box-shadow: rgba(0,0,0,.1) 0 1px 1px 0;
            text-align: left;
            z-index: 1;
        }

        .dropdown-content a {
            color: #888;
            font-size:17px;
            padding: 7px 16px;
            line-height:30px;
            border-top: 1px solid #f2f2f2;
            text-decoration: none;
            display: block;
        }

        .show {display:block;}

        .removePost {
            color: #ff4646 !important;
        }
    </style>

    <style>

        /*예매하기 버튼*/
        .btn-danger {
            color: #ffffff !important;
            background-color: #79dfdf !important;
            border-color: #79dfdf !important;
            border-radius:0px !important;
        }
        .btn-danger:hover {
            background-color:#5aa3a3 !important;
            border-color: #5aa3a3 !important;
        }
        /*삭제하기 모달 */
        .modal-content {
            border-radius: 0px !important;
        }
        .btn-secondary {
            border-radius: 0px !important;
        }

    </style>
</head>
<body>
<my:sideBar/>

<div>
    <my:sideBar/>
    <div class="container-fluid">
        <main class="tm-main" style="width:720px;">
            <h1 class="pt-2 tm-color-primary tm-post-title" style="margin-bottom:0px;width:720px;">${content.contentName}</h1>

            <!-- three dot menu -->

            <sec:authentication property="name" var="username"/>
            <c:if test="${username == 'admin'}">
                <div class="TreeDotDropdown">
                    <!-- three dots -->
                    <ul class="dropbtn icons btn-right showLeft" onclick="showDropdown()">
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                    <!-- menu dropDown -->
                    <div id="myDropdown" class="dropdown-content">
                            <%--    수정버튼--%>
                        <c:url value="/content/modify" var="modifyLink">
                            <c:param name="contentId" value="${content.contentId}"></c:param>
                        </c:url>
                        <a class="modifyPost" href="${modifyLink}">
                            수정하기
                            <i class="fa-regular fa-pen-to-square" style="margin-left:38px;"></i>
                        </a>
                            <%--    삭제버튼--%>
                        <c:url value="/content/remove" var="removeLink"></c:url>
                        <form id="removeForm" action="${removeLink }" method="post">
                            <input type="hidden" name="contentId" value="${content.contentId }">
                        </form>
                        <a class="removePost" href="${removeLink }" data-bs-toggle="modal" data-bs-target="#removeModal">
                            삭제하기
                            <i class="fa-regular fa-trash-can" style="margin-left:38px;"></i><ion-icon name="trash"></ion-icon>
                        </a>
                    </div>
                </div>
            </c:if>

                <span class="tm-mb-40">${content.time}</span>
            <!-- 포스터 및 기본 정보 -->
            <hr class="tm-hr-primary tm-mb-45" style="width:720px;">
            <div class="row" style="display: block;width:720px;">
                <div class="col-12" style="display:inline-block;width:20rem;">
                    <img src="${imgUrl}/${content.contentId}/${content.contentPosterName}" alt="Image"
                         class="img-fluid">
                </div>
                <aside class="col-lg-4 tm-aside-col"
                       style="display: inline-block;vertical-align: top;width:20rem;margin-top: 0.4rem;margin-left: 2.5rem;">
                    <div class="tm-post-sidebar">
                        <%-- <h2 class="tm-mb-40 tm-post-title tm-color-primary">Related Posts</h2>--%>
                        <figcaption class="tm-color-primary">장소</figcaption>
                        <p><a href="#popup-info-place" role="button" type="text" value="" class="mapPopup"
                              readonly style="color: #999;">${content.contentRegion}</a></p>
                        <figcaption class="tm-color-primary">기간</figcaption>
                        <p>${content.contentStartDate} ~ ${content.contentEndDate}</p>
                            <figcaption class="tm-color-primary">시간</figcaption>
                        <p>${content.startTime}:00 ~ ${content.endTime}:00</p>
                            <figcaption class="tm-color-primary">가격</figcaption>
                        <p>${content.contentPrice}원</p>
                            <sec:authorize access="isAuthenticated()">
                                <c:url value="/content/reservation" var="reservLink">
                                    <c:param name="contentId" value="${content.contentId}"></c:param>
                                </c:url>
                                <button type="submit" class="btn btn-danger" value="" onclick="location.href='${reservLink}'">예매하기
                                </button>
                            </sec:authorize>
                            </p>
                    </div>
                </aside>
            </div>

            <input type="hidden" readonly value="${content.contentMapEntX }" id="entX">
            <input type="hidden" readonly value="${content.contentMapEntY }" id="entY">
            <input type="hidden" readonly value="${content.contentAddress}" id='address'>

<%--            <!-- 네브바 -->--%>
<%--            <nav class="nav">--%>
<%--                <div class="navSticky">--%>
<%--                    <div class="stickyWrap">--%>
<%--                        <ul class="navList">--%>
<%--                            <li class="navItem  is-active"><a class="navLink" href="#" data-target="INFO">이용정보</a></li>--%>
<%--                            <li class="navItem "><a class="navLink" href="#" data-target="ADDITIONAL">판매정보</a></li>--%>
<%--                            <li class="navItem "><a class="navLink" href="#" data-target="REVIEW">이용후기</a></li>--%>
<%--                            <li class="navItem "><a class="navLink" href="#" data-target="EXPECT">기대평</a></li>--%>
<%--                            <li class="navItem "><a class="navLink" href="#" data-target="QNA">Q&amp;A</a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </nav>--%>

            <!-- 본문 및 디테일 이미지 -->
            <hr class="tm-hr-primary tm-mb-45" style="width:720px;margin-top:45px;">

            <div class="row tm-row">
                <div class="col-lg-8 tm-post-col">
                    <div class="tm-post-full">
                        <div class="mb-4">
                            <p style="width:45rem;">
                                ${content.contentBoard}
                            </p>
                            <c:forEach items="${content.contentDetailName}" var="contentDetailName"
                                       varStatus="status">
                                <div class="row">
                                        <div class="col-10">
                                            <img class="img-fluid img-thumbnail" width="720px !important;"
                                                 src="${imgUrl}/${content.contentId}/${URLEncoder.encode(contentDetailName, 'utf-8')}"
                                                 alt="">
                                        </div>
                                </div>
                            </c:forEach>
                        </div>
<%--                        <hr class="tm-hr-primary tm-mb-45">--%>
<%--                        <h2 class="mb-4 tm-post-title tm-color-primary">위치</h2>--%>
<%--                        <p>${content.contentAddress}</p>--%>
<%--                        <p>${content.contentAddrDetail}</p>--%>
<%--                        <c:url value="https://map.kakao.com/link/to/" var="after">--%>
<%--                            <c:param name=""--%>
<%--                                     value="${content.contentAddress},${content.contentMapEntX },${content.contentMapEntY }"/>--%>
<%--                        </c:url>--%>
<%--                        <a href="${after},${content.contentAddress},${content.contentMapEntX },${content.contentMapEntY }">--%>
<%--                            <i class="fa-solid fa-location-arrow" style="font-size: 30px"></i>--%>
<%--                        </a>--%>
<%--                        <div id="map" style="width:400px;height:350px;"></div>--%>
<%--                        <hr class="tm-hr-primary tm-mb-55">--%>
                        <!-- Comments -->
                        <div>
                            <h2 class="tm-color-primary tm-post-title">후기</h2>

                            <hr class="tm-hr-primary tm-mb-45" style="width:720px;">

                            <c:forEach items="${replyy}" var="reply">
                                <div class="tm-comment tm-mb-45">
                                    <figure class="tm-comment-figure">
                                        <figcaption class="tm-color-primary text-center">${reply.replyName}</figcaption>
                                    </figure>
                                    <div>
                                        <p>
                                                ${reply.replyContent}
                                        </p>
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

<!-- remove Modal -->
<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                삭제하시겠습니까? 삭제된 게시글은 복구할 수 없습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button id="removeConfirmButton" type="button" class="btn btn-danger">확인</button>
            </div>
        </div>
    </div>
</div>
</div>


    <%--    지도 팝업 창--%>
    <div id="popup-info-place" class="popup popCenter popInfoPlace is-visible" style="display:none;">
        <div class="popupWrap">
            <div class="popupHead">
                <Strong class="popupTitle">전시장 정보</Strong>
                <button class="popupCloseBtn">
                    <span class="blind">닫기</span>
                </button>
            </div>
            <div class="popupBody">
                <div class="popPlaceWrap">
                    <div class="popPlaceTitle">
                        ${content.contentRegion}
                    </div>
                    <div class="popPlaceInfo">
                        <p>
                            <span>
                                ${content.contentAddress}
                            </span>
                            <c:url value="https://map.kakao.com/link/to/" var="after">
                                <c:param name=""
                                         value="${content.contentAddress},${content.contentMapEntX },${content.contentMapEntY }"/>
                            </c:url>
                            <a href="${after},${content.contentAddress},${content.contentMapEntX },${content.contentMapEntY }" style="position:absolute;right:2.3rem;">
                                길찾기
                            </a>
                        </p>
                    </div>
                    <div id="map" class="placeMap" style="position: relative;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<!-- 삭제버튼 누르면 -->
<script>
    document.querySelector("#removeConfirmButton").addEventListener("click", function () {
        document.querySelector("#removeForm").submit();
    });
</script>


<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c69650c14dccf7d58695456e5f600e2"></script>
<script>
    // document.addEventListener("DOMContentLoaded", function () {

    // Handler when the DOM is fully loaded

    var a = parseFloat(document.querySelector('#entX').value);
    var b = parseFloat(document.querySelector('#entY').value);

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

    // 지도 display 변경
    const maptarget = document.querySelector('.mapPopup');
    maptarget.addEventListener('click', function () {
        targetId = this.getAttribute('href');
        document.querySelector(targetId).style.display = 'block';
        window.setTimeout(function () {
            map.relayout();
            map.setCenter(markerPosition);
        }, 0);
        console.log(markerPosition)
    });

    const btnPopClose = document.querySelector('.popupCloseBtn');
    btnPopClose.addEventListener('click', function () {
        this.parentNode.parentNode.parentNode.style.display = 'none';
    });

</script>

<script>
    function changeLanguage(language) {
        var element = document.getElementById("url");
        element.value = language;
        element.innerHTML = language;
    }

    function showDropdown() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    // Close the dropdown if the user clicks outside of it
    window.onclick = function(event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>

</body>
</html>
