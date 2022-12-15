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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.8.0/proj4.js" integrity="sha512-ha3Is9IgbEyIInSb+4S6IlEwpimz00N5J/dVLQFKhePkZ/HywIbxLeEu5w+hRjVBpbujTogNyT311tluwemy9w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%--    <script>--%>
<%--        function checkDay() {--%>
<%--            &lt;%&ndash;let obj = ${"[name"};&ndash;%&gt;--%>
<%--            const checkArray = new Array();--%>

<%--            $('input:checkBox[name=checkMon]:checked').each(function(){--%>
<%--                checkArray.push(this.value);--%>
<%--            });--%>
<%--            $('input:checkBox[name=checkTues]:checked').each(function(){--%>
<%--                checkArray.push(this.value);--%>
<%--            });--%>
<%--            $('input:checkBox[name=checkWednes]:checked').each(function(){--%>
<%--                checkArray.push(this.value);--%>
<%--            });--%>
<%--            $('input:checkBox[name=checkThurs]:checked').each(function(){--%>
<%--                checkArray.push(this.value);--%>
<%--            });--%>
<%--            $('input:checkBox[name=checkFri]:checked').each(function(){--%>
<%--                checkArray.push(this.value);--%>
<%--            });--%>
<%--            $('input:checkBox[name=checkSatur]:checked').each(function(){--%>
<%--                checkArray.push(this.value);--%>
<%--            });--%>
<%--            $('input:checkBox[name=checkSun]:checked').each(function(){--%>
<%--                checkArray.push(this.value);--%>
<%--            });--%>
<%--            $('#hiddenValue').val(checkArray);--%>
<%--            console.log($('#hiddenValue').val());--%>
<%--        };--%>
<%--    </script>--%>
</head>
<body>
    <h1>상품 등록</h1>
    <form id="contentRegisterForm" action="" method="post" enctype="multipart/form-data">
        상품명 <input required="required" type="text" name="contentName">
        <br>
        장소 <input required="required" type="text" name="contentRegion">
        <br>
        기간 <input required="required" type="date" name="contentStartDate">
        ~ <input required="required" type="date" name="contentEndDate">
        <br>
        휴관일
        <div class="form-check form-check-inline">
            <input type="checkbox" value="1" id="checkMon" class="checkSelect" onchange="checkFun()">월

            <input type="checkbox" value="1" id="checkTues" class="checkSelect" onchange="checkFun()"/>화

            <input type="checkbox" value="1" id="checkWednes" class="checkSelect" onchange="checkFun()"/>수

            <input type="checkbox" value="1" id="checkThurs" class="checkSelect" onchange="checkFun()"/>목

            <input type="checkbox" value="1" id="checkFri" class="checkSelect" onchange="checkFun()"/>금

            <input type="checkbox" value="1" id="checkSatur" class="checkSelect" onchange="checkFun()"/>토

            <input type="checkbox" value="1" id="checkSun" class="checkSelect" onchange="checkFun()"/>일

            <input type="hidden" name="dayLimit" id="dayLimit" value=""/>
        </div>
        <br>
        시작시간 <input required="required" type="number" name="startTime" min="0" max="24">
        ~
        종료시간 <input required="required" type="number" name="endTime" min="0" max="24">
        <br>
        가격 <input required="required" type="number" name="contentPrice" min="0" step="1000">원
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

        <br>

<%--      주소 검색  --%>
        <table >
            <colgroup>
                <col style="width:20%"><col>
            </colgroup>
            <tbody>
            <tr>
                <%--            도로명주소--%>
                <td><input type="hidden" id="contentAddress" name="contentAddress" style="width:85%"></td>
                <input type="hidden" id="confmKey" name="confmKey" value=""  >
                <input type="button"  value="주소검색" onclick="goPopup();">
            </tr>
            <tr>
                <td>
                    <%--             경위도--%>
                    <input type="hidden" id="contentMapEntX" name="contentMapEntX" style="width:40%" value="">
                    <input type="hidden" id="contentMapEntY" name="contentMapEntY" style="width:40%" value="">
                </td>
            </tr>
            <tr>
                <td>
<%--                    상세정보--%>
                    <input type="text" id="contentAddrDetail" name="contentAddrDetail" style="width:40%" value="" readonly>
                </td>
            </tr>
            </tbody>
        </table>

        <input id="submitButton1" type="submit" value="등록">
    </form>
<script>
    checkFun();
    function checkFun() {
        // 1이면 휴관일, 0이면 오픈
        let dayLimit = "";
        let checked = document.getElementsByClassName("checkSelect");

        for (var i = 0; i < checked.length; i++) {
            if (checked[i].checked) {
                dayLimit += '1'
            } else {
                dayLimit += '0'
            }
        }
        document.getElementById("dayLimit").value = dayLimit;
    }

    // $("#array").val(checkArray);

</script>
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

<script language="javascript">

    function goPopup(){
        // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
        var pop = window.open("/content/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
    }
    function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
        , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno
        , emdNo, entX, entY){
        // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
        document.querySelector('#contentAddress').value = roadAddrPart1;
        document.querySelector('#contentAddrDetail').value = addrDetail;

        var a = parseFloat(entX);
        var b = parseFloat(entY);

        const grs80UtmK = '+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs ';
        const wgs84 = '+title=WGS 84 (long/lat) +proj=longlat +ellps=WGS84 +datum=WGS84 +units=degrees';
        const result = proj4(grs80UtmK, wgs84, [parseFloat(a.toFixed(6)), parseFloat(b.toFixed(6))]);

        document.querySelector('#contentMapEntY').value = result[0];
        document.querySelector('#contentMapEntX').value = result[1];
        console.log(result);
    }
</script>
</body>
</html>
