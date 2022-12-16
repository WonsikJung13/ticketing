<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/11/28
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        textarea {
            width: 100% !important;
            height: 20em !important;
            resize: none !important;
        }

        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        .form-control {
            height: 45px;
            border-color: #0CC;
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
<body>
<div class="container-md">
    <div class="row">
        <div class="col" style="border: 30px solid #c6f1f1; padding: 90px">
            <h3>수정</h3>
            <form method="post" id="modifyForm" style="margin-top: 30px">

                <input type="hidden" name="replyId" value="${Reply.replyId}">

                <div class="mb-3" id="content">
                    <label style="font-family: 'LINESeedKR-Bd'" class="form-label">
                        제목
                    </label>
                    <input name="replyContent" class="form-control" type="text" value="${Reply.replyContent}">

                </div>

                <div class="mb-3" id="text">
                    <label style="font-family: 'LINESeedKR-Bd'" class="form-label">
                        본문
                    </label>

                    <textarea name="replyMainText" class="form-control">${Reply.replyMainText}</textarea>
                </div>
                <div class="mb-3" id="name">
                    <label style="font-family: 'LINESeedKR-Bd'" class="form-label">
                        작성자
                    </label>

                    <input class="form-control" type="text" value="${Reply.replyName}" style="background-color: #d4d4d4"
                           readonly>

                </div>

                <div class="mb-3" id="time">
                    <label style="font-family: 'LINESeedKR-Bd'" class="form-label">
                        작성일시
                    </label>

                    <input class="form-control time" name="time" type="datetime-local" value="${Reply.time}"
                           style="background-color: #d4d4d4;" readonly>

                </div>
            </form>

            <button type="submit" class="btn btn-ico" data-bs-toggle="modal" data-bs-target="#modifyModal">
                수정하기
            </button>

            <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">수정 확인</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            수정하시겠습니까?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button id="modifyConfirmButton" type="button" class="btn btn-primary">확인</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script>
    document.querySelector("#modifyConfirmButton").addEventListener("click", function () {
        document.querySelector("#modifyForm").submit();
    });
</script>
</body>
</html>
