<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/12/01
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.8.0/proj4.js"
            integrity="sha512-ha3Is9IgbEyIInSb+4S6IlEwpimz00N5J/dVLQFKhePkZ/HywIbxLeEu5w+hRjVBpbujTogNyT311tluwemy9w=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>

<table class="table">
    <tr>
        <td>번호</td>
        <td>주소</td>
        <td>X</td>
        <td>Y</td>
    </tr>
    <c:forEach items="${mapList}" var="Reply">
        <tr>
            <td>
                <c:url value="/reply/get" var="getLink">
                    <c:param name="id" value="${Reply.replyMapId}"/>

                </c:url>
                <a href="${getLink}">
                        ${Reply.replyMapId}
                </a>
            </td>
            <td>
                <c:url value="/reply/get" var="getLink">
                    <c:param name="id" value="${Reply.replyMapId}"/>

                </c:url>
                <a href="${getLink}">
                        ${Reply.replyMapAddress}
                </a>
            </td>
                <%--            <td>${Reply.replyMapEntX }</td>--%>
            <input type="text" readonly value="${Reply.replyMapEntX }" id="entX">
                <%--            <td>${Reply.replyMapEntY }</td>--%>
            <input type="text" readonly value="${Reply.replyMapEntY }" id="entY">
        </tr>
        <c:url value="https://map.kakao.com/link/to/" var="after">
            <c:param name="" value="${Reply.replyMapAddress},${Reply.replyMapEntX },${Reply.replyMapEntY }"/>
        </c:url>
        <a href="${after},${Reply.replyMapAddress},${Reply.replyMapEntY },${Reply.replyMapEntX }">
            길찾기
        </a>

    </c:forEach>
</table>


<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9c69650c14dccf7d58695456e5f600e2"></script>
<script>
    // document.addEventListener("DOMContentLoaded", function () {

    // Handler when the DOM is fully loaded


    <%--console.log('${Reply.replyMapEntX }', '${Reply.replyMapEntY }')--%>
    var b = parseFloat(document.querySelector('#entX').value);
    var a = parseFloat(document.querySelector('#entY').value);

    // debugger;

    // var c = parseFloat('34.450701');
    // var d = parseFloat('126.570667');

    // const grs80UtmK = '+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs ';
    // const wgs84 = '+title=WGS 84 (long/lat) +proj=longlat +ellps=WGS84 +datum=WGS84 +units=degrees';
    // const result = proj4(grs80UtmK, wgs84, [parseFloat(a.toFixed(6)), parseFloat(b.toFixed(6))]);

    // console.log(a, b);
    // console.log(c, d);


    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            // center: new kakao.maps.LatLng(parseFloat(a.toFixed(6)), parseFloat(b.toFixed(6))), // 지도의 중심좌표
            // center: new kakao.maps.LatLng(parseFloat(document.querySelector('#entX').value), parseFloat(document.querySelector('#entY').value)), // 지도의 중심좌표
            center: new kakao.maps.LatLng(a, b), // 지도의 중심좌표
            // center: new kakao.maps.LatLng(c, d), // 지도의 중심좌표
            // center: new kakao.maps.LatLng(126.745350, 37.566224), // 지도의 중심좌표
            // center: new kakao.maps.LatLng(document.querySelector('#entX').value, parseFloat(document.querySelector('#entY').value)), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    // var map = new kakao.maps.Map(mapContainer,{
    //     center: new kakao.maps.LatLng(a, b),level: 3}
    // );
    // 지도를 생성합니다

    // 마커가 표시될 위치입니다
    // var markerPosition  = new kakao.maps.LatLng(parseFloat(a.toFixed(6)), parseFloat(b.toFixed(6)));
    var markerPosition = new kakao.maps.LatLng(a, b);
    // var markerPosition  = new kakao.maps.LatLng(parseFloat(document.querySelector('#entX').value), parseFloat(document.querySelector('#entY').value));
    // var markerPosition  = new kakao.maps.LatLng(126.745350, 37.566224);
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);

    // });
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>
