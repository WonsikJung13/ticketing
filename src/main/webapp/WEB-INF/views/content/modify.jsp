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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- 네이버 스마트에디터  -->
    <script type="text/javascript" src="../libs/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="application/json" src="/code.jquery.com/jquery-1.11.0.min.js" charset="utf-8"></script>
    <link rel="shortcut icon" href="#">

    <title>상품 수정</title>

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

        .btn {
            color: #ffffff !important;
            background-color: #79dfdf !important;
            border-color: #79dfdf !important;
            border-radius: 0.375rem !important;
        }

        .btn:hover {
            background-color: #5aa3a3 !important;
            border-color: #5aa3a3 !important;
        }

    </style>

    <style>
        /* 파일 첨부 */
        /*업로드 버튼*/
        .posterBox label {
            display: inline-block;
            padding: .5em .75em;
            color: #fff;
            font-size: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: #79dfdf;
            cursor: pointer;
            border: 1px solid #79dfdf;
            border-radius: .25em;
        }

        .posterBox label:hover {
            background-color: #5aa3a3 !important;
            border-color: #5aa3a3 !important;
        }

        .detailBox label {
            display: inline-block;
            padding: .5em .75em;
            color: #fff;
            font-size: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: #79dfdf;
            cursor: pointer;
            border: 1px solid #79dfdf;
            border-radius: .25em;
        }
        .detailBox label:hover {
            background-color: #5aa3a3 !important;
            border-color: #5aa3a3 !important;
        }


        input[type="file"] {  /* 파일 필드 숨기기 */
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip:rect(0,0,0,0);
            border: 0;
        }

        .posterBox.bs3-primary label {
            color: #fff;
            background-color: #337ab7;
            border-color: #2e6da4;

        }

        /* named upload */
        .posterBox .file1-name .file2-name{
            display: inline-block;
            padding: .5em .75em;  /* label의 패딩값과 일치 */
            font-size: inherit;
            font-family: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: #f5f5f5;
            border: 1px solid #ebebeb;
            border-bottom-color: #e2e2e2;
            border-radius: .25em;
            -webkit-appearance: none; /* 네이티브 외형 감추기 */
            -moz-appearance: none;
            appearance: none;
        }

        /* imaged preview */
        .posterBox .upload-display {  /* 이미지가 표시될 지역 */
            margin-bottom: 5px;
        }

        @media(min-width: 768px) {
            .posterBox .upload-display {
                display: inline-block;
                margin-right: 5px;
                margin-bottom: 0;
            }
        }

        .posterBox .upload-thumb-wrap {  /* 추가될 이미지를 감싸는 요소 */
            display: inline-block;
            width: 54px;
            padding: 2px;
            vertical-align: middle;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }

        .posterBox .upload-display img {  /* 추가될 이미지 */
            display: block;
            max-width: 100%;
            width: 100% \9;
            height: auto;
        }
    </style>

    <style>
        /*파일 첨부*/

        #preview1,
        #preview1 li,
        #preview2,
        #preview2 li{
            float:left;
            margin-bottom: 16px;

        }
        /*.addImgBtn{*/
        /*    width: 80px !important;*/
        /*    height: 80px !important;*/
        /*    background-color: #fff !important;*/
        /*    color: #b7b7b7 !important;*/
        /*    border: 2px solid #b7b7b7;*/
        /*    font-size: 35px !important;*/
        /*}*/

        #preview1,
        #preview2{
            width: 660px;
        }
        #preview1 li,
        #preview2 li{
            margin-left: 10px;
            margin-bottom: 10px;
            position: relative;
            border: 1px solid #ececec;
            cursor:move;
            vertical-align: middle;
        }
        .delBtn{
            position: absolute;
            top: 0;
            right: 0;
            font-size: 13px;
            background-color: #000;
            color: #fff;
            width: 18px;
            height: 18px;
            line-height: 16px;
            display: inline-block;
            text-align: center;
            cursor: pointer;
        }
        ul {
            list-style: none;
        }
    </style>
