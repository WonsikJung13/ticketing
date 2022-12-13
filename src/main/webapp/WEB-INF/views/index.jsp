<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>타이틀</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="src/main/resources/assets/favicon.ico"/>
    <!-- Bootstrap icons-->
    <link href="src/main/resources/css/styles.css" rel="stylesheet"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="src/main/resources/css/styles.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<my:navBar/>
<!-- Header-->
<%--<header class="bg-dark py-5">--%>
<%--    <div class="container px-4 px-lg-5 my-5">--%>
<%--        <div class="text-center text-white">--%>
<%--            <h1 class="display-4 fw-bolder">index</h1>--%>
<%--            <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</header>--%>
<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

            <c:forEach items="${contentlist}" var="content">
                <c:url value="/content/indexGet" var="getLink">
                    <c:param name="contentId" value="${content.contentId}"></c:param>
                </c:url>
                <div class="col mb-5 " onclick="location.href='${getLink}';">
                    <div class="card h-100 silverHover">
                        <!-- Product image-->
<%--                        <a href="${getLink}" title="상세정보 이동">--%>
                            <img class="card-img-top" src="/images/${content.contentId}/${content.contentPosterName}"
                                 alt=""/>
<%--                        </a>--%>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">
                                            ${content.contentName}
                                </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="src/main/resources/js/scripts.js"></script>
</body>
</html>
