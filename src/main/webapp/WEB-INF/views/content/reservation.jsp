<%@ page import="com.limdaram.ticketing.domain.content.ContentDto" %><%--
  Created by IntelliJ IDEA.
  User: sunggyu-lim
  Date: 2022/12/05
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>예약창</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <%
        // 유저정보 획득
//        String userName = Customer.customerName;
//        String userPhone = Customer.customerPhoneNumber;
//        String userEmail = Customer.customerEmail;

        // share detail data
        ContentDto content = (ContentDto)request.getAttribute("DETAIL");
        //JSON 형식으로 달의 날자별 예약현황을 전송받음
//        JSONArray thisMonthResData = (JSONArray)request.getAttribute("thisMonthResData");
//        JSONArray nextMonthResData = (JSONArray)request.getAttribute("nextMonthResData");

        //예약가능 요일 제한. 형식은 0000000 (순서대로 일월화수목금토 의 예약가능여부 표현, 0이면 예약불가, 1이면 예약가능)
        char[] possibleDay = (content.getDayLimit()).toCharArray();
        //예약가능 시간 (start time~end time) end - start = 이용가능시간
        int startTime = content.getStartTime();
        int endTime = content.getEndTime();
        //총 이용 가능 시간
        int totalUsingTime = endTime - startTime;
        //시간당 가격
        int price = content.getContentPrice();

        %>
    <script>
        <%--//예약이 가득찬 날들의 배열--%>
        <%--let thisMonthFullDateList = new Array();--%>
        <%--<c:forEach items="${thisMonthFullDateList}" var = "date">--%>
        <%--thisMonthFullDateList.push(${date});--%>
        <%--</c:forEach>--%>
        <%--let nextMonthFullDateList = new Array();--%>
        <%--<c:forEach items="${nextMonthFullDateList}" var = "date">--%>
        <%--nextMonthFullDateList.push(${date});--%>
        <%--</c:forEach>--%>

        // ------------------ calendar --------------------
        // 데이터 타입 달력
        let today = new Date(); // 오늘기준 날짜 데이터
        // today 보조. 고정
        let date = new Date();
        // 사용자가 클릭한 셀 객체 저장
        let selectedCell;
        // 오늘에 해당하는 월, 일 객체
        let realMonth = date.getMonth() + 1;
        let realToDay = date.getDate();
        // 사용자가 클릭한 월, 일 객체
        let selectedMonth = null;
        let selectedDate = null;

        // 예약가능 요일 계산해 배열 (일~월, 가능0 불가능1)
        <%--const possibleDay = "<%=possibleDay%>";--%>

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

        // 달력 생성(이번달 기준)--------------------------------------------------------
        function buildCalendar() {
            let row = null
            let cnt = 0;
            let i;
            let cell;

            // 현재 참조중인 월
            const nowMonth = today.getMonth() + 1;
            // 이번달이면 0, 다음달이면1 리턴
            const monthEquals = thisMonth(nowMonth, realMonth);

            //이번달이면 0 리턴, 다음달이면 1 리턴
            function thisMonth(todayMonth, dateMonth) {
                console.log("todayMonth : " + todayMonth + ", dateMonth : " + dateMonth);
                if (todayMonth * 1 == dateMonth * 1) {
                    console.log("이번달 이구요")
                    return 0;
                }
                console.log("다음달 이구요")
                return 1;
            }

            // 달력을 만들어서 출력할 table 및 tableTitle을 참조
            const calendarTable = document.getElementById("calendar");  // 달력 객체
            const calendarTableTitle = document.getElementById("calendarTitle");  // 달력 타이틀 객체
            calendarTableTitle.innerHTML = today.getFullYear() + "년" + (today.getMonth() + 1) + "월";  // 타이틀 수정

            // 현재 달력의 첫날과 마지막날을 구함
            const firstDate = new Date(today.getFullYear(), today.getMonth(), 1);   // 첫날
            const lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); // 마지막날

            // 작성할 테이블을 초기화
            while (calendarTable.rows.length > 2) {
                // 타이틀과 요일표시는 남기도록 3번째 행까지만 삭제
                calendarTable.deleteRow(calendarTable.rows.length - 1); // 가장 마지막 행 삭제 반복
            }
            // 셀 입력을 위한 테이블 생성
            row = calendarTable.insertRow();    // 마지막행 생성

            // 달의 첫 날까지 빈 셀을 생성
            for (i = 0; i < firstDate.getDay(); i++) {  // firstDate.getDay() : 첫날의 요일
                cell = row.insertCell();
                cnt += 1;
            }

            // 달력에 요일 채우기
            for (i = 1; i <= lastDate.getDate(); i++) { // lastDate.getDate() : 마지막날의 요일
                // 예약하지 못하는 조건일 경우 +1씩 되므로, noCount가 0일 시에만 클릭함수를 적용
                let noCount = 0;  // 예약 못하는 제약사항에 해당되면 1씩 증가, 일괄적으로 예약불가 처리를 위해 씀
                cell = row.insertCell();    // 1일~마지막날까지 셀 생성
                // 일자를 구해오기 위해 셀에 id부여, i로 입력
                cell.setAttribute('id', i);
                //cell.innerHTML = '<label onclick="prevCalendar()">' + i + '</label>';
                cell.innerHTML = i;         // 셀마다 i 입력
                cell.align = "center";

                // 셀 생성 후 count 증가
                cnt += 1;

                // 일요일은 빨갛게
                if (cnt % 7 == 1) {
                    cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
                }
                // 한 행에 7번(일주일) 입력 후 다음행으로 개행
                if (cnt % 7 == 0) {
                    // 토요일은 파랗게
                    cell.innerHTML = "<font color=skyblue>" + i + "</font>";
                    row = calendar.insertRow();
                }

                // // 선택한 일자를 출력하기
                // cell.onclick = function () {
                //     // today로부터 연, 월을
                //     let clickedYear = today.getFullYear();
                //     let clickedMonth = (1 + today.getMonth());
                //     // 클릭된 cell의 id로부터 일자를 불러온다
                //     let clickedDate = this.getAttribute('id');
                //
                //     // 연월일을 yyyy-mm-dd로 출력할 수 있게 형식 만든다
                //     clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;  // 10보다 크면 그대로 : 작으면 0n
                //     clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
                //     const clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
                //
                //     // 부모창에 계산된 일자를 출력하고 현재창은 닫는다
                //     opener.document.getElementById("dayDate").value = clickedYMD;
                //     self.close();
                // }

                // 예약불가일 색상변경 및 사용자가 직접 지정한 경우------------------------
                let etp = exchangeToPossibleDay(cnt) * 1; // etp의 값 범위: 0 ~ 6 (0일...6토)
                // 기능 : cnt를 매개변수로 넣어 현재일이 '무슨 요일' 인지 반환(1:일,2:월,3:화,4:수,5:목,6:금,7:토)

                if (nowMonth == realMonth && i <= realToDay) {  // 이번달이고 오늘을 포한한 지난날
                    noCount += 1;
                } else if (nowMonth > realMonth && i > realToDay) { // 다음달이고 오늘보다 일이 높은 수일떄
                    noCount += 1;
                }
                // else if (possibleDay[etp] == 1) { // 해당 일이 예약불가 요일일 경우
                //     noCount += 1;
                // }

                // 예약불가일 예외처리---------------------- ------------
                if (noCount > 0) {
                    // noCount가 1이상이면 배경 회색으로, 글자색도 연한 검정으로 변경
                    cell.style.backgroundColor = "#E0E0E0";
                    cell.innerHTML = "<font color='#C6C6C6' >" + i + "</font>";
                } else {
                    // noCount가 0일 경우에만 클릭이벤트 생성되도록 esle구문에 클릭이벤트 함수 작성
                    cell.onclick = function () {
                        // 클릭마다 타임테이블 초기화
                        // selectedTimeAndTotalPriceInit();
                        // 선택된 날의 연, 월, 일을 전역변수에 저장 (일자의 경우 id속성 참조)
                        let clickedYear = today.getFullYear();
                        let clickedMonth = (1 + today.getMonth());
                        clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
                        let clickedDate = this.getAttribute('id');
                        clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;

                        let clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

                        // 하단에 예약일시 표시
                        let inputField = document.getElementById("selectedDate");
                        inputField.value = clickedYMD;
                        // 선택된 월, 일 변수 저장 (시간표에 사용)
                        selectedMonth = today.getMonth() + 1;
                        selectedDate = this.getAttribute('id');

                        // 선택된 셀 색 변화
                        // 클릭한 셀을 전역변수에 저장 후 색 변경 및 기존 선택된 셀의 색 복구
                        if (selectedCell != null) {
                            selectedCell.bgColor = "#FFFFFF";
                        }
                        selectedCell = this;
                        this.bgColor = "#fbedaa";

                        //timetable 생성
                        timeTableMaker(today.getMonth() + 1, this.getAttribute('id'));
                    }
                }
            }

            // //예약이 가득찬 날인 경우 cell 비활성화 및 색상 변경
            // let checkMonth = thisMonth(nowMonth, realMonth);
            // let fullDate = [];
            // // fullDate는 지금 만드는 달의 날짜중 예약이 꽉 찬 날을 int로 보유함
            // // 위에서 구해뒀던 monthEquals를 사용해 달에 알맞은 정보를 담은 Array를 사용하기 위함
            // if (checkMonth == 0) {
            //     fullDate = thisMonthFullDateList;
            // }
            // if (checkMonth == 1) {
            //     fullDate = nextMonthFullDateList;
            // }
            // // fullDate를 순차탐색해 해당하는 날짜의 id를 가진 cell을 호출
            // for (i = 0; i < fullDate.length; i++) {
            //     console.log("꽉 찬날 : " + fullDate[i]);
            //     cell = document.getElementById(fullDate[i]);
            //     console.log("꽉 찬날 : " + cell.innerHTML);
            //     // 배경색과 글자색을 예약불가일과 동일하게 변경
            //     cell.style.backgroundColor = "#E0E0E0";
            //     cell.style.color = '#C6C6C6';
            //     // 클릭이벤트 함수를 빈 함수로 덮어씌워 클릭이벤트를 초기화
            //     cell.onclick = function () {
            //     };
            // }

            // 달력의 마지막 날 뒤 빈칸 행으로 채우기
            if (cnt % 7 != 0) {
                // 마지막 일이 7로 나눠 떨어지지 않을 경우
                for (i = 0; i < 7 - (cnt % 7); i++) {
                    cell = row.insertCell();
                }
            }
        }

        // 사용자가 입력한 예약불가능 일자와 대조하기 위해 0~7의 환형 계산구조
        // cnt를 매개변수로 넣어 현재 일이 '무슨 요일'인지 반환
        // (1: 일, 2: 월, 3:화, 4:수, 5:목, 6:금, 7:토)
        function exchangeToPossibleDay(num) {
            let result = num % 7;
            result -= 1;
            // result에서 1빼고 연산하는 이유:
            // 이후 배열의 인덱스로 사용해 해당값을 조회해야 함.
            // 배열의 인덱스는 0부터 시작이기 때문.
            if (result == -1) {
                result = 6;
            }
            return result;
        }
        // ---------------- time table --------------------------
        <%--var price = "<%=price%>";--%>
        <%--var startTime = "<%=startTime%>";--%>
        <%--var endTime = "<%=endTime%>";--%>
        // //선택된 시간중 가장 빠른/늦은 시간;
        // var selectedFirstTime = 24*1;
        // var selectedFinalTime = 0*1;
        //예약시간표를 만들 table객체 획득

        function timeTableMaker(selectedMonth, selectedDate){
          row = null
          month = selectedMonth;
          date = selectedDate;
          var timeTable = document.getElementById("timeTable");

          //테이블 초기화
          while(timeTable.rows.length > 0){
            timeTable.deleteRow(timeTable.rows.length-1);
          }

          for (i = 0; i < endTime - startTime; i++){
            //곱해서 숫자타입으로 변환
            cellTime = startTime*1 + i;

            cellStartTimeText = cellTime + ":00";
            cellEndTimeText = (cellTime + 1) + ":00";
            inputCellText = cellStartTimeText + " ~ " +  cellEndTimeText;

            //셀 입력을 위해 테이블 개행
            row = timeTable.insertRow();
            //해당 row의 셀 생성
            cell = row.insertCell();
            //cell에 id 부여
            cell.setAttribute('id', cellTime);
            //셀에 입력
            cell.innerHTML = inputCellText;
            //selectedCell.bgColor = "#FFFFFF";
            //cell.innerHTML = "<font color='#C6C6C6' >" + inputCellText + "</font>";
            //클릭이벤
            cell.onclick = function(){
              cellTime = this.getAttribute('id');
              cellTime = cellTime*1;
              console.log("first : " + selectedFirstTime + ", selectedFinalTime : " + selectedFinalTime + ", selected : " + cellTime);
              //예약일시 입력처리
              if (selectedFirstTime != 24 && selectedFinalTime != 0){
                if(cellTime < selectedFirstTime - 1){
                  alert("연속한 시간만 예약가능합니다.");
                  return false;
                }
                if (cellTime > selectedFinalTime + 1){
                  alert("연속한 시간만 예약가능합니다.");
                  console.log(cellTime + ">" + selectedFinalTime + 1)
                  return false;
                }
              }
              this.bgColor = "#fbedaa";
              if (cellTime < selectedFirstTime) {
                selectedFirstTime = cellTime
              }
              if (cellTime > selectedFinalTime) {
                selectedFinalTime = cellTime
              }

              //하단의 예약일시에 시간 표시
              resTime  = selectedFirstTime + ":00 ~ " + (selectedFinalTime + 1) + ":00";

              resTimeForm = document.getElementById("selectedTime");
              resTimeForm.value = resTime;

              //하단의 결제정보에 가격정보 표시
              useTime = (selectedFinalTime + 1) - selectedFirstTime;

              useTimeForm = document.getElementById("totalPrice");
              useTimeForm.value = useTime * price;

            }
          }
          //JSON으로 테이블 td 핸들링
          //이번달 0 다음달 1
          nowMonth = today.getMonth()+1;
          checkMonth = thisMonth(nowMonth, realMonth);
          var json = [];
          <%--if(checkMonth == 0){--%>
          <%--  json = <%=thisMonthResData%>;--%>
          <%--} else {--%>
          <%--  json = <%=nextMonthResData%>;--%>
          <%--}--%>
          for(i = 0; i < Object.keys(json).length; i++){
            if (date == json[i].date){
              jsonObject = json[i];
              for(j = 0; j < jsonObject.startNum.length; j++){
                startNum = jsonObject.startNum[j];
                shareTime = jsonObject.shareTime[j];
                console.log("startNum: " + startNum + ", shareTime : " + shareTime);
                for(k = startNum; k < startNum*1 + shareTime; k++){
                  cell = timeTable.rows[k].cells[0];
                  cell.style.backgroundColor = "#E0E0E0";
                  cell.style.color = '#C6C6C6';
                  cell.onclick = function(){};
                }
              }
            }
          }
        }
        //시간효 초기화
        function tableinit(){
          timeTableMaker(selectedMonth, selectedDate);
          selectedTimeAndTotalPriceInit();
          buildCalendar();
        }

        //날자 클릭시 예약시간 및 결제정보 초기화
        function selectedTimeAndTotalPriceInit(){
          resDateForm = document.getElementById("selectedDate");
          resTimeForm = document.getElementById("selectedTime");
          resTimeForm.value = "";
          resDateForm.value = "";

          useTimeForm = document.getElementById("totalPrice");
          useTimeForm.value = "";

          selectedFirstTime = 24*1;
          selectedFinalTime = 0*1;
        }

        //체크박스 이벤트
        function checkboxEvent(checkbox){
          nameForm = document.getElementById("userName");
          phoneForm = document.getElementById("userPhone");
          emailForm = document.getElementById("userEmail");

          <%--userName = "<%=userName%>";--%>
          <%--userPhone = "<%=userPhone%>";--%>
          <%--userEmail = "<%=userEmail%>";--%>

          if(checkbox.checked == true){
            nameForm.value = userName;
            phoneForm.value = userPhone;
            emailForm.value = userEmail;
          } else {
            nameForm.value = "";
            phoneForm.value = "";
            emailForm.value = "";
          }
        }

        function submitRes(){
          arr = new Array();

          nameForm = document.getElementById("userName");
          phoneForm = document.getElementById("userPhone");
          emailForm = document.getElementById("userEmail");
          capacityForm = document.getElementById("capacity");
          resTimeForm = document.getElementById("selectedTime");
          selectedDateFrom = document.getElementById("selectedDate");
          selectedTimeForm = document.getElementById("selectedTime");
          totalPriceForm = document.getElementById("totalPrice");

          arr.push(nameForm);
          arr.push(phoneForm);
          arr.push(emailForm);
          arr.push(resTimeForm);
          arr.push(selectedDateFrom);
          arr.push(selectedTimeForm);
          arr.push(totalPriceForm);

          for (i = 0; i < arr.length; i++){
            item = arr[i];
            if(item.value == "" ){
              alert("미기입된 정보가 있습니다.");
              item.focus();
              return false;
            }
          }

          <%--if (${DETAIL.capacity} < capacityForm.value) {--%>
          <%--  alert("인원수가 초과되었습니다.");--%>
          <%--  capacityForm.focus();--%>
          <%--  return false;--%>
          <%--}--%>

          popUp = window.open("payment", "payment");
          form = document.paymentForm
          form.action = "payment";
          form.target = "payment";
          form.submit();
        }


    </script>
    <style>
        /*div.cal-sticky {*/
        /*  position: sticky;*/
        /*  top: 100px;*/
        /*  right: 0px;*/
        /*  !*left: 0px;*!*/
        /*  width: 10rem;*/
        /*  background-color: #ffffff;*/
        /*}*/
    </style>
