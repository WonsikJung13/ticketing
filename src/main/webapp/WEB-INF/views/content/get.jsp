<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.net.*" %>

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
        /*div {*/
        /*    margin: 0;*/
        /*    padding: 0;*/
        /*    border: 0;*/
        /*    outline: 0;*/
        /*    font-size: 100%;*/
        /*    vertical-align: baseline;*/
        /*    background: transparent;*/
        /*    display: block;*/
        /*}*/

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

    </style>
</head>
<body>
<my:navBar/>
<div>
    <h1>${content.contentName}

        <%--    수정버튼--%>
        <c:url value="/content/modify" var="modifyLink">
            <c:param name="contentId" value="${content.contentId}"></c:param>
        </c:url>
        <a class="btn btn-warning" href="${modifyLink}">수정</a>
        <input type="submit" value="삭제" data-bs-toggle="modal" data-bs-target="#removeModal" class="btn btn-danger">

        <%--    삭제버튼--%>
        <c:url value="/content/remove" var="removeLink"></c:url>
        <form id="removeForm" action="${removeLink }" method="post">
            <input type="hidden" name="contentId" value="${content.contentId }">
        </form>
    </h1>



    <%-- 이미지 출력 --%>
    <div class="row">
    <div class="cal">
        <img src="/images/${content.contentId}/${content.contentPosterName}" alt="">
        <%--    상품명 <input type="text" value="${content.contentName}" readonly> <br>--%>
        <p>장소 <input type="text" value="${content.contentRegion}" readonly></p>
        기간 <input type="date" value="${content.contentStartDate}" readonly>
        ~ <input type="date" value="${content.contentEndDate}" readonly> <br>
        가격 <input type="number" value="${content.contentPrice}" readonly> <br>

        <c:url value="/content/reservation" var="reservLink">
            <c:param name="contentId" value="${content.contentId}"></c:param>
        </c:url>
<%--        <a href="${getLink}">--%>
<%--            ${content.contentName}--%>
<%--        </a>--%>
        <button type="submit" class="btn btn-danger" value="" onclick="location.href='${reservLink}'">예약</button>
    </div>
        <nav class="nav">
            <div class="navSticky">
                <div class="stickyWrap">
                    <ul class="navList">
                        <li class="navItem  is-active"><a class="navLink" href="#" data-target="INFO">이용정보</a></li>
                        <li class="navItem "><a class="navLink" href="#" data-target="ADDITIONAL">판매정보</a></li>
                        <li class="navItem "><a class="navLink" href="#" data-target="REVIEW">이용후기</a></li>
                        <li class="navItem "><a class="navLink" href="#" data-target="EXPECT">기대평</a></li>
                        <li class="navItem "><a class="navLink" href="#" data-target="QNA">Q&amp;A</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div>
            이용정보 <br>
            <textarea name="contentBoard" readonly>${content.contentBoard}</textarea>
            <br>
            <%-- 이미지 출력2 --%>
            <div>
                <c:forEach items="${content.contentDetailName}" var="name">
                    <div>
                        <img class="img-fluid img-thumbnail" src="/images/${content.contentId}/${name}" alt="">
                    </div>
                </c:forEach>
            </div>
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
                        삭제하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button id="removeConfirmButton" type="button" class="btn btn-danger">확인</button>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous">
    </script>


</body>
</html>
