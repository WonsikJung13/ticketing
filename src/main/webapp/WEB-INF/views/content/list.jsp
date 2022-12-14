<%--
  Created by IntelliJ IDEA.
  User: sunggyu-lim
  Date: 2022/11/24
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>상품 목록</title>
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
          crossorigin="anonymous">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<%--Alert--%>
<script>
  // function alert();

<%--function alert(${message}) {--%>
<%--<c:if test="${not empty message}">--%>
<%--  <div class="alert alert-success">--%>
<%--      ${message}--%>
<%--  </div>--%>
<%--  setTimeout(alert, 500);--%>
<%--</c:if>--%>
// }
</script>
  <div class="contentAllList">
<%--    <div class="tab">--%>
<%--      <div><a href="javascript:Sort('1')"><img src="http://ticketimage.interpark.com/TicketImage/main/100506_sub/image/mt_btn_01.gif" alt="금일랭킹순"></a><a href="javascript:Sort('2')"><img src="http://ticketimage.interpark.com/TicketImage/main/100506_sub/image/mt_btn_02.gif" alt="주간랭킹순"></a><a href="javascript:Sort('3')"><img src="http://ticketimage.interpark.com/TicketImage/main/100506_sub/image/mt_btn_03.gif" alt="월간랭킹순"></a><a href="javascript:Sort('4')"><img src="http://ticketimage.interpark.com/TicketImage/main/100506_sub/image/mt_btn_04_on.gif" alt="상품명순"></a><a href="javascript:Sort('5')"><img src="http://ticketimage.interpark.com/TicketImage/main/100506_sub/image/mt_btn_05.gif" alt="공연종료임박순"></a></div>--%>
<%--      <div class="RK_total2"> <span class="Rkper">총 140개</span>의 상품이 있습니다. </div>--%>
<%--    </div>--%>
  <p>총 ${contentDto.countContent} 개의 상품이 있습니다.</p>
    <div class="container-md">
      <div class="stit">
        <table border="0" cellpadding="0" cellspacing="0" class="table table-bordered align-middle">
          <caption>상품 목록</caption>
          <thead class="table-light">
          <tr>
            <th colspan="2">상품명</th>
            <th width="140">장소</th>
            <th width="80">시작</th>
            <th width="80">종료</th>
            <th width="120">가격</th>
          </tr>
          </thead>
          <tbody>
            <c:forEach items="${contentList}" var="content">
              <tr>
                <td class="contentImage">
                  <c:url value="/content/get" var="getLink">
                    <c:param name="contentId" value="${content.contentId}"></c:param>
                  </c:url>
                  <a href="${getLink}" title="상세정보 이동">
                    <img width="100" src="${imgUrl}/${content.contentId}/${content.contentPosterName}" alt="썸네일">
                  </a>
                </td>
                <td class="contentName">
                  <span class="fw_bold">
                      <a href="${getLink}">
                          ${content.contentName}
                      </a>
                  </span><br>
                </td>
                <td class="contentRegion">${content.contentRegion}</td>
                <td class="contentStartDate">${content.contentStartDate}</td>
                <td class="contentStartDate">${content.contentEndDate}</td>
                <td class="contentPrice">${content.contentPrice}</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
          crossorigin="anonymous"></script>
</body>
</html>
