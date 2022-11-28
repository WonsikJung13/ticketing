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
<div class="container-md">
    <div class="row">
        <div class="col">
            <form method="post" id="modifyForm">
                <h1>수정</h1>

                <input type="hidden" name="replyId" value="${Reply.replyId}">
                <input type="hidden" name="contentId" value="${Reply.contentId}">

                <div class="mb-3" id="content">
                    <label class="form-label">
                        제목
                    </label>
                    <input name="replyContent" class="form-control" type="text" value="${Reply.replyContent}">

                </div>

                <div class="mb-3" id="text">
                    <label class="form-label">
                        본문
                    </label>

                    <textarea name="replyMainText" class="form-control">${Reply.replyMainText}</textarea>

                <div class="mb-3" id="name">
                    <label class="form-label">
                        작성자
                    </label>

                    <input class="form-control" name="replyName" type="text" value="${Reply.replyName}" readonly>

                </div>

                <div class="mb-3" id="time">
                    <label class="form-label">
                        작성일시
                    </label>

                    <input class="form-control" name="time" type="datetime-local" value="${Reply.time}" readonly>

                </div>
            </form>

            <button type="submit" class="btn btn-succeess" data-bs-toggle="modal" data-bs-target="#modifyModal">
                <i class="fa-solid fa-pen-to-square"></i>
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
        console.log("hi");
        // const a = document.querySelector("#content").value;
        // const b = document.querySelector("#text").value;
        // const c = document.querySelector("#name").value;
        // const d = document.querySelector("#time").value;
        // console.log(a + " " + b + " " + c + " " + d);
        document.querySelector("#modifyForm").submit();
    });
</script>
</body>
</html>
