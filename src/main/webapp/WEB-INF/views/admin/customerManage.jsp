<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/templatemo-xtra-blog.css" rel="stylesheet">

    <style>
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
<body>
<my:sideBar active="customerManage"/>

<div class="tm-main">
    <div class="container-md" style="width: 900px">
        <div class="row mt-5">
            <div class="col" style="border: 30px solid #c6f1f1; padding: 90px">
                <c:if test="${not empty message }">
                <div style="font-family: 'LINESeedKR-Bd'" class="alert alert-success">
                        ${message }
                </div>
                </c:if>

                <h1 style="font-family: 'LINESeedKR-Bd'">회원 정보 관리</h1>
                <form id="customerSearch" method="get">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <input type="text" name="customerId">
                        <button style="border-color: #0cc" id="searchButton" class="btn" type="button">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </div>
                </form>


                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        이름
                    </label>
                    <input class="form-control" type="text" value="${customer.customerName}" readonly>
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        생년월일
                    </label>
                    <input class="form-control" type="date" value="${customer.customerBirth}" readonly>
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        아이디
                    </label>
                    <input class="form-control" type="text" value="${customer.customerId}" readonly>
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        비밀번호
                    </label>
                    <input class="form-control" type="password" value="****" readonly>
                    <button style="font-family: 'LINESeedKR-Bd'; margin-top: 20px" id="resetPasswordButton" type="button" class="btn btn-ico">
                        비밀번호 초기화
                    </button>
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        이메일
                    </label>
                    <input class="form-control" type="text" value="${customer.customerEmail}" readonly>
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        핸드폰 번호
                    </label>
                    <input class="form-control" type="text" value="${customer.customerPhoneNumber}" readonly>
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        주소
                    </label>
                    <input class="form-control" type="text" value="${customer.customerAddress}" readonly>
                </div>
                <form action="updateGrade" method="post" id="customerGradeSelect" name="customerGradeSelect">
                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        등급
                    </label>
                    <input class="form-control" type="text" value="${customer.customerGrade}" readonly>
                    <div class="input-group" style="margin-top: 20px">
                        <select id="customerGrade" name="customerGrade" style="width:40%">
                            <c:forEach items="${gradeList}" var="grade">
                                <option value="${grade.customerGrade}"><c:out value="${grade.customerGrade}"/></option>
                            </c:forEach>
                        </select>
                        <input type="hidden" id="customerId" name="customerId" value="${customer.customerId}">
                        <button style="background-color: #79dfdf;color: #ffffff; border-color:#00CCCC" id="gradeUpdate" type="button" class="btn btn-outline-secondary">반영</button>
                    </div>
                    <div id="gradeUpdateResult" class="form-text"></div>
                </div>
                </form>
                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        가입일시
                    </label>
                    <input class="form-control" type="datetime-local" value="${customer.customerInserted}" readonly>
                </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>

<script>

    const ctx = "${pageContext.request.contextPath}";
    document.querySelector("#gradeUpdate").addEventListener("click", function () {
        const customerId = document.querySelector("#customerId").value;
        const customerGrade = document.querySelector("#customerGrade option:checked").value;

        document.querySelector("#customerGradeSelect").submit();
    })

    document.querySelector("#resetPasswordButton").addEventListener("click", function () {
        const customerId = document.querySelector("#customerId").value;
        const data = {customerId}

        fetch(`\${ctx}/admin/resetPassword`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(data)
        })
            .then(res => res.json())
    })

    document.querySelector("#searchButton").addEventListener("click", function() {
        document.querySelector("#customerSearch").submit();
    })
</script>


</body>
</html>