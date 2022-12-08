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
<my:navBar/>


</div>
    <h1>상품 등록</h1>
    <form id="contentRegisterForm" action="" method="post" enctype="multipart/form-data">
        상품명 <input required="required" type="text" name="contentName">
        <br>
        장소 <input required="required" type="text" name="contentRegion">
        <br>
        기간 <input required="required" type="date" name="contentStartDate">
        ~ <input required="required" type="date" name="contentEndDate">
        <br>
        <div class="form-check form-check-inline">
            <input type="checkbox" name="checkMon" value="1" id="checkMon" class="checkSelect"/>월
            <input type="hidden" name="checkMon" value="0" id="checkMonHidden" class="checkSelect"/>

            <input type="checkbox" name="checkTues" value="1" id="checkTues" class="checkSelect"/>화
            <input type="hidden" name="checkTues" value="0" id="checkTuesHidden" class="checkSelect"/>

            <input type="checkbox" name="checkWednes" value="1" id="checkWednes" class="checkSelect"/>수
            <input type="hidden" name="checkWednes" value="0" id="checkWednesHidden" class="checkSelect"/>

            <input type="checkbox" name="checkThurs" value="1" id="checkThurs" class="checkSelect"/>목
            <input type="hidden" name="checkThurs" value="0" id="checkThursHidden" class="checkSelect"/>

            <input type="checkbox" name="checkFri" value="1" id="checkFri" class="checkSelect"/>금
            <input type="hidden" name="checkFri" value="0" id="checkFriHidden" class="checkSelect"/>

            <input type="checkbox" name="checkSatur" value="1" id="checkSatur" class="checkSelect"/>토
            <input type="hidden" name="checkSatur" value="0" id="checkSaturHidden" class="checkSelect"/>

            <input type="checkbox" name="checkSun" value="1" id="checkSun" class="checkSelect"/>일
            <input type="hidden" name="checkSun" value="0" id="checkSunHidden" class="checkSelect"/>

            <input type="hidden" name="hiddenValue" id="hiddenValue" value=""/>
            <button type="button" onClick="checkFun()" ></button>
        </div>
        <br>
        시작시간 <input required="required" type="number" name="startTime" min="0" max="24">
        ~
        종료시간 <input required="required" type="number" name="endTime" min="0" max="24">
        <br>
        가격 <input required="required" type="number" name="contentPrice" min="0">
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
    // 요일 체크박스 선택하면 1, 선택 안하면 0
    if(document.getElementById("checkMon").checked) {
        document.querySelector("checkMonHidden").disabled = true;
    }
    if(document.getElementById("checkTues").checked) {
        document.querySelector("checkTuesHidden").disabled = true;
    }
    if(document.getElementById("checkWednes").checked) {
        document.querySelector("checkWednesHidden").disabled = true;
    }
    if(document.getElementById("checkThurs").checked) {
        document.querySelector("checkThursHidden").disabled = true;
    }
    if(document.getElementById("checkFri").checked) {
        document.querySelector("checkFriHidden").disabled = true;
    }
    if(document.getElementById("checkSatur").checked) {
        document.querySelector("checkSaturHidden").disabled = true;
    }
    if(document.getElementById("checkSun").checked) {
        document.querySelector("checkSunHidden").disabled = true;
    }

    checkFun();
    function checkFun() {
        let checkArray = Array();
        let cnt = false;
        let chkBox = document.querySelector(".checkSelect").value;
        console.log(chkBox);
        for (i=0; i<chkBox.length; i++ ){
            if(chkBox[i].checked == true){
                checkArray[i] = chkBox[i].value;
            }
        }
        console.log(checkArray);
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
</body>
</html>
