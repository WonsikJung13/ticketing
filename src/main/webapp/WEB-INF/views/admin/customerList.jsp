<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/templatemo-xtra-blog.css" rel="stylesheet">
    <style>
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

        table,th,td,tr,thead
        {
            border:2px solid #0CC;
            border-left: none;
            border-right: none;

        }

    </style>
</head>
<body>
<my:sideBar/>


<div class="tm-main">
    <div class="container-md" style="width: 900px">
        <div class="row mt-5" >
            <div class="col" style="border: 30px solid #c6f1f1; padding: 90px">
                <h1 style="font-family: 'LINESeedKR-Bd'">회원 목록</h1>
                <!-- table.table>thead>tr>th*4^^tbody -->

                <table class="table">
                    <tbody>
                    <tr style="font-family: 'LINESeedKR-Bd'">
                        <th>아이디</th>
                        <th>고객명</th>
                        <th>이메일</th>
                        <th>등급</th>
                    </tr>
                    <c:forEach items="${customerList }" var="customer">
                        <tr >
                            <td id="id">
                                <c:url value="/admin/customerManage" var="infoLink">
                                    <c:param value="${customer.customerId }" name="customerId"/>
                                </c:url>
                                <a href="${infoLink }" class="listHref">
                                        ${customer.customerId  }
                                </a>
                            </td>
                            <td>${customer.customerName }</td>
                            <td>${customer.customerEmail }</td>
                            <td>${customer.customerGrade }</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>
</body>
</html>










