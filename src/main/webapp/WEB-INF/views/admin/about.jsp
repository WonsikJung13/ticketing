<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>About Us</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<body>
<my:sideBar active="about"/>

<div class="row tm-row tm-mb-60 tm-main">
    <h1><strong>A</strong> <strong>R</strong>aboza <strong>T</strong>eam</h1>
    <div class="col-12">
        <hr class="tm-hr-primary tm-mb-55">
    </div>
    <h2 style="font-family: 'LINESeedKR-Bd'">통합 개발 환경</h2>
    <table class="table">
        <thead>
        <tr style="font-family: 'LINESeedKR-Bd'">
            <th>항목</th>
            <th>세부내용</th>
        </tr>
        </thead>
        <tbody>
        <tr class="tm-h3 mb-3">
            <th>Cloud Service Provider</th>
            <th>AWS</th>
        </tr>
        <tr class="tm-h3 mb-3">
            <th>Cloud Native</th>
            <th>EC2 / S3 / RDS</th>
        </tr>
        <tr class="tm-h3 mb-3">
            <th>Database</th>
            <th>MariaDB / MySQL</th>
        </tr>
        <tr class="tm-h3 mb-3">
            <th>Front-end</th>
            <th>HTML / CSS / Javascript / JSP / JSTL / AJAX / JSON / EL</th>
        </tr>
        <tr class="tm-h3 mb-3">
            <th>Back-end</th>
            <th>Java / Spring Boot</th>
        </tr>
        <tr class="tm-h3 mb-3">
            <th>Build Tool</th>
            <th>Gradle</th>
        </tr>
        <tr class="tm-h3 mb-3">
            <th>Library</th>
            <th>Springboot-mail / springboot-security / OAuth2 / springboot-web / lombok / log4j2 / springboot-Devtools
                /
            </th>
        </tr>
        <tr class="tm-h3 mb-3">
            <th>VCS</th>
            <th>git / github</th>
        </tr>
        <tr class="tm-h3 mb-3">
            <th>IDE</th>
            <th>Intellij / Visual Studio Code</th>
        </tr>
        <tr class="tm-h3 mb-3">
            <th>Server</th>
            <th>Apache Tomcat</th>
        </tr>
        <tr class="tm-h3 mb-3">
            <th>O/S</th>
            <th>MS Windows 10 / MAC</th>
        </tr>
        <tr class="tm-h3 mb-3">
            <th>Test Browser</th>
            <th>Explorer / Chrome / Firefox / Safari</th>
        </tr>
        </tbody>
    </table>

    <div class="col-12">
        <hr class="tm-hr-primary tm-mb-55">
    </div>

    <%--    JWS--%>
    <div class="col-lg-6 tm-mb-60 tm-person-col">
        <div class="media tm-person">
            <c:url value="/static/JWS.png" var="jws"/>
            <img src="${jws}" width="200" height="300" class="img-fluid" style="margin-left: 0">
        </div>
        <div class="media-body">
            <h2 style="margin-top: 30px" class="tm-color-primary tm-post-title mb-2">Jung Won Sik</h2>
            <h3 class="tm-h3 mb-3">JWS (Team Leader)</h3>
            <div class="mb-0 tm-line-height-short">
                [admin]
            </div>
            <li>회원 정보 관리</li>
            <li>회원 등급 조정</li>
            <li>비밀번호 초기화</li>
        </div>
    </div>
    <%--    LSG--%>
    <div class="col-lg-6 tm-mb-60 tm-person-col">
        <div class="media tm-person">
            <c:url value="/static/LSG.png" var="lsg"/>
            <img src="${lsg}" width="230" height="330" class="img-fluid">
        </div>
        <div class="media-body">
            <h2 class="tm-color-primary tm-post-title mb-2">Lim Seong Gyu</h2>
            <h3 class="tm-h3 mb-3">LSG</h3>
            <div class="mb-0 tm-line-height-short">
                [content]
            </div>
            <li>게시글 CRUD</li>
            <li>예약하기</li>
        </div>
    </div>
    <%--    LCE--%>
    <div class="col-lg-6 tm-mb-60 tm-person-col">
        <div class="media tm-person">
            <c:url value="/static/LCE.png" var="lce"/>
            <img src="${lce}" width="200" height="300" class="img-fluid mr-4">
        </div>
        <div class="media-body">
            <h2 style="margin-top: 30px" class="tm-color-primary tm-post-title mb-2">Lim Chae Eun</h2>
            <h3 class="tm-h3 mb-3">LCE</h3>
            <div class="mb-0 tm-line-height-short">
                [customer]
            </div>
            <li>회원가입</li>
            <li>로그인 / 로그아웃</li>
            <li>내 정보 / 회원 탈퇴</li>
        </div>
    </div>
    <%--    HHJ--%>
    <div class="col-lg-6 tm-mb-60 tm-person-col">
        <div class="media tm-person">
            <c:url value="/static/HHJ.png" var="hhj"/>
            <img src="${hhj}" width="150" height="240" class="img-fluid mr-3 ml-5">
        </div>
        <div class="media-body ml-4">
            <h2 style="margin-top: 30px" class="tm-color-primary tm-post-title mb-2">Ha Hyeon Jong</h2>
            <h3 class="tm-h3 mb-3">HHJ</h3>
            <div class="mb-0 tm-line-height-short">
                [reply]
            </div>
            <li>후기 CRUD</li>
            <li>카카오 지도 / 길찾기</li>
            <li>카카오 채팅</li>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>