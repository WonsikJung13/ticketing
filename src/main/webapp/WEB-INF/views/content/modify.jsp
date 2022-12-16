<%--
  Created by IntelliJ IDEA.
  User: sunggyu-lim
  Date: 2022/11/25
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page import="java.net.*" %>


<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
            crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/templatemo-xtra-blog.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.8.0/proj4.js"
            integrity="sha512-ha3Is9IgbEyIInSb+4S6IlEwpimz00N5J/dVLQFKhePkZ/HywIbxLeEu5w+hRjVBpbujTogNyT311tluwemy9w=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- 네이버 스마트에디터  -->
    <script type="text/javascript" src="../libs/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="application/json" src="/code.jquery.com/jquery-1.11.0.min.js" charset="utf-8"></script>
    <link rel="shortcut icon" href="#">

    <!-- textEditor -->
    <script>

        function save(){
            oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
            //스마트 에디터 값을 텍스트컨텐츠로 전달
            // var content = document.getElementById("smartEditor").value;
            // alert(document.getElementById("txtContent").value);
            // 값을 불러올 땐 document.get으로 받아오기
            return;
        }

    </script>

    <title>상품 수정</title>
    <style>
        .custom-check .form-check-input:checked {
            background-color: #dc3545;
            border-color: #dc3545;
        }

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
<div class="container-md" style="width: 1500px">
    <div class="row mt-5">
        <div class="col" style="border: 30px solid #c6f1f1; padding: 90px">
            <h1 style="font-family: 'LINESeedKR-Bd'">
                <%--                ${content.contentName}--%>
                전시회 정보 수정
                <button style="font-family: 'LINESeedKR-Bd'; border-color: #0cc" type="submit" class="btn btn-ico"
                        data-bs-toggle="modal" data-bs-target="#modifyModal">
                    수정하기
                </button>
            </h1>

            <form id="modifyForm" action="" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        상품
                    </label>
                    <%--    <input type="hidden" name="contentPosterName" value="${content.contentPosterName}">--%>
                    <input class="form-control" type="text" name="contentName" value="${content.contentName}">
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        장소
                    </label>
                    <input class="form-control" type="text" name="contentRegion" value="${content.contentRegion}">
                    <%--      주소 검색  --%>
                    <table >
                        <colgroup>
                            <col style="width:20%"><col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <%--            도로명주소--%>
                            <input type="text" id="contentAddress" class="form-control" name="contentAddress"  value="${content.contentAddress}" required="required" style="width:85%">
                            <input type="hidden" id="confmKey" name="confmKey" value=""  >
                            <button type="button" class="MapBtn" onclick="goPopup();">
                                주소검색
                            </button>
                        </tr>
                        <tr>
                            <td>
                                <%--             경위도--%>
                                <input type="hidden" id="contentMapEntX" name="contentMapEntX" style="width:40%" value="${content.contentMapEntX}">
                                <input type="hidden" id="contentMapEntY" name="contentMapEntY" style="width:40%" value="${content.contentMapEntY}">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--                    상세정보--%>
                                <input type="text" id="contentAddrDetail" name="contentAddrDetail" style="width:40%" value="${content.contentAddrDetail}" readonly>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div>
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        기간
                    </label>
                </div>
                <div  class="mb-3" style="">
                    <input class="form-control" style="display:inline-block;width: 48.4%" required="required" type="date" name="contentStartDate" value="${content.contentStartDate}">
                    ~ <input class="form-control" style="display: inline-block;width:48.4%;" required="required" type="date" name="contentEndDate" value="${content.contentEndDate}">
                </div>

                <%--                휴관일--%>
                <div>
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        휴관일
                    </label>
                </div>
                <div class="form-check form-check-inline">
                    <div style="font-family: 'LINESeedKR-Bd'; color: #ff493f">
                        <input type="checkbox" value="1" id="checkMon" class="checkSelect" onchange="checkFun()"> 일
                    </div>

                    <div style="margin-left: 20px; font-family: 'LINESeedKR-Bd'">
                        <input type="checkbox" value="1" id="checkTues" class="checkSelect" onchange="checkFun()"/> 월
                    </div>

                    <div style="margin-left: 20px; font-family: 'LINESeedKR-Bd'">
                        <input type="checkbox" value="1" id="checkWednes" class="checkSelect" onchange="checkFun()"/> 화
                    </div>

                    <div style="margin-left: 20px; font-family: 'LINESeedKR-Bd'">
                        <input type="checkbox" value="1" id="checkThurs" class="checkSelect" onchange="checkFun()"/> 수
                    </div>

                    <div style="margin-left: 20px; font-family: 'LINESeedKR-Bd'">
                        <input type="checkbox" value="1" id="checkFri" class="checkSelect" onchange="checkFun()"/> 목
                    </div>

                    <div style="margin-left: 20px; font-family: 'LINESeedKR-Bd'">
                        <input type="checkbox" value="1" id="checkSatur" class="checkSelect" onchange="checkFun()"/> 금
                    </div>

                    <div style="margin-left: 20px; font-family: 'LINESeedKR-Bd'; color: #2c8cff">
                        <input type="checkbox" value="1" id="checkSun" class="checkSelect" onchange="checkFun()"/> 토
                    </div>

                    <input type="hidden" name="dayLimit" id="dayLimit" value=""/>
                </div>

                <div style="">
                    <label style="font-family: 'LINESeedKR-Bd';display: inline-block;width:49.3%;margin-right: 4px" for="" class="form-label">
                        시작 시간
                    </label>
                    <label style="font-family: 'LINESeedKR-Bd';display: inline-block;width:49.3%;" for="" class="form-label mt-3">
                        종료 시간
                    </label>
                    <input style="display: inline-block;width:49.3%;margin-right: 4px;" class="form-control" required="required" type="number" name="startTime" min="0" max="24" value="${content.startTime}">
                    <input style="display: inline-block;width:49.3%;" class="form-control mb-3" required="required" type="number" name="endTime" min="0" max="24" value="${content.endTime}">
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        가격
                    </label>
                    <input class="form-control" type="number" name="contentPrice" value="${content.contentPrice}">
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        정보
                    </label>
                <!-- textEditor -->
                    <textarea class="form-control mb-3" name="contentBoard" id="txtContent" value="" rows="10" cols="100" style="width: 100%; ">${content.contentBoard}</textarea>
                    <!-- textarea 밑에 script 작성하기 -->
                    <script id="smartEditor" type="text/javascript">
                        var oEditors = [];
                        nhn.husky.EZCreator.createInIFrame({
                            oAppRef: oEditors,
                            elPlaceHolder: "txtContent",  //textarea ID 입력
                            sSkinURI: "../libs/smarteditor/SmartEditor2Skin.html",  //martEditor2Skin.html 경로 입력
                            fCreator: "createSEditor2",
                            htParams : {
                                // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                                bUseToolbar : true,
                                // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                                bUseVerticalResizer : false,
                                // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                                bUseModeChanger : false
                            }
                        });
                    </script>
                </div>

                <div class="posterBox mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">포스터</label>
                    <input type="file" accept="image/*" class="form-control" name="addPosterFile" id="addPosterFile">
                </div>
                <div class="DetailBox mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">세부내용</label>
                    <input multiple type="file" id="fileUpload" accept="image/*" class="form-control" name="addDetailFiles">
                </div>

                <c:forEach items="${content.contentPosterName}" var="contentPosterName" varStatus="status">

                    <%-- Poster 이미지 출력 --%>
                    <div class="row mt-5">
                        <div class="col-2 d-flex justify-content-center align-items-baseline">
                                <%-- 삭제여부 체크박스 --%>
                            <div class="custom-check form-check form-switch text-danger">
                                <input name="removePosterName" value="${contentPosterName}" class="form-check-input"
                                       type="checkbox" role="switch" id="flexSwitchCheckChecked">
                                <label class="form-check-label" for="flexSwitchCheckChecked"><i
                                        class="fa-regular fa-trash-can"></i></label>
                            </div>
                        </div>
                        <div class="col-10">
                            <img src="${imgUrl}/${content.contentId}/${URLEncoder.encode(contentPosterName, 'utf-8')}"
                                 alt="">
                        </div>
                    </div>
                </c:forEach>
                <%-- Detail 이미지 출력 --%>
                <div>
                    <c:forEach items="${content.contentDetailName}" var="contentDetailName" varStatus="status">
                        <div class="row mt-5">
                            <div class="col-2 d-flex justify-content-center align-items-baseline">
                                    <%-- 삭제여부 체크박스 --%>
                                <div class="custom-check form-check form-switch text-danger">
                                    <input name="removeDetailNames" value="${contentDetailName}"
                                           class="form-check-input" type="checkbox" role="switch"
                                           id="flexSwitchCheckChecked${status.count}">
                                    <label class="form-check-label" for="flexSwitchCheckChecked${status.count}"><i
                                            class="fa-regular fa-trash-can"></i></label>
                                </div>
                            </div>
                            <div class="col-10">
                                <img class="img-fluid img-thumbnail"
                                     src="${imgUrl}/${content.contentId}/${URLEncoder.encode(contentDetailName, 'utf-8')}"
                                     alt="">
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabel">수정 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div style="font-family: 'LINESeedKR-Bd'" class="modal-body">
                수정하시겠습니까?
            </div>
            <div class="modal-footer">
                <button style="font-family: LINESeedKR-Bd" type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">취소
                </button>
                <button style="font-family: LINESeedKR-Bd; background-color: #0cc; color: white" type="button"
                        class="btn" id="modifyConfirmButton" onclick="save()">확인
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    // 확장자 체크 함수
    function checkFile(obj, ext) {
        var check = false;
        var extName = obj.val().substring(obj.val().lastIndexOf(".") + 1).toUpperCase();
        var str = ext.split(",");

        for ( var i = 0; i < str.length; i++ ) {
            if (extName == str[i].trim()) {
                check = true;
                break;
            } else check = false;
        }
        if ( !check ) {
            alert(ext + " 파일만 업로드 가능합니다.");
        }
        return check;
    };

    // 파일 용량 체크 함수
    function checkFileSize(obj, size) {

        var check = false;
        var sizeinbytes = obj[0].files[0].size;
        var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
        var i = 0;
        var checkSize = size;

        while (checkSize > 900) {
            checkSize /= 1024;
            i++;
        }

        checkSize = (Math.round(checkSize * 100) / 100) + ' ' + fSExt[i];
        var fSize = sizeinbytes;

        if (fSize > size) {
            alert("첨부파일은 " + checkSize + " 이하로 첨부 바랍니다.");
            check = false;
        } else {
            check = true;
        }
        return check;
    };


</script>
<script>
    // 파일 체크 실행
    var MaxSize = 10;
    var FileExt = "PNG, JPG, JPEG";

    document.getElementById('fileUpload').onchange = function () {

        if (this.value != "") {

            var extPlan = FileExt;
            var checkSize = 1024 * 1024 * MaxSize;

            if (!checkFile($('#fileUpload'), extPlan) | !checkFileSize($('#fileUpload'), checkSize)) {
                this.value = "";
                return;
            }
        }
    };
</script>

<script>
    // 휴관일 선택 함수
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
    // 수정버튼 누르면
    document.querySelector("#modifyConfirmButton").addEventListener("click", function () {
        document.querySelector("#modifyForm").submit();
    });

    if (document.querySelector("#addPosterFile").value != "") {
        console.log("input file")
        document.querySelector("#flexSwitchCheckChecked").checked = true;
    }
</script>

<script>
    // 지도 팝업창으로 여는 함수
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>
</body>
</html>
