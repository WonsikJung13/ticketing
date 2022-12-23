<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/12/01
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Which</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <%
        //request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
        //request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
        String inputYn = request.getParameter("inputYn");
        String roadFullAddr = request.getParameter("roadFullAddr");
        String roadAddrPart1 = request.getParameter("roadAddrPart1");
        String roadAddrPart2 = request.getParameter("roadAddrPart2");
        String engAddr = request.getParameter("engAddr");
        String jibunAddr = request.getParameter("jibunAddr");
        String zipNo = request.getParameter("zipNo");
        String addrDetail = request.getParameter("addrDetail");
        String admCd = request.getParameter("admCd");
        String rnMgtSn = request.getParameter("rnMgtSn");
        String bdMgtSn = request.getParameter("bdMgtSn");
        String detBdNmList = request.getParameter("detBdNmList");
        String bdNm = request.getParameter("bdNm");
        String bdKdcd = request.getParameter("bdKdcd");
        String siNm = request.getParameter("siNm");
        String sggNm = request.getParameter("sggNm");
        String emdNm = request.getParameter("emdNm");
        String liNm = request.getParameter("liNm");
        String rn = request.getParameter("rn");
        String udrtYn = request.getParameter("udrtYn");
        String buldMnnm = request.getParameter("buldMnnm");
        String buldSlno = request.getParameter("buldSlno");
        String mtYn = request.getParameter("mtYn");
        String lnbrMnnm = request.getParameter("lnbrMnnm");
        String lnbrSlno = request.getParameter("lnbrSlno");
        String emdNo = request.getParameter("emdNo");
        String entX = request.getParameter("entX");
        String entY = request.getParameter("entY");
    %>
</head>
<script language="javascript">
    function init() {
        var url = location.href;
        var confmKey = "U01TX0FVVEgyMDIyMTIwMTEyMDg1NzExMzI4NDY=";//승인키
        var resultType = "4"; // 도로명주소 검색결과 화면 출력유형, 1 : 도로명, 2 : 도로명+지번, 3 : 도로명+상세건물명, 4 : 도로명+지번+상세건물명
        var inputYn = "<%=inputYn%>";
        if (inputYn != "Y") {
            document.form.confmKey.value = confmKey;
            document.form.returnUrl.value = url;
            document.form.resultType.value = resultType;
            document.form.action = "https://business.juso.go.kr/addrlink/addrCoordUrl.do"; // 인터넷망
            document.form.submit();
        } else {
            opener.jusoCallBack("<%=roadFullAddr%>", "<%=roadAddrPart1%>", "<%=addrDetail%>", "<%=roadAddrPart2%>", "<%=engAddr%>"
                , "<%=jibunAddr%>", "<%=zipNo%>", "<%=admCd%>", "<%=rnMgtSn%>", "<%=bdMgtSn%>", "<%=detBdNmList%>"
                , "<%=bdNm%>", "<%=bdKdcd%>", "<%=siNm%>", "<%=sggNm%>", "<%=emdNm%>", "<%=liNm%>", "<%=rn%>", "<%=udrtYn%>"
                , "<%=buldMnnm%>", "<%=buldSlno%>", "<%=mtYn%>", "<%=lnbrMnnm%>", "<%=lnbrSlno%>", "<%=emdNo%>", "<%=entX%>", "<%=entY%>");
            window.close();
        }
    }
</script>
<body onload="init();">

<form id="form" name="form" method="post">
    <input type="hidden" id="confmKey" name="confmKey" value=""/>
    <input type="hidden" id="returnUrl" name="returnUrl" value=""/>
    <input type="hidden" id="resultType" name="resultType" value=""/>
    <!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
    <!--
    <input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
     -->
    <!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
</form>
</body>
</html>
