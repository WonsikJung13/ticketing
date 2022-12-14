<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>

<c:if test="${not empty message }">
    <div class="alert alert-success">
            ${message }
    </div>
</c:if>
<div class="container-md">
    <div class="row">
        <div class="col">

            <h1>회원 정보</h1>

            <div class="mb-3">
                <label for="" class="form-label">
                    이름
                </label>
                <input class="form-control" type="text" value="${customer.customerName}" readonly>
            </div>

            <div class="mb-3">
                <label for="" class="form-label">
                    생년월일
                </label>
                <input class="form-control" type="date" value="${customer.customerBirth}" readonly>
            </div>

            <div class="mb-3">
                <label for="" class="form-label">
                    아이디
                </label>
                <input class="form-control" type="text" value="${customer.customerId}" readonly>
            </div>

            <div class="mb-3">
                <label for="" class="form-label">
                    비밀번호
                </label>
                <input class="form-control" type="password" value="${customer.customerPassword}" readonly>
            </div>

            <div class="mb-3">
                <label for="" class="form-label">
                    이메일
                </label>
                <input class="form-control" type="text" value="${customer.customerEmail}" readonly>
            </div>

            <div class="mb-3">
                <label for="" class="form-label">
                    핸드폰 번호
                </label>
                <input class="form-control" type="text" value="${customer.customerPhoneNumber}" readonly>
            </div>

            <div class="mb-3">
                <label for="" class="form-label">
                    주소
                </label>
                <input class="form-control" type="text" value="${customer.customerAddress}" readonly>
            </div>

            <div class="mb-3">
                <label for="" class="form-label">
                    등급
                </label>
                <input class="form-control" type="text" value="${customer.customerGrade}" readonly>
            </div>

            <div class="mb-3">
                <label for="" class="form-label">
                    가입일시
                </label>
                <input class="form-control" type="datetime-local" value="${customer.customerInserted}" readonly>
            </div>

        </div>
    </div>
</div>

<br>

<c:url value="/customer/modify" var="modifyLink">
    <c:param name="customerId" value="${customer.customerId}"></c:param>
</c:url>
<c:url value="/customer/remove" var="removeLink">
    <%--     <c:param name="id" value="${member.id}"></c:param>--%>
</c:url>

<form id="form2" action="${removeLink }" method="post">
    <input type="hidden" name="customerId" value="${customer.customerId}">
    <input type="hidden" name="oldPassword">
</form>

<div class="d-grid gap-2 d-md-flex justify-content-md-center">
    <a class = "btn btn-warning " href="${modifyLink}">수정하기</a>
    <input class="btn btn-danger" type="submit" value="삭제하기" data-bs-toggle="modal" data-bs-target="#removeModal">
</div>

<br>

<!-- remove Modal -->
<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">기존 암호 입력</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input id="oldPasswordInput2" type="text" class="form-control">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="modalConfirmButton2" type="button" class="btn btn-danger">탈퇴</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>

<script>
    document.querySelector("#modalConfirmButton2").addEventListener("click", function() {
        const form = document.forms.form2;
        const modalInput = document.querySelector("#oldPasswordInput2");
        const formOldPasswordInput = document.querySelector(`#form2 input[name="oldPassword"]`)

        formOldPasswordInput.value = modalInput.value;

        form.submit();
    });
</script>

</body>
</html>
