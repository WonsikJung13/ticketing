<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/templatemo-xtra-blog.css" rel="stylesheet">
    <style>
        body {
            background-image: url("/back.jpg");
        }

        /*글씨체*/
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        .btn-ico {
            color: #ffffff !important;
            background-color: #79dfdf !important;
            border-color: #79dfdf !important;
            border-radius: 0.375rem !important;
        }

        .btn-ico:hover {
            background-color: #5aa3a3 !important;
            border-color: #5aa3a3 !important;
        }
    </style>
</head>
<body class="align-middle">
<div class="container-fluid flex-column justify-content-center" style="height: 80vh; width: 320px; margin-top: 200px">
    <div style="font-family: LINESeedKR-Bd; font-size: medium">
        <c:if test="${not empty exception }">
            <div class="alert alert-danger">
                <i class="fa-solid fa-triangle-exclamation"></i>
                    ${exception }
            </div>
        </c:if>
    </div>
    <div class="card align-self-center">
        <div style="color: #0CC; font-family: 'LINESeedKR-Bd'" class="card-header">
            LOGIN
        </div>
        <div class="card-body">
            <%--            <c:if test="${param.logout != null}">--%>
            <%--                <div class="alert alert-danger">--%>
            <%--                    <i class="fa-solid fa-triangle-exclamation"></i>--%>
            <%--                        로그아웃 되었습니다--%>
            <%--                </div>--%>
            <%--            </c:if>--%>
            <form id="registerForm" action="/member/login" method="post">
                <div class="input-group mb-3">
                    <span style="border-color: #0cc" class="input-group-text">
                        <i class="fa-solid fa-user"></i>
                    </span>
                    <input type="text" name="username" class="form-control" placeholder="USER ID">
                </div>
                <div class="input-group mb-3">
                    <span style="border-color: #0cc" class="input-group-text">
                        <i class="fa-solid fa-key"></i>
                    </span>
                    <input type="password" name="password" class="form-control" placeholder="PASSWORD">
                </div>
                <div style="margin-left: 20px" class="input-group mb-3">
                    <input class="form-check-input" type="checkbox" name="remember-me"
                           style="border-bottom-right-radius: 0.25em; border-top-right-radius: 0.25em">
                    <label style="font-family: 'LINESeedKR-Bd'; margin-left: 5px;" class="form-check-label">
                        자동 로그인
                    </label>
                </div>
                <div>
                    <a href="/oauth2/authorization/kakao" style="text-decoration: none; margin-left: 22px;">
                        <c:url value="/kakaoLogo.png" var="kakaoLogoLink"/>
                        <img src="${kakaoLogoLink}" alt="">
                    </a>

                    <a href="/oauth2/authorization/google" style="text-decoration: none; margin-left: 22px;">
                        <c:url value="/googleLogo.png" var="googleLogoLink"/>
                        <img src="${googleLogoLink}" alt="">
                    </a>

                    <a href="/oauth2/authorization/naver">
                        <c:url value="/naverLogo.png" var="naverLogoLink"/>
                        <img src="${naverLogoLink}" alt="" style="height: 48px; margin-left: 22px;">
                    </a>
                </div>
                <div class="my-4">
                    <div style="font-family: 'LINESeedKR-Bd'; text-align: center" class="float-first">
                        회원이 아니신가요? <a href="/customer/signup">회원가입</a>
                    </div>
                    <br>
                    <div class="float-end">
                        <button style="background-color: #0CC; color: white; font-family: 'LINESeedKR-Bd'" type="submit"
                                class="btn submitBtn btn-ico">LOGIN
                        </button>
                    </div>
                </div>
            </form>
        </div><!--end card body-->
    </div><!--end card-->
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>