<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
</style>

<%-- authorize tag --%>
<%-- spring security expressions, 책 673,674 --%>


<c:url value="/admin/customerList" var="adminLink"/>
<c:url value="/admin/customerManage" var="manageLink"/>
<c:url value="/reply/list" var="replyLink"/>
<c:url value="/customer/signup" var="signupLink"/>
<c:url value="/customer/get" var="getLink"/>
<c:url value="/content/list" var="contentLink"/>

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
                <li class="nav-item">
                    <a class="nav-link ${active eq 'customerList' ? 'active' : '' }" href="${adminLink }">어드민</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${active eq 'customerManage' ? 'active' : '' }" href="${manageLink }">회원관리</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${active eq 'signup' ? 'active' : '' }" href="${signupLink}">회원가입</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${active eq 'get' ? 'active' : '' }" href="${getLink }">내 정보</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${active eq 'reply' ? 'active' : '' }" href="${replyLink }">후기 목록</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${active eq 'content' ? 'active' : '' }" href="${contentLink }">콘텐츠 목록</a>
                </li>

            </ul>
        </div>
    </div>
</nav>
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






