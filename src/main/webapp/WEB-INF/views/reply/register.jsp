<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/11/28
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<h1>게시물 작성</h1>
<form action="" method="post" enctype="multipart/form-data">
    <div class="mb-3">
        <label class="form-label">
            작성자
        </label>
        <input
                value="<sec:authentication property="name"/>"
                class="form-control" type="text" name="replyName" readonly>
    </div>

    <div class="mb-3">
        <label class="form-label">
            제목
        </label>
        <input class="form-control" type="text" name="replyContent">
    </div>

    <div class="mb-3">
        <label class="form-label">
            본문
        </label>
        <textarea class="form-control" name="replyMainText"></textarea>
    </div>

    <input class="btn btn-primary" type="submit" value="등록">
</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>
