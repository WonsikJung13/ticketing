<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<body>
<my:sideBar/>
<body>
<h1>limdaram team</h1>
    <div class="row tm-row tm-mb-60 tm-main">
        <div class="col-12">
            <hr class="tm-hr-primary tm-mb-55">
        </div>
        <%--    JWS--%>
        <div class="col-lg-6 tm-mb-60 tm-person-col">
            <div class="media tm-person">
                <img src="/JWS.png" width="200" height="300" class="img-fluid mr-4">
                <div class="media-body">
                    <h2 class="tm-color-primary tm-post-title mb-2">PB</h2>
                    <h3 class="tm-h3 mb-3">PB</h3>
                    <p class="mb-0 tm-line-height-short">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aliquam aut deleniti, distinctio
                        error excepturi expedita, fugiat incidunt labore laboriosam molestias, neque nostrum porro quod
                        ratione sapiente sequi similique totam?
                    </p>
                </div>
            </div>
        </div>
        <%--    LSG--%>
        <div class="col-lg-6 tm-mb-60 tm-person-col">
            <div class="media tm-person">
                <img src="/LSG.png" width="230" height="330" class="img-fluid">
                <div class="media-body">
                    <h2 class="tm-color-primary tm-post-title mb-2">SSUNG</h2>
                    <h3 class="tm-h3 mb-3">SSUNG</h3>
                    <p class="mb-0 tm-line-height-short">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aliquam aut deleniti, distinctio
                        error excepturi expedita, fugiat incidunt labore laboriosam molestias, neque nostrum porro quod
                        ratione sapiente sequi similique totam?
                    </p>
                </div>
            </div>
        </div>
        <%--    LCE--%>
        <div class="col-lg-6 tm-mb-60 tm-person-col">
            <div class="media tm-person">
                <img src="/LCE.png" width="200" height="300" class="img-fluid mr-4">
                <div class="media-body">
                    <h2 class="tm-color-primary tm-post-title mb-2">LDR</h2>
                    <h3 class="tm-h3 mb-3">LDR</h3>
                    <p class="mb-0 tm-line-height-short">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aliquam aut deleniti, distinctio
                        error excepturi expedita, fugiat incidunt labore laboriosam molestias, neque nostrum porro quod
                        ratione sapiente sequi similique totam?
                    </p>
                </div>
            </div>
        </div>
        <%--    HHJ--%>
        <div class="col-lg-6 tm-mb-60 tm-person-col">
            <div class="media tm-person">
                <img src="/HHJ.png" width="140" height="240" class="img-fluid mr-3 ml-5">
                <div class="media-body ml-4">
                    <h2 class="tm-color-primary tm-post-title mb-2">Kimchi</h2>
                    <h3 class="tm-h3 mb-3">Kimchi</h3>
                    <p class="mb-0 tm-line-height-short">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias aliquam aut deleniti, distinctio
                        error excepturi expedita, fugiat incidunt labore laboriosam molestias, neque nostrum porro quod
                        ratione sapiente sequi similique totam?
                    </p>
                </div>
            </div>
        </div>
    </div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>