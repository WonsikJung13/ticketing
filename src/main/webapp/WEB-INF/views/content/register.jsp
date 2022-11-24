<%--
  Created by IntelliJ IDEA.
  User: sunggyu-lim
  Date: 2022/11/24
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상품 등록</title>
</head>
<body>
    <h1>상품 등록</h1>
    <form action="" method="post">
        상품명 <input type="text" name="contentName">
        <br>
        장소 <input type="text" name="contentRegion">
        <br>
        시작 <input type="date" name="contentStartDate">
        <br>
        종료 <input type="date" name="contentEndDate">
        <br>
        가격 <input type="number" name="contentPrice">
        <br>
        정보 <textarea name="contentBoard"></textarea>
        <br>
        <input type="submit" value="등록">
    </form>
</body>
</html>
