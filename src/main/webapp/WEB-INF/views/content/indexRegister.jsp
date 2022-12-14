<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/12/07
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Blog Post - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="src/main/resources/assets/favicon.ico"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="src/main/resources/css/styles.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.8.0/proj4.js"
            integrity="sha512-ha3Is9IgbEyIInSb+4S6IlEwpimz00N5J/dVLQFKhePkZ/HywIbxLeEu5w+hRjVBpbujTogNyT311tluwemy9w=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<form id="contentRegisterForm" action="" method="post" enctype="multipart/form-data">
    <!-- Page content-->
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-8">
                <!-- Post content-->
                <article>
                    <!-- Post header-->
                    <header class="mb-4">
                        <!-- Post title-->
                        <h1 class="fw-bolder mb-1">제목</h1>
                        <input name="contentName" type="text">
                    </header>
                    시작 <input required="required" type="date" name="contentStartDate">
                    <br>
                    종료 <input required="required" type="date" name="contentEndDate">
                    <br>
                    <div class="posterBox">
                        <h2>썸네일</h2>
                        <input type="file" accept="image/*" class="form-control" name="file1">
                    </div>

                    <hr>


                    <!-- Post content-->
                    <h3>본문</h3>
                    <section class="mb-5">
                        <textarea name="contentBoard"></textarea>
                    </section>
                    <%--            도로명주소--%>
                    <input type="hidden" id="confmKey" name="confmKey" value="">
                    <input type="text" id="contentAddress" name="contentAddress" style="width:85%">
                    <input type="text" id="contentMapEntX" name="contentMapEntX" style="width:40%" value="">
                    <input type="text" id="contentMapEntY" name="contentMapEntY" style="width:40%" value="">
                    <input type="text" id="contentAddrDetail" name="contentAddrDetail" style="width:40%" value=""
                           readonly>
                    <input type="button" value="주소검색" onclick="goPopup();">
                </article>
                <input id="submitButton1" type="submit" value="등록">
            </div>
        </div>
    </div>
</form>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
</footer>

<!-- Core theme JS-->
<script src="src/main/resources/js/scripts.js"></script>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script language="javascript">

    function goPopup() {
        // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
        var pop = window.open("/content/jusoPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
    }

    function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
        , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno
        , emdNo, entX, entY) {
        // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
        document.querySelector('#contentAddress').value = roadAddrPart1;
        document.querySelector('#contentAddrDetail').value = addrDetail;

        console.log("entX" + entX + " entY" + entY);

        var a = parseFloat(entX);
        var b = parseFloat(entY);

        const grs80UtmK = '+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs ';
        const wgs84 = '+title=WGS 84 (long/lat) +proj=longlat +ellps=WGS84 +datum=WGS84 +units=degrees';
        const result = proj4(grs80UtmK, wgs84, [parseFloat(a.toFixed(6)), parseFloat(b.toFixed(6))]);

        console.log(result);

        document.querySelector('#contentMapEntY').value = result[0];
        document.querySelector('#contentMapEntX').value = result[1];
    }
</script>

</body>
</html>