</head>
<body>
<div class="container-md" style="max-width: 900px;min-width: 500px">
    <div class="row mt-5">
        <div class="col" style="border: 30px solid #c6f1f1; padding: 90px">
            <h1 style="font-family: 'LINESeedKR-Bd'">
                <%--                ${content.contentName}--%>
                전시회 정보 수정
                <button type="button" class="btn" id="outButton" onclick="location.href='/content/get?contentId=${content.contentId}'" style="float:right;font-family: LINESeedKR-Bd;background-color: #ff4a46 !important; border-color:#FF4A46 !important;">
                    나가기
                </button>
                <button style="font-family: 'LINESeedKR-Bd';float:right; border-color: #0cc" type="submit" class="btn btn-ico"
                        data-bs-toggle="modal" data-bs-target="#modifyModal">
                    수정하기
                </button>
            </h1>

            <form id="modifyForm" action="" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        상품명
                    </label>
                    <%--    <input type="hidden" name="contentPosterName" value="${content.contentPosterName}">--%>
                    <input class="form-control" type="text" name="contentName" value="${content.contentName}">
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        장소명
                    </label>
                    <input class="form-control" required="required" type="text" name="contentRegion" value="${content.contentRegion}">
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        주소
                    </label>
                    <%--      주소 검색  --%>
                    <table >
                        <colgroup>
                            <col style="width:20%"><col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <%--            도로명주소--%>
                            <div class="input-group">
                                <button type="button" class="MapBtn btn btn-outline-secondary " onclick="goPopup();" style="background-color: #79dfdf;color: #ffffff; border-color:#00CCCC">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                                <input type="text" id="contentAddress" class="form-control" name="contentAddress"  value="${content.contentAddress}" required="required" readonly style="background-color: transparent;">
                                <input type="hidden" id="confmKey" name="confmKey" value=""  >
                                <%--                    상세정보--%>
                                <input type="text" id="contentAddrDetail" class="form-control" name="contentAddrDetail" style="margin-left:4px" value="${content.contentAddrDetail}" placeholder="상세주소">
                            </div>
                        </tr>
                        <tr>
                            <td>
                                <%--             경위도--%>
                                <input type="hidden" id="contentMapEntX" name="contentMapEntX" style="width:40%" value="${content.contentMapEntX}">
                                <input type="hidden" id="contentMapEntY" name="contentMapEntY" style="width:40%" value="${content.contentMapEntY}">
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
                <div  class="mb-3 input-group" style="">
                    <input class="form-control" style="display:inline-block;margin-right: 4px" required="required" type="date" name="contentStartDate" value="${content.contentStartDate}">
                    ~ <input class="form-control" style="display: inline-block;margin-left: 4px" required="required" type="date" name="contentEndDate" value="${content.contentEndDate}">
                </div>

                <div style="">
                    <div class="input-group">
                        <label style="font-family: 'LINESeedKR-Bd';" for="" class="form-label">
                            시간
                        </label>
                    </div>
                    <div class="input-group">
                        <input style="display: inline-block;width:50%;margin-right: 4px;" class="form-control" required="required" type="number" name="startTime" min="0" max="24" placeholder="시작 (시)" value="${content.startTime}">
                        ~
                        <input style="display: inline-block;margin-left: 4px" class="form-control mb-3" required="required" type="number" name="endTime" min="0" max="24" placeholder="종료 (시)" value="${content.endTime}">
                    </div>
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

                <!-- 파일첨부 -->
                <div style="margin-top: 1rem;">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        포스터
                    </label>
                    <div class="posterBox preview-image">
                        <div class="input-group">
                            <label for="addPosterFile" style="height: 45px;border-color: #0ccccc;">업로드</label>
                            <input class="addPosterFile-name form-control mb-3"  value="파일선택" disabled="disabled" style="height: 45px;border-color: #0ccccc;border-radius: 0;">
                        </div>
                        <input type="file" accept="image/*" class="addPosterFile-hidden form-control mb-3" name="addPosterFile" id="addPosterFile" style="padding-bottom: 0">
                        <div>
                            <ul id="preview1" class="sortable"></ul>
                        </div>
                    </div>

                    <div>
                        <c:forEach items="${content.contentPosterName}" var="contentPosterName" varStatus="status">
                        <ul id="posterPreview">
                            <li class="ui-state-default">
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
                                         alt="" style="height: 120px; width: 120px">
                                </div>
                            </li>
                        </ul>
                        </c:forEach>
                    </div>
                </div>

                <div style="margin-top: 1rem;">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        세부내용
                    </label>
                </div>
                <div class="DetailBox preview-image">
                    <div class="input-group">
                        <label for="addDetailFiles" style="height: 45px;border-color: #0ccccc;">업로드</label>
                        <input class="addDetailFiles-name form-control mb-3"  value="파일선택" disabled="disabled" style="height: 45px;border-color: #0ccccc;border-radius: 0;">
                    </div>
                    <input multiple type="file" id="addDetailFiles" accept="image/*" class="addDetailFiles-hidden form-control mb-3" name="addDetailFiles" style="padding-bottom: 0">
                    <div>
                        <ul id="preview2" class="sortable"></ul>
                    </div>
                </div>
                
                <%-- Detail 이미지 출력 --%>
                <div>
                    <c:forEach items="${content.contentDetailName}" var="contentDetailName" varStatus="status">
                        <ul id="detailPreview" style="float:left">
                            <li class="ui-state-default">
                            <div class="col-2 d-flex justify-content-center align-items-baseline" style="max-width: none !important;">
                                    <%-- 삭제여부 체크박스 --%>
                                <div class="custom-check form-check form-switch text-danger" >
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
                                     alt="" style="width: 120px;height: 120px">
                            </div>
                            </li>
                        </ul>
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
    // 포스터 이미지 미리보기
    $(document).ready(function (e){
        $("#addPosterFile").change(function(e){

            //div 내용 비워주기
            $('#preview1').empty();

            var files = e.target.files;
            var arr =Array.prototype.slice.call(files);


            preview(arr);


        });//file change


        function preview(arr){
            arr.forEach(function(f){

                //파일명이 길면 파일명...으로 처리
                var fileName = f.name;
                if(fileName.length > 10){
                    fileName = fileName.substring(0,7)+"...";
                }

                //div에 이미지 추가
                var str = '<li class="ui-state-default">';
                // str += '<span>'+fileName+'</span><br>';

                //이미지 파일 미리보기
                if(f.type.match('image.*')){
                    var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                    reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                        //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
                        str += '<img src="'+e.target.result+'" title="'+f.name+'" width=120 height=120 />';
                        // str += '<span class="delBtn" onclick="delImg(this)">x</span>';
                        str += '</li>';
                        $(str).appendTo('#preview1');
                    }
                    reader.readAsDataURL(f);
                }

            });//arr.forEach
        }
    })
