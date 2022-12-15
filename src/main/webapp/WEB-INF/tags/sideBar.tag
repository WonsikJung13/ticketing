<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ attribute name="active" %>

<link rel="stylesheet" href="../css/all.min.css"> <!-- https://fontawesome.com/ -->
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
<!-- https://fonts.google.com/ -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/templatemo-xtra-blog.css" rel="stylesheet">

<style>
    .effect-lily img{
        opacity: 100;
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

    .tm-post-link-inner{
        background: none;
    }

    /*글씨체*/
    @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }
</style>

<header class="tm-header" id="tm-header">
    <div class="tm-header-wrapper">
        <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div style="margin-bottom: auto" class="tm-site-header">
            <div class="mb-3 mx-auto tm-site-logo"><img src="/oo.ico"/></div>
            <h1 class="text-center">LimDaRam</h1>
        </div>
        <div>
            <div style="margin-bottom: 30px" class="tm-mb-65">
                <div>
                    <sec:authentication property="name" var="username"/>
                        <p style="color:white; margin-bottom: 0px; margin-top: 30px">
                            <i class="fa-regular fa-face-grin-wide"></i>
                            ${username}님
                        </p>
                        <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                            <a style="color: white" class="font-weight-light" href="/customer/get?customerId=${username}">내정보</a> |
                            <a style="color: white" href="/logout">로그아웃</a>
                        </div>
                </div>
            </div>
        </div>
        <nav class="tm-nav" id="tm-nav">
            <ul>
                <li class="tm-nav-item">
                    <a href="/content/list" class="tm-nav-link">
                        <i class="fas fa-home"></i>
                        Blog Home
                    </a>
                </li>
                <sec:authentication property="name" var="username"/>
                <c:if test="${'admin' == username}">
                    <li class="tm-nav-item">
                        <a href="/content/register" class="tm-nav-link">
                            <i class="fas fa-pen"></i>
                            게시물 작성
                        </a>
                    </li>
                </c:if>
                <li class="tm-nav-item">
                    <a href="/admin/about" class="tm-nav-link">
                        <i class="fas fa-users"></i>
                        About
                    </a>
                </li>
                <li class="tm-nav-item">
                    <a href="http://pf.kakao.com/_WAlfxj/chat" class="tm-nav-link">
                        <i class="fa-solid fa-comment"></i>
                        문의하기
                    </a>
                </li>
            </ul>
        </nav>










        <%-- github --%>
        <div class="tm-mb-65">
            <%-- JWS --%>
            <a href="https://github.com/WonsikJung13" target="_blank" class="tm-social-link">
                <div>
                    <i class="fa-regular fa-face-meh-blank"></i>
                    <div style="font-family: LINESeedKR-Bd; font-size: 15px; color: white">JWS</div>
                </div>
            </a>
            <%-- LSG --%>
            <a href="https://github.com/gmlrmrtjd" target="_blank" class="tm-social-link">
                <div>
                    <i class="fa-regular fa-face-rolling-eyes"></i>
                    <div style="font-family: LINESeedKR-Bd; font-size: 15px; color: white">LSG</div>
                </div>
            </a>
            <%-- LCE --%>
            <a href="https://github.com/Limdaram" target="_blank" class="tm-social-link">
                <div>
                    <i class="fa-regular fa-face-laugh-beam"></i>
                    <div style="font-family: LINESeedKR-Bd; font-size: 15px; color: white">LCE</div>
                </div>
            </a>
            <%-- HHJ --%>
            <a href="https://github.com/ha971206" target="_blank" class="tm-social-link">
                <div>
                    <i class="fa-regular fa-face-surprise"></i>
                    <div style="font-family: LINESeedKR-Bd; font-size: 15px; color: white">HHJ</div>
                </div>
            </a>
        </div>
        <p class="tm-mb-80 pr-5 text-white">
            Xtra Blog is a multi-purpose HTML template from TemplateMo website. Left side is a sticky menu bar. Right side content will scroll up and down.
        </p>
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

<script src="../js/jquery.min.js"></script>
<script src="../js/templatemo-script.js"></script>