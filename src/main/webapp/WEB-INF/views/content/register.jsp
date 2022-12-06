<%--
  Created by IntelliJ IDEA.
  User: sunggyu-lim
  Date: 2022/11/24
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상품 등록</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
            crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<my:navBar/>


</div>
    <h1>상품 등록</h1>
    <form id="contentRegisterForm" action="" method="post" enctype="multipart/form-data">
        상품명 <input required="required" type="text" name="contentName">
        <br>
        장소 <input required="required" type="text" name="contentRegion">
        <br>
        시작 <input required="required" type="date" name="contentStartDate">
        <br>
        종료 <input required="required" type="date" name="contentEndDate">
        <br>
        가격 <input required="required" type="number" name="contentPrice">
        <br>
        정보 <textarea name="contentBoard"></textarea>
        <br>
        <div class="posterBox">
            <label for="" class="form-label">포스터</label>
            <input type="file" accept="image/*" class="form-control" name="file1">
        </div>
        <div class="DetailBox">
            <label for="" class="form-label">세부내용</label>
            <input multiple type="file" accept="image/*" class="form-control" name="file2">
        </div>
        <input id="submitButton1" type="submit" value="등록">
    </form>

<script>
    // document.querySelector("#submitButton1").addEventListener("click", function(e) {
    //     // submit 진행 중지
    //     e.preventDefault();
    //
    //     // input 입력한 값 가져오기
    //     let NameValue = document.querySelector(`#registerForm input[name="contentName"]`).value
    //     let RegionValue = document.querySelector(`#registerForm input[name="contentRegion"]`).value
    //     let StartDateValue = document.querySelector(`#registerForm input[name="contentStartDate"]`).value
    //     let EndDateValue = document.querySelector(`#registerForm input[name="contentEndDate"]`).value
    //     let PriceValue = document.querySelector(`#registerForm input[name="contentPrice"]`).value
    //     let BoardValue = document.querySelector(`#registerForm input[name="contentBoard"]`).value
    //     // 빈칸만 있는지 확인
    //
    //     // 위 테스트 모두 통과하면 submit
    //     if (NameValue.trim() != ""
    //         && RegionValue.trim() != ""
    //         && StartDateValue.trim() != ""
    //         && EndDateValue.trim() !=""
    //         && PriceValue.trim()!= ""
    //         && BoardValue.trim()!= "") {
    //
    //         document.querySelector("#contentRegisterForm").submit();
    //     } else {
    //         // 적절한 메세지 표시
    //
    //
    //     }
    // });
</script>

    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
</body>
</html>
