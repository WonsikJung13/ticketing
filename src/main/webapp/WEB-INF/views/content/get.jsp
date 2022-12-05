<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.net.*" %>

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

    <script>
        // 데이터 타입 달력
        let today = new Date(); // 오늘기준 날짜 데이터

        // 달력 생성
        function buildCalendar() {
            let row = null
            let cnt = 0;
            let i;
            let cell;

            // 달력을 만들어서 출력할 table 및 tableTitle을 참조
            const calendarTable = document.getElementById("calendar");
            const calendarTableTitle = document.getElementById("calendarTitle");
            calendarTableTitle.innerHTML = today.getFullYear() + "년" + (today.getMonth() + 1) + "월";

            // 현재 달력의 첫날과 마지막날을 구함
            const firstDate = new Date(today.getFullYear(), today.getMonth(), 1);   // 첫날
            const lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); // 마지막날

            // 작성할 테이블을 초기화
            while (calendarTable.rows.length > 2) {
                // 타이틀과 요일표시는 남기도록 3번째 행까지만 삭제
                calendarTable.deleteRow(calendarTable.rows.length - 1); // 가장 마지막 행 삭제 반복
            }

            // 달의 첫 날까지 빈 셀을 생성
            row = calendarTable.insertRow();    // 마지막행 생성
            for (i = 0; i < firstDate.getDay(); i++) {  // firstDate.getDay() : 첫날의 요일
                cell = row.insertCell();
                cnt += 1;
            }

            // 달력에 요일 채우기
            row = calendarTable.insertRow();    // 마지막행 생성
            for (i = 1; i <= lastDate.getDate(); i++) { // lastDate.getDate() : 마지막날의 요일
                cell = row.insertCell();    // 1일~마지막날까지 셀 생성
                cnt += 1;

                cell.setAttribute('id', i); // 일자를 구해오기 위해 셀의 id속성을 i로 입력
                cell.innerHTML = i;         // 셀마다 i 입력
                cell.align = "center";

                // 선택한 일자를 출력하기
                cell.onclick = function () {
                    // today로부터 연, 월을
                    const clickedYear = today.getFullYear();
                    let clickedMonth = (1 + today.getMonth());
                    // 클릭된 cell의 id로부터 일자를 불러온다
                    let clickedDate = this.getAttribute('id');

                    // 연월일을 yyyy-mm-dd로 출력할 수 있게 형식 만든다
                    clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;  // 10보다 크면 그대로 : 작으면 0n
                    clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
                    const clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

                    // 부모창에 계산된 일자를 출력하고 현재창은 닫는다
                    opener.document.getElementById("dayDate").value = clickedYMD;
                    self.close();
                }

                if (cnt % 7 == 1) {
                    cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
                }

                // 한 행에 7번 입력 후 다음행으로 개행
                if (cnt % 7 == 0) {
                    cell.innerHTML = "<font color=skyblue>" + i + "</font>";
                    row = calendar.insertRow();
                }
            }

            // 달력의 마지막 날 뒤 빈칸 행으로 채우기
            if (cnt % 7 != 0) {     // 마지막 일이 7로 나눠 떨어지지 않을 경우
                for (i = 0; i < 7 - (cnt % 7); i++) {
                    cell = row.insertCell();
                }
            }
        }


        // 이전달, 다음달로 이동
        // today의 월을 더하거나 뺀 후 buildCalendar를 호출
        function prevCalendar() {
            today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
            buildCalendar();
        }

        function nextCalendar() {
            today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
            buildCalendar();
        }

    </script>

    <style>
        /*div {*/
        /*    margin: 0;*/
        /*    padding: 0;*/
        /*    border: 0;*/
        /*    outline: 0;*/
        /*    font-size: 100%;*/
        /*    vertical-align: baseline;*/
        /*    background: transparent;*/
        /*    display: block;*/
        /*}*/

        .nav {
            display: block;
            position: sticky;
            top: 0;
            background: #ffffff;
        }

        .navSticky {
            width: 83rem;
            z-index: 5;
            /*position: -webkit-sticky;*/
            background: #ffffff;
        }

        .navList {
            border-bottom: 0.1rem solid #b6bdc7;
        }

        .navItem {
            position: relative;
            display: inline-block;
            font-size: 1.3rem;
            font-weight: bold;
            margin-left: 1.5rem;
        }

        .navItem.is-active:before {
            display: block;
            content: '';
            position: absolute;
            bottom: -1px;
            left: 0;
            width: 100%;
            height: 5px;
            background-color: #333;
        }

        .navLink {
            display: block;
            padding: 0.7rem;
            color: inherit;
            text-decoration: none;
            /*line-height: 2.5rem;*/
        }
        div.cal-sticky {
            position: sticky;
            top: 100px;
            right: 0px;
            /*left: 0px;*/
            width: 10rem;
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<my:navBar/>
<div>
    <h1>${content.contentName}

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
    </h1>

<%--    달력--%>
    <div class="calendar cal-sticky">
        <table id="calendar" align="center">
            <tr>
                <td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
                <td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
                <td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
            </tr>
            <tr>
                <td align="center"><font color="#F79DC2">일</td>
                <td align="center">월</td>
                <td align="center">화</td>
                <td align="center">수</td>
                <td align="center">목</td>
                <td align="center">금</td>
                <td align="center"><font color="skyblue">토</td>
            </tr>
            <script type="text/javascript">buildCalendar();</script>
        </table>
    </div>

    <%-- 이미지 출력 --%>
    <div>
        <img src="/images/${content.contentId}/${content.contentPosterName}" alt="">
        <%--    상품명 <input type="text" value="${content.contentName}" readonly> <br>--%>
        <p>장소 <input type="text" value="${content.contentRegion}" readonly></p>
        기간 <input type="date" value="${content.contentStartDate}" readonly>
        ~ <input type="date" value="${content.contentEndDate}" readonly> <br>
        가격 <input type="number" value="${content.contentPrice}" readonly> <br>

        <nav class="nav">
            <div class="navSticky">
                <div class="stickyWrap">
                    <ul class="navList">
                        <li class="navItem  is-active"><a class="navLink" href="#" data-target="INFO">이용정보</a></li>
                        <li class="navItem "><a class="navLink" href="#" data-target="ADDITIONAL">판매정보</a></li>
                        <li class="navItem "><a class="navLink" href="#" data-target="REVIEW">이용후기</a></li>
                        <li class="navItem "><a class="navLink" href="#" data-target="EXPECT">기대평</a></li>
                        <li class="navItem "><a class="navLink" href="#" data-target="QNA">Q&amp;A</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div>
            이용정보 <br>
            <textarea name="contentBoard" readonly>${content.contentBoard}</textarea>
            <br>
            <%-- 이미지 출력2 --%>
            <div>
                <c:forEach items="${content.contentDetailName}" var="name">
                    <div>
                        <img class="img-fluid img-thumbnail" src="/images/${content.contentId}/${name}" alt="">
                    </div>
                </c:forEach>
            </div>
        </div>


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


    </div>


    <!-- 삭제버튼 누르면 -->
    <script>
        document.querySelector("#removeConfirmButton").addEventListener("click", function () {
            document.querySelector("#removeForm").submit();
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous">
    </script>


</body>
</html>
