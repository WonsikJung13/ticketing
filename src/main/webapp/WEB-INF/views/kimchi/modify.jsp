<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/12/13
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.*" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<my:sideBar/>
<form id="contentRegisterForm" action="" method="post" enctype="multipart/form-data">
    <div class="container-fluid">
        <main class="tm-main">
            <h1 class="pt-2 tm-color-primary tm-post-title">${kimchi.contentName} 수정</h1>
            <div class="row tm-row">
                <br>

                <%-- Poster 이미지 출력 --%>
                <div class="mb-4">
                    <div class="col-2 d-flex justify-content-center align-items-center">
                        <%-- 삭제여부 체크박스 --%>
                        <div class="custom-check form-check form-switch text-danger">
                            <input name="removePosterName" value="${kimchi.contentPosterName}" class="form-check-input"
                                   type="checkbox" role="switch" id="flexSwitchCheckChecked">
                            <label class="form-check-label" for="flexSwitchCheckChecked"><i
                                    class="fa-regular fa-trash-can"></i></label>
                        </div>
                    </div>
                    <div class="col-10">
                        <img src="${imgUrl}/${kimchi.contentId}/${kimchi.contentPosterName}"
                             alt="">
                    </div>
                    <div class="posterBox">
                        <label for="" class="form-label">포스터</label>
                        <input type="file" accept="image/*" class="form-control" name="addPosterFile"
                               id="addPosterFile">
                    </div>
                    <hr class="tm-hr-primary tm-mb-45">
                </div>


            </div>
            <div class="row tm-row">
                <div class="col-lg-8 tm-post-col">
                    <div class="tm-post-full">
                        <div class="mb-4">
                            <h2 class="pt-2 tm-color-primary tm-post-title">${kimchi.contentName}</h2>
                            <input type="text" name="contentName" placeholder="${kimchi.contentName}">
                            <p class="tm-mb-40">${kimchi.time}</p>
                            <p class="tm-mb-40">작성자</p>
                            <hr class="mb-3 tm-hr-primary">
                            <h2 class="tm-mb-40 tm-post-title tm-color-primary">Related Posts</h2>
                            <figcaption class="tm-color-primary">기간</figcaption>
                            <p>${kimchi.contentStartDate} ~ ${kimchi.contentEndDate}</p>
                            <figcaption class="tm-color-primary">가격</figcaption>
                            <p>${kimchi.contentPrice}원</p>
                            <input type="number" name="contentPrice" placeholder="${kimchi.contentPrice}">
                            <hr class="tm-hr-primary tm-mb-45">
                            <div class="DetailBox">
                                <label for="" class="form-label">세부내용</label>
                                <input multiple type="file" accept="image/*" class="form-control" name="addDetailFiles">
                            </div>
                            <%-- Detail 이미지 출력 --%>
                            <div>
                                <c:forEach items="${kimchi.contentDetailName}" var="contentDetailName"
                                           varStatus="status">
                                    <div class="row">
                                        <div class="col-2 d-flex justify-content-center align-items-center">
                                                <%-- 삭제여부 체크박스 --%>
                                            <div class="custom-check form-check form-switch text-danger">
                                                <input name="removeDetailNames" value="${contentDetailName}"
                                                       class="form-check-input" type="checkbox" role="switch"
                                                       id="flexSwitchCheckChecked${status.count}">
                                                <label class="form-check-label"
                                                       for="flexSwitchCheckChecked${status.count}"><i
                                                        class="fa-regular fa-trash-can"></i></label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <img width="200" class="img-fluid img-thumbnail"
                                                 src="${imgUrl}/${kimchi.contentId}/${URLEncoder.encode(contentDetailName, 'utf-8')}"
                                                 alt="">
                                        </div>
                                    </div>
                                    <hr class="tm-hr-primary tm-mb-45">
                                </c:forEach>
                            </div>
                            <p>
                                ${kimchi.contentBoard}
                                <textarea name="contentBoard" placeholder="${kimchi.contentBoard}"></textarea>
                            </p>
                        </div>
                        <hr class="tm-hr-primary tm-mb-45">
                        <h2 class="mb-4 tm-post-title tm-color-primary">위치</h2>
                        <p>${kimchi.contentAddress}</p>
                        <p>${kimchi.contentAddrDetail}</p>
                        <hr class="tm-hr-primary tm-mb-55">
                    </div>
                    <input type="submit" value="수정" data-bs-toggle="modal" data-bs-target="#modifyModal">
                </div>
                <%--                <aside class="col-lg-4 tm-aside-col">--%>
                <%--                    <div class="tm-post-sidebar">--%>
                <%--                        <hr class="mb-3 tm-hr-primary">--%>
                <%--                        <h2 class="tm-mb-40 tm-post-title tm-color-primary">Related Posts</h2>--%>
                <%--                        <figcaption class="tm-color-primary">기간</figcaption>--%>
                <%--                        <p>${kimchi.contentStartDate} ~ ${kimchi.contentEndDate}</p>--%>
                <%--                        <figcaption class="tm-color-primary">가격</figcaption>--%>
                <%--                        <p>${kimchi.contentPrice}원</p>--%>
                <%--                    </div>--%>
                <%--                    <hr class="mb-3 tm-hr-primary">--%>
                <%--                </aside>--%>
            </div>
            <footer class="row tm-row">
                <div class="col-md-6 col-12 tm-color-gray">
                    Design: <a rel="nofollow" target="_parent" href="https://templatemo.com" class="tm-external-link">TemplateMo</a>
                </div>
                <div class="col-md-6 col-12 tm-color-gray tm-copyright">
                    Copyright 2020 Xtra Blog Company Co. Ltd.
                </div>
            </footer>
        </main>
    </div>
</form>


<!-- Modal -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">수정 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                수정하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="modifyConfirmButton">확인</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>
    document.querySelector("#modifyConfirmButton").addEventListener("click", function () {
        document.querySelector("#modifyForm").submit();
    });

    if (document.querySelector("#addPosterFile").value != "") {
        console.log("input file")
        document.querySelector("#flexSwitchCheckChecked").checked = true;
    }
</script>
</body>
</html>