</script>

<script type="text/javascript">
    // 디테일 이미지 미리보기
    $(document).ready(function (e){
        $("#addDetailFiles").change(function(e){

            //div 내용 비워주기
            $('#preview2').empty();

            var files = e.target.files;
            var arr =Array.prototype.slice.call(files);


            preview(arr);


        });//file change


        function preview(arr){
            arr.forEach(function(f){

                //파일명이 길면 파일명...으로 처리
                var fileName = f.name;
                if(fileName.length > 10){
                    fileName = fileName.substring(0,7)+"...";
                }

                //div에 이미지 추가
                var str = '<li class="ui-state-default">';
                // str += '<span>'+fileName+'</span><br>';

                //이미지 파일 미리보기
                if(f.type.match('image.*')){
                    var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
                    reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                        //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
                        str += '<img src="'+e.target.result+'" title="'+f.name+'" width=120 height=120 />';
                        // str += '<span class="delBtn" onclick="delImg(this)">x</span>';
                        str += '</li>';
                        $(str).appendTo('#preview2');
                    }
                    reader.readAsDataURL(f);
                }

            });//arr.forEach
        }
    })
</script>

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
    var FileExt = "PNG, JPG, JPEG, GIF";

    document.getElementById('addDetailFiles').onchange = function () {

        if (this.value != "") {

            var extPlan = FileExt;
            var checkSize = 1024 * 1024 * MaxSize;

            if (!checkFile($('#addDetailFiles'), extPlan) | !checkFileSize($('#addDetailFiles'), checkSize)) {
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


<script>
    // 포스터 파일 스크립트
    // 파일 업로드 버튼 누를 시 이름 생성
    document.addEventListener("DOMContentLoaded", function ready() {
        var fileTarget = document.querySelector(".posterBox .addPosterFile-hidden");
        fileTarget.addEventListener("change", handleFiles, false);
        function handleFiles() {
            const fileList = this.files;
            var filename = fileList[0].name;
            document.querySelector('.addPosterFile-name').value = filename;
        }
    });


    function readImage(input) {
        // 인풋 태그에 파일이 있는 경우
        if(input.files && input.files[0]) {
            // 이미지 파일인지 검사 (생략)
            // FileReader 인스턴스 생성
            const reader = new FileReader()
            // 이미지가 로드가 된 경우
            reader.onload = e => {
                const previewImage = document.getElementById("preview-image")
                previewImage.src = e.target.result
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0])
        }
    }
    // input file에 change 이벤트 부여
    const inputImage = document.getElementById("addPosterFile")
    inputImage.addEventListener("change", e => {
        readImage(e.target)
    })


    // 디테일 스크립터
    document.addEventListener("DOMContentLoaded", function ready() {
        var fileTarget = document.querySelector(".detailBox .addDetailFiles-hidden");

        fileTarget.addEventListener("change", handleFiles, false);
        function handleFiles() {
            const fileList = this.files;
            var file2Length = document.getElementById("addDetailFiles").files.length;

            console.log("addDetailFiles 개수: " + fileList.length);

            if (fileList.length == 1) {
                console.log(fileList.length);
                var filename = fileList[0].name;
                document.querySelector('.addDetailFiles-name').value = filename;
            }
            else if (fileList.length != 1) {
                var filename = "파일 " + fileList.length + "개";
                document.querySelector('.addDetailFiles-name').value = filename;
            }
        }
    });

    function readMultipleImage(input) {
        const multipleContainer = document.getElementById("multiple-container")

        // 인풋 태그에 파일들이 있는 경우
        if(input.files) {
            // 이미지 파일 검사 (생략)
            console.log(input.files)
            // 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
            const fileArr = Array.from(input.files)
            const $colDiv1 = document.createElement("div")
            const $colDiv2 = document.createElement("div")
            $colDiv1.classList.add("column")
            $colDiv2.classList.add("column")
            fileArr.forEach((file, index) => {
                const reader = new FileReader()
                const $imgDiv = document.createElement("div")
                const $img = document.createElement("img")
                $img.classList.add("image")
                const $label = document.createElement("label")
                $label.classList.add("image-label")
                $label.textContent = file.name
                $imgDiv.appendChild($img)
                $imgDiv.appendChild($label)
                reader.onload = e => {
                    $img.src = e.target.result

                    $imgDiv.style.width = ($img.naturalWidth) * 0.2 + "px"
                    $imgDiv.style.height = ($img.naturalHeight) * 0.2 + "px"
                }

                console.log(file.name)
                if(index % 2 == 0) {
                    $colDiv1.appendChild($imgDiv)
                } else {
                    $colDiv2.appendChild($imgDiv)
                }

                reader.readAsDataURL(file)
            })
            multipleContainer.appendChild($colDiv1)
            multipleContainer.appendChild($colDiv2)
        }
    }
    const inputMultipleImage = document.getElementById("file2")
    inputMultipleImage.addEventListener("change", e => {
        readMultipleImage(e.target)
    })
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>
</body>
</html>
