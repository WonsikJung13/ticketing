<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>

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
</head>
<body>
<my:navBar/>

    상품명 <input type="text" value="${content.contentName}" readonly> <br>
    <%-- 이미지 출력 --%>
    <div>
        <img src="/images/${content.contentId}/${content.uuid}" alt="">
    </div>
    장소 <input type="text" value="${content.contentRegion}" readonly> <br>
    시작 <input type="date" value="${content.contentStartDate}" readonly> <br>
    종료 <input type="date" value="${content.contentEndDate}" readonly> <br>
    가격 <input type="number" value="${content.contentPrice}" readonly> <br>
    정보 <textarea name="contentBoard" readonly>${content.contentBoard}</textarea>
    <div>
        <img src="/images/${content.contentId}/${content.uuid2}" alt="">
    </div>
    <br>

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



    <!-- 삭제버튼 누르면 -->
    <script>
        document.querySelector("#removeConfirmButton").addEventListener("click", function() {
            document.querySelector("#removeForm").submit();
        });

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>

<script>

</script>

</body>
</html>
