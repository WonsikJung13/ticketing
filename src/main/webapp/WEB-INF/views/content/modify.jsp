<%--
  Created by IntelliJ IDEA.
  User: sunggyu-lim
  Date: 2022/11/25
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.net.*" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
            crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>상품 수정</title>
    <style>
        .custom-check .form-check-input:checked{
            background-color: #dc3545;
            border-color: #dc3545;
        }
    </style>
</head>
<body>
<my:navBar/>

<h1>${content.contentName} 상품 수정
    <input type="submit" value="수정" data-bs-toggle="modal" data-bs-target="#modifyModal">
</h1>
<form id="modifyForm" action="" method="post" enctype="multipart/form-data">

<%--    <input type="hidden" name="contentPosterName" value="${content.contentPosterName}">--%>
    상품명 <input type="text" name="contentName" value="${content.contentName}" > <br>
    장소 <input type="text" name="contentRegion" value="${content.contentRegion}" > <br>
    시작 <input type="date" name="contentStartDate" value="${content.contentStartDate}" > <br>
    종료 <input type="date" name="contentEndDate" value="${content.contentEndDate}" > <br>
    가격 <input type="number" name="contentPrice" value="${content.contentPrice}" > <br>
    정보 <textarea name="contentBoard" >${content.contentBoard}</textarea>
    <div class="posterBox">
        <label for="" class="form-label">포스터</label>
        <input type="file" accept="image/*" class="form-control" name="addPosterFile" id="addPosterFile">
    </div>
    <div class="DetailBox">
        <label for="" class="form-label">세부내용</label>
        <input multiple type="file" accept="image/*" class="form-control" name="addDetailFiles">
    </div>
    <br>

    <%-- Poster 이미지 출력 --%>
    <div class="row">
        <div class="col-2 d-flex justify-content-center align-items-center">
            <%-- 삭제여부 체크박스 --%>
                <div class="custom-check form-check form-switch text-danger">
                    <input name="removePosterName" value="${content.contentPosterName}" class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked">
                    <label class="form-check-label" for="flexSwitchCheckChecked"><i class="fa-regular fa-trash-can"></i></label>
                </div>
        </div>
        <div class="col-10">
            <img src="${imgUrl}/${content.contentId}/${URLEncoder.encode(content.contentPosterName, 'utf-8')}" alt="">
        </div>
    </div>

    <%-- Detail 이미지 출력 --%>
    <div>
        <c:forEach items="${content.contentDetailName}" var="contentDetailName" varStatus="status">
            <div class="row">
                <div class="col-2 d-flex justify-content-center align-items-center">
                    <%-- 삭제여부 체크박스 --%>
                        <div class="custom-check form-check form-switch text-danger">
                            <input name="removeDetailNames" value="${contentDetailName}" class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked${status.count}">
                            <label class="form-check-label" for="flexSwitchCheckChecked${status.count}"><i class="fa-regular fa-trash-can"></i></label>
                        </div>
                </div>
                <div class="col-10">
                    <img class="img-fluid img-thumbnail" src="${imgUrl}/${content.contentId}/${URLEncoder.encode(contentDetailName, 'utf-8')}" alt="">
                </div>
            </div>
        </c:forEach>
    </div>
</form>

<!-- Modal -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                <button type="button" class="btn btn-primary" id="modifyConfirmButton">확인</button>
            </div>
        </div>
    </div>
</div>

<script>
    document.querySelector("#modifyConfirmButton").addEventListener("click", function() {
        document.querySelector("#modifyForm").submit();
    });

    if (document.querySelector("#addPosterFile").value != "") {
        console.log("input file")
        document.querySelector("#flexSwitchCheckChecked").checked = true;
    }
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>
</body>
</html>
