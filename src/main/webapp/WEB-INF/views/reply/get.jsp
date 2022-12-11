<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/11/28
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
</head>
<my:navBar/>
<body>
<div class="container-md">
    <div class="row">
        <div class="col">

            <h1>${Reply.replyName} 게시물</h1>
            <div class="mb-3">
                <label class="form-label">
                    제목
                </label>
                <input class="form-control" type="text" value="${Reply.replyContent}" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    본문
                </label>
                <textarea class="form-control" readonly>${Reply.replyMainText}</textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    작성자
                </label>
                <input class="form-control" type="text" value="${Reply.replyName}" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    작성일시
                </label>
                <input class="form-control" type="datetime-local" value="${Reply.time}" readonly>
            </div>
        </div>
    </div>
</div>

<br>
<a href="http://pf.kakao.com/_WAlfxj/chat">
    카카오 채팅
</a>
<br>
<a href="http://pf.kakao.com/_WAlfxj">
    카카오 채널추가
</a>

<br>

<c:url value="/reply/modify" var="modifyLink">
    <c:param name="replyName" value="${Reply.replyName}"></c:param>
    <c:param name="replyId" value="${Reply.replyId}"></c:param>
</c:url>

<c:url value="/reply/remove" var="removeLink">
    <c:param name="replyId" value="${Reply.replyId}"></c:param>
</c:url>

<form id="removeForm" action="${removeLink }" method="post">
    <input type="hidden" name="replyName" value="${Reply.replyName }">
</form>

<sec:authentication property="name" var="username"/>
<c:if test="${Reply.replyName == username}">
    <div>
        <a class="btn btn-warning " href="${modifyLink}">수정하기</a>
        <input class="btn btn-warning" type="submit" value="삭제하기" data-bs-toggle="modal" data-bs-target="#removeModal">
    </div>
</c:if>
<%--<a class = "btn btn-warning" href="${removeLink}">삭제하기</a>--%>

<!-- Modal -->
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
        integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/"
        crossorigin="anonymous"></script>

<script>
    // 삭제확인 버튼 클릭하면 삭제 form 전송
    document.querySelector("#removeConfirmButton").addEventListener("click", function () {
        document.querySelector("#removeForm").submit();
    })

    const ctx = "${pageContext.request.contextPath}";

    // Kakao.init('9c69650c14dccf7d58695456e5f600e2'); // 사용하려는 앱의 JavaScript 키 입력
    //
    // function addChannel() {
    //     Kakao.Channel.createAddChannelButton({
    //         container: '#add-channel-button',
    //         channelPublicId: '_WAlfxj',
    //     });
    // }
    // function chatChannel() {
    //     Kakao.Channel.chat({
    //         channelPublicId: '_WAlfxj'
    //     });
    //}
</script>
</body>
</html>
