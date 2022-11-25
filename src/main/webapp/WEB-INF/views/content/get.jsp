<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <titl>상품 리스트</titl>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
    상품명 <input type="text" value="${content.contentName}" readonly> <br>
    장소 <input type="text" value="${content.contentRegion}" readonly> <br>
    시작 <input type="date" value="${content.contentStartDate}" readonly> <br>
    종료 <input type="date" value="${content.contentEndDate}" readonly> <br>
    가격 <input type="number" value="${content.contentPrice}" readonly> <br>
    정보 <textarea name="contentBoard" readonly></textarea>

    <br>

<%--    수정버튼--%>
    <c:url value="/content/modify" var="modifyLink">
        <c:param name="contentId" value="${content.contentId}"></c:param>
    </c:url>
    <a class="btn btn-warning" href="${modifyLink}">수정</a>

<%--    삭제버튼--%>
    <c:url value="/content/remove" var="removeLink"></c:url>
    <form action="${removeLink }" method="post">
    <input type="hidden" name="id" value="${content.contentId}">
        <input type="submit" value="삭제">
    </form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>

</body>
</html>