</head>
<body>
<%--    달력--%>

<table id="reservation_time">
    <tr>
        <td class="top" align="left">시간선택</td>
        <td class="top" align="right">
          <button class="btnTime" type="button" onclick="tableinit()">초기화</button>
        </td>

    </tr>
    <tr>
        <td>
            <table id="calendar" align="center">
                <tr>
                    <td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
                    <td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
                    <td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
                </tr>
                <tr>
                    <td align="center"><font color="#F79DC2"/>일</td>
                    <td align="center">월</td>
                    <td align="center">화</td>
                    <td align="center">수</td>
                    <td align="center">목</td>
                    <td align="center">금</td>
                    <td align="center"><font color="skyblue"/>토</td>
                </tr>
            </table>
        </td>
        <td>
            <table id="timeTable"></table>
        </td>
    </tr>
    <tr>
        <td class="top" align="left" colspan="2">예약일시</td>
    </tr>
    <tr>
        <td class="content" colspan="2" align="left">
            <%-- 선택한 예약일시를 출력할 위치--%>
            <input id="selectedDate" style="border:none; width:100px" name="selectedDate" value=""
                   readonly="readonly">
            <%-- 총 예약금액을 출력할 위치--%>
            <input id="selectedTime" style="border:none" name="selectedTime" value="" readonly="readonly">
        </td>
    </tr>
    <tr>
        <td class="top" align="left">결제정보</td>
    </tr>
    <tr>
        <td class="content" align="left" colspan="2">
            <input id="totalPrice" style="border:none; text-align:right; width:100px" name="totalPrice" value=""
                   readonly="readonly">원
        </td>
    </tr>
    <tr>
        <td class="content" align="left" colspan="2">
            <input id="btn_submit" type="button" value="결제하기" onclick="submitRes()"></td>
    <tr>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>
</body>
</html>
