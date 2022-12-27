<%--
  Created by IntelliJ IDEA.
  User: sunggyu-lim
  Date: 2022/11/24
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>전시회 등록</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
            crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="../static/css/bootstrap.min.css" rel="stylesheet">
    <link href="../static/css/templatemo-xtra-blog.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.8.0/proj4.js" integrity="sha512-ha3Is9IgbEyIInSb+4S6IlEwpimz00N5J/dVLQFKhePkZ/HywIbxLeEu5w+hRjVBpbujTogNyT311tluwemy9w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

    <!-- 네이버 스마트에디터  -->
    <script type="text/javascript" src="../static/libs/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <script type="application/json" src="../static/code.jquery.com/jquery-1.11.0.min.js" charset="utf-8"></script>
    <link rel="shortcut icon" href="#">


    <!-- textEditor -->
    <script>

        function save() {
            oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
            //스마트 에디터 값을 텍스트컨텐츠로 전달
            // var content = document.getElementById("smartEditor").value;
            // alert(document.getElementById("txtContent").value);
            // 값을 불러올 땐 document.get으로 받아오기
            return;
        }

    </script>

    <style>
        /*글씨체*/
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        .MapBtn:hover {
            background-color: #0CC;
            border-color: #0cc;
            color: white;
        }

        textarea {
            width: 100%;
            height: 300px;
            border: none;
            resize: none;
        }

        .btn:hover {
            background-color: #5aa3a3 !important;
            border-color: #5aa3a3 !important;
        }

        .btn{
            color: #ffffff !important;
            background-color: #79dfdf !important;
            border-color: #79dfdf !important;
            /*border-radius: 0.375rem !important;*/
        }
    </style>

    <style>
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
<div class="container-md" style="max-width: 900px;min-width: 500px;overflow-x:scroll">
    <div class="row mt-5"style="">
        <div class="col" style="border: 30px solid #c6f1f1; padding: 90px">
            <h1 style="font-family: 'LINESeedKR-Bd';">상품 등록
                <c:url value="/content/list" var="list"/>
                <button type="button" class="btn" id="outButton" onclick="location.href='${list}'" style="float:right;font-family: LINESeedKR-Bd;background-color: #ff4a46 !important; border-color:#FF4A46 !important;">
                    나가기
                </button>
                <button style="font-family: LINESeedKR-Bd;float:right" type="button" class="btn" id="registerConfirmButton" onclick="save();">
                    등록하기
                </button>
            </h1>
            <form id="contentRegisterForm" action="" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        상품명
                    </label>
                    <input class="form-control" required="required" type="text" name="contentName">
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        장소명
                    </label>
                    <input class="form-control" required="required" type="text" name="contentRegion">
                </div>

                <div class="mb-3">
                    <label style="font-family: 'LINESeedKR-Bd';" for="" class="form-label">
                        주소
                    </label>
                    <%--      주소 검색  --%>
                    <table >
                        <colgroup>
                            <col style="width:20%"><col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <div class="input-group">
                            <%--            도로명주소--%>
                            <button type="button" class="MapBtn btn btn-outline-secondary " onclick="goPopup();" style="background-color: #00CCCC;color: #ffffff; border-color:#00CCCC">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                            <input type="text" id="contentAddress" class="form-control" name="contentAddress"  required="required" readonly style="background-color: transparent;">
                            <input type="hidden" id="confmKey" name="confmKey" value=""  >
                            <%--                    상세정보--%>
                            <input type="text" id="contentAddrDetail" class="form-control" name="contentAddrDetail" style="margin-left:4px" value="" placeholder="상세주소">
                            </div>
                        </tr>
                        <tr>
                            <td>
                                <%--             경위도--%>
                                <input type="hidden" id="contentMapEntX" name="contentMapEntX" style="width:40%" value="">
                                <input type="hidden" id="contentMapEntY" name="contentMapEntY" style="width:40%" value="">
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
                    <div class="input-group">
                     <input class="form-control" style="margin-right: 4px" required="required" type="date" name="contentStartDate">
                        ~
                     <input class="form-control" style="margin-left: 4px" required="required" type="date" name="contentEndDate">
                    </div>
                </div>

                <div style="">
                    <div class="input-group">
                        <label style="font-family: 'LINESeedKR-Bd';" for="" class="form-label">
                            시간
                        </label>
                    </div>
                    <div class="input-group">
                    <input style="display: inline-block;width:50%;margin-right: 4px;" class="form-control" required="required" type="number" name="startTime" min="0" max="24" placeholder="시작 (시)">
                        ~
                    <input style="display: inline-block;margin-left: 4px" class="form-control mb-3" required="required" type="number" name="endTime" min="0" max="24" placeholder="종료 (시)">
                    </div>
                </div>

                <div>
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        휴관일
                    </label>
                </div>
                <div class="form-check form-check-inline mb-3" style="">
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
                <div>
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        가격
                    </label>
                </div>
                <input class="form-control mb-3" required="required" type="number" name="contentPrice" min="0" step="" placeholder="원">

                <div>
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        이용정보
                    </label>
                </div>
                <!-- textEditor -->
                <div>
                    <textarea class="form-control mb-3" name="contentBoard" id="txtContent" rows="10" cols="100" style="width: 100%;max-width: 900px "></textarea>

                    <!-- textarea 밑에 script 작성하기 -->
                    <script id="smartEditor" type="text/javascript">
                        var oEditors = [];
                        nhn.husky.EZCreator.createInIFrame({
                            oAppRef: oEditors,
                            elPlaceHolder: "txtContent",  //textarea ID 입력
                            sSkinURI: "../static/libs/smarteditor/SmartEditor2Skin.html",  //martEditor2Skin.html 경로 입력
                            fCreator: "createSEditor2",
                            htParams: {
                                // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                                bUseToolbar: true,
                                // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                                bUseVerticalResizer: false,
                                // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                                bUseModeChanger: false
                            }
                        });
                    </script>
                </div>

                <!-- 파일첨부 -->
                <div style="margin-top: 1rem;">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        포스터
                    </label>
                    <div class="posterBox preview_image">
                        <div class="input-group inputFile">
                        <label for="file1" style="height: 45px;border-color: #0ccccc;">업로드</label>
                        <input class="file1-name form-control mb-3"  value="파일선택" disabled="disabled" style="height: 45px;border-color: #0ccccc;border-radius: 0;">
                        </div>
                        <input type="file" id="file1" accept="image/*" class="file1-hidden form-control mb-3" name="file1" style="padding-bottom: 0">
                        <div>
                            <ul id="preview1" class="sortable"></ul>
                        </div>
                    </div>
                </div>

                <div style="">
                    <label style="font-family: 'LINESeedKR-Bd'" for="" class="form-label">
                        세부내용
                    </label>
                <div class="DetailBox clearfix">
                    <div class="input-group inputFile ">
                        <label for="file2" style="height: 45px;border-color: #0ccccc;">업로드</label>
                        <input class="file2-name form-control mb-3" value="파일선택" disabled="disabled" style="height: 45px;border-color: #0ccccc;border-radius: 0;">
                    </div>
                    <input multiple type="file" id="file2" accept="image/*" class="file2-hidden form-control mb-3" name="file2" style="padding-bottom: 0">
                    <div>
                        <ul id="preview2" class="sortable"></ul>
                    </div>
                </div>
                </div>

                <input style="display: none" id="submitButton1" type="submit" onclick="save();" value="등록">

            </form>
        </div>
    </div>
