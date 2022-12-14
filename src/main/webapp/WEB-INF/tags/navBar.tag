<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ attribute name="active" %>

<style>
    #searchTypeSelect {
        width: auto;
    }
    #myBtn {
        display: none; /* Hidden by default */
        position: fixed; /* Fixed/sticky position */
        bottom: 20px; /* Place the button at the bottom of the page */
        right: 30px; /* Place the button 30px from the right */
        z-index: 99; /* Make sure it does not overlap */
        border: none; /* Remove borders */
        outline: none; /* Remove outline */
        background-color: red; /* Set a background color */
        color: white; /* Text color */
        cursor: pointer; /* Add a mouse pointer on hover */
        padding: 15px; /* Some padding */
        border-radius: 10px; /* Rounded corners */
        font-size: 18px; /* Increase font size */
    }

    #myBtn:hover {
        background-color: #555; /* Add a dark-grey background on hover */
    }

    .font25{
        font-size: 25px;
    }

    .apple{
        font-size: 25px;
        margin-right: 15px;
    }
    
    .mar100 {
        margin-right: 110px;
    }

    .mar10{
        margin-right: 10px;
    }
</style>

<%-- authorize tag --%>
<%-- spring security expressions, 책 673,674 --%>

<<<<<<<<< Temporary merge branch 1
<sec:authorize access="isAuthenticated()" var="loggedIn" />

=========
<c:url value="/" var="indexLink"/>
>>>>>>>>> Temporary merge branch 2
<c:url value="/admin/customerList" var="adminLink"/>
<c:url value="/admin/customerManage" var="manageLink"/>
<c:url value="/reply/list" var="replyLink"/>
<c:url value="https://blog.naver.com/limdaram-ing" var="blogLink"/>

<c:url value="/customer/signup" var="signupLink"/>
<sec:authentication property="name" var="user"/>
<c:url value="/customer/get" var="getLink">
    <c:param name="customerId" value="${user}"/>
</c:url>
<c:url value="/member/login" var="loginLink"/>
<c:url value="/logout" var="logoutLink"/>

<nav class="navbar navbar-expand-md bg-light mb-3">
    <div class="container-md">
<%--        <a class="navbar-brand" href="${listLink }">--%>

<%--        </a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"--%>
<%--                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto">
<<<<<<<<< Temporary merge branch 1

                <sec:authorize access="hasAuthority('admin')">
                    <li class="nav-item">
                        <a class="nav-link ${active eq 'customerList' ? 'active' : '' }" href="${adminLink }">어드민</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link ${active eq 'customerManage' ? 'active' : '' }" href="${manageLink }">회원관리</a>
                    </li>
                </sec:authorize>

                <c:if test="${not loggedIn}">
                    <li class="nav-item">
                        <a class="nav-link ${active eq 'signup' ? 'active' : '' }" href="${signupLink}">회원가입</a>
                    </li>
                </c:if>

                <c:if test="${loggedIn}">
                    <li class="nav-item">
                        <a class="nav-link ${active eq 'get' ? 'active' : '' }" href="${getLink }">내 정보</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link ${active eq 'reply' ? 'active' : '' }" href="${replyLink }">후기 목록</a>
                    </li>
                </c:if>
=========
                <li class="nav-item">
                    <a class="nav-link ${active eq 'contentList' ? 'active' : '' } apple" href="${indexLink }">
<%--                        <i class="fa-brands fa-apple"></i>--%>
                        <img src="/images/oo.ico"/>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${active eq 'customerList' ? 'active' : '' } font25" href="${adminLink }">어드민</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${active eq 'customerManage' ? 'active' : '' } font25" href="${manageLink }">회원관리</a>
                </li>

                <li class="nav-item position-absolute top-50 end-0 translate-middle-y mar10">
                    <a class="nav-link ${active eq 'signup' ? 'active' : '' } font25" href="${signupLink}">회원가입</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${active eq 'get' ? 'active' : '' } font25" href="${getLink }">내 정보</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${active eq 'get' ? 'active' : '' } font25" href="${blogLink }">파워블로거</a>
                </li>
>>>>>>>>> Temporary merge branch 2

                <li class="nav-item">
                    <a class="nav-link ${active eq 'reply' ? 'active' : '' } font25" href="${replyLink }">후기 목록</a>
                </li>

<<<<<<<<< Temporary merge branch 1
                <c:if test="${not loggedIn}">
                    <li class="nav-item">
                        <a class="nav-link ${active eq 'login' ? 'active' : '' }" href="${loginLink }">로그인</a>
                    </li>
                </c:if>

                <c:if test="${loggedIn}">
                    <li class="nav-item">
                        <a class="nav-link ${active eq 'logout' ? 'active' : '' }" href="${logoutLink }">로그아웃</a>
                    </li>
                </c:if>
=========
                <li class="nav-item position-absolute top-50 end-0 translate-middle-y mar100">
                    <a class="nav-link ${active eq 'login' ? 'active' : '' } font25" href="${loginLink }">로그인</a>
                </li>
>>>>>>>>> Temporary merge branch 2

            </ul>
        </div>
    </div>
</nav>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">메인 페이지</h1>
            <p class="lead fw-normal text-white-50 mb-0">일 지 도 ?</p>
        </div>
    </div>
</header>
<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<script>
    // Get the button:
    let mybutton = document.getElementById("myBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {scrollFunction()};


    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
        } else {
            mybutton.style.display = "none";
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }

</script>






