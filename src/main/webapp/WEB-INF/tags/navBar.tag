<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ attribute name="active" %>

<style>
    #searchTypeSelect {
        width: auto;
    }
</style>

<%-- authorize tag --%>
<%-- spring security expressions, 책 673,674 --%>


<c:url value="/admin/customerList" var="adminLink"/>
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
                    <a class="nav-link ${active eq 'admin' ? 'active' : '' }" href="${adminLink }">어드민</a>
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