</div>

<script>
    // 포스터 이미지 미리보기
    $(document).ready(function (e){
        $("#file1").change(function(e){

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
        $("#file2").change(function(e){

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
    // 등록하기 누르면
    document.querySelector("#registerConfirmButton").addEventListener("click", function () {
        document.querySelector("#submitButton1").click();
    });
</script>
<script>
    // 확장자 체크 함수
    function checkFile(obj, ext) {
        var check = false;
        var extName = obj.val().substring(obj.val().lastIndexOf(".") + 1).toUpperCase();
        var str = ext.split(",");

        for (var i = 0; i < str.length; i++) {
            if (extName == str[i].trim()) {
                check = true;
                break;
            } else check = false;
        }
        if (!check) {
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

    document.getElementById('file2').onchange = function () {

        if (this.value != "") {

            var extPlan = FileExt;
            var checkSize = 1024 * 1024 * MaxSize;

            if (!checkFile($('#file2'), extPlan) | !checkFileSize($('#file2'), checkSize)) {
                this.value = "";
                return;
            }
        }
    };
</script>


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
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>


<script>

    function goPopup() {
        // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
        var pop = window.open("/prj2/content/jusoPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
    }

    function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
        , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno
        , emdNo, entX, entY) {
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
        var fileTarget = document.querySelector(".posterBox .file1-hidden");
        fileTarget.addEventListener("change", handleFiles, false);
        function handleFiles() {
            const fileList = this.files;
            var filename = fileList[0].name;
            document.querySelector('.file1-name').value = filename;
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
                const previewImage = document.getElementById("preview_image")
                previewImage.src = e.target.result
            }
            // reader가 이미지 읽도록 하기
            reader.readAsDataURL(input.files[0])
        }
    }
    // input file에 change 이벤트 부여
    const inputImage = document.getElementById("file1")
    inputImage.addEventListener("change", e => {
        readImage(e.target)
    })


    // 디테일 스크립터
    document.addEventListener("DOMContentLoaded", function ready() {
        var fileTarget = document.querySelector(".detailBox .file2-hidden");

            fileTarget.addEventListener("change", handleFiles, false);
            function handleFiles() {
                const fileList = this.files;
                var file2Length = document.getElementById("file2").files.length;

                console.log("file2 개수: " + fileList.length);

                if (fileList.length == 1) {
                    console.log(fileList.length);
                    var filename = fileList[0].name;
                    document.querySelector('.file2-name').value = filename;
                }
                else if (fileList.length != 1) {
                    var filename = "파일 " + fileList.length + "개";
                    document.querySelector('.file2-name').value = filename;
                }
            }
    });

</script>


</body>
</html>
