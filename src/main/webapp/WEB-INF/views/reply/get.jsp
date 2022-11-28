<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/11/28
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="container-md">
    <div class="row">
        <div class="col">

            <h1>${Reply.replyName} 게시물</h1>
            <div class="mb-3">
                <label class="form-label">
                    제목
                </label>
                <input class="form-control" type="text" value="${Reply.replyContent}" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    본문
                </label>
                <textarea class="form-control" readonly>${Reply.replyMainText}</textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    작성자
                </label>
                <input class="form-control" type="text" value="${Reply.replyName}" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    작성일시
                </label>
                <input class="form-control" type="datetime-local" value="${Reply.time}" readonly>
            </div>
        </div>
    </div>
</div>

<br>

<c:url value="/reply/modify" var="modifyLink">
    <c:param name="id" value="${Reply.replyId}"></c:param>
</c:url>

<c:url value="/reply/remove" var="removeLink">
    <c:param name="id" value="${Reply.replyId}"></c:param>
</c:url>

<form id="removeForm" action="${removeLink }" method="post">
    <input type="hidden" name="id" value="${Reply.replyId }">
</form>
<div>
    <a class = "btn btn-warning " href="${modifyLink}">수정하기</a>
    <input class="btn btn-warning" type="submit" value="삭제하기" data-bs-toggle="modal" data-bs-target="#removeModal">
</div>
<%--<a class = "btn btn-warning" href="${removeLink}">삭제하기</a>--%>

<!-- Modal -->
<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button id="removeConfirmButton" type="button" class="btn btn-danger">확인</button>
            </div>
        </div>
    </div>
</div>

<%--<hr>--%>

<%--<div id="replyMessageToast" class="toast align-items-center top-0 start-50 translate-middle-x position-fixed" role="alert" aria-live="assertive" aria-atomic="true">--%>
<%--    <div class="d-flex">--%>
<%--        <div id="replyMessage1" class="toast-body">--%>
<%--            Hello, world! This is a toast message.--%>
<%--        </div>--%>
<%--        <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<div class="container-md">--%>
<%--    <div class="row">--%>
<%--        <div class="col">--%>
<%--            <h3><i class="fa-solid fa-comments"></i></h3>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="row">--%>
<%--        <div class="col">--%>
<%--            &lt;%&ndash; 댓글 작성 &ndash;%&gt;--%>
<%--            <input type="hidden" id="boardId" value="${board.id}">--%>
<%--            <div class="input-group">--%>
<%--                <input type="text" class="form-control" id="replyInput1">--%>
<%--                <button class="btn btn-outline-secondary" id="replySendButton1"><i class="fa-solid fa-reply"></i></button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<div class="row mt-3">--%>
<%--    <div class="col">--%>
<%--        <div class="list-group" id="replyListContainer">--%>
<%--            &lt;%&ndash; 댓글 리스트 출력되는 곳 &ndash;%&gt;--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--&lt;%&ndash; 댓글 삭제 확인 모달 &ndash;%&gt;--%>
<%--<div class="modal fade" id="removeReplyConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h1 class="modal-title fs-5" id="exampleModalLabel">댓글 삭제 확인</h1>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                댓글을 삭제하시겠습니까?--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
<%--                <button type="button" data-bs-dismiss="modal" id="removeConfirmModalSubmitButton" class="btn btn-danger">삭제</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--&lt;%&ndash; 댓글 수정 모달 &ndash;%&gt;--%>
<%--<div class="modal fade" id="modifyReplyFormModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h1 class="modal-title fs-5">댓글 수정 양식</h1>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <input type="text" class="form-control" id="modifyReplyInput">--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
<%--                <button type="button" data-bs-dismiss="modal" id="modifyFormModalSubmitButton" class="btn btn-danger">수정</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<hr>--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>
    // 삭제확인 버튼 클릭하면 삭제 form 전송
    document.querySelector("#removeConfirmButton").addEventListener("click", function() {
        document.querySelector("#removeForm").submit();
    })

    const ctx = "${pageContext.request.contextPath}";

    // listReply();
    // 댓글 crud 메세지 토스트
    const toast = new bootstrap.Toast(document.querySelector("#replyMessageToast"));

    document.querySelector("#modifyFormModalSubmitButton").addEventListener("click", function() {
        const content = document.querySelector("#modifyReplyInput").value;
        const id = this.dataset.replyId;
        const data = {id, content};

        fetch(`\${ctx}/reply/modify`, {
            method : "put",
            headers : {
                "Content-Type" : "application/json"
            },
            body : JSON.stringify(data)
        })
            .then(res => res.json())
            .then(data => {
                document.querySelector("#replyMessage1").innerText = data.message;
                toast.show();
            })
            .then(() => listReply());
    });

    document.querySelector("#removeConfirmModalSubmitButton").addEventListener("click", function() {
        removeReply(this.dataset.replyId);
    });

    function readReplyAndSetModalForm(id) {
        fetch(`\${ctx}/reply/get/\${id}`)
            .then(res => res.json())
            .then(reply => {
                document.querySelector("#modifyReplyInput").value = reply.content;
            });
    }

    // function listReply() {
    //     const boardId = document.querySelector("#boardId").value;
    //     fetch(`\${ctx}/reply/list/\${boardId}`)
    //         .then(res => res.json())
    //         .then(list => {
    //             const replyListContainer = document.querySelector("#replyListContainer");
    //             replyListContainer.innerHTML = "";
    //
    //             for (const item of list) {
    //                 const modifyReplyButtonId = `modifyReplyButton\${item.id}`;
    //                 const removeReplyButtonId = `removeReplyButton\${item.id}`;
    //                 // console.log(item.id);
    //                 const replyDiv = `
    //                     <div class="list-group-item d-flex">
    //                         <div class="me-auto">
    //                             <div>
    //                                 \${item.content}
    //                             </div>
    //                                 <small class="text-muted">
	// 							        <i class="fa-regular fa-clock"></i>
    //                                     \${item.ago}
    //                                 </small>
    //                         </div>
    //                         <div>
    //                             <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modifyReplyFormModal" data-reply-id="\${item.id}" id="\${modifyReplyButtonId}">
    //                                 <i class="fa-solid fa-pen"></i>
    //                             </button>
    //                             <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#removeReplyConfirmModal" data-reply-id="\${item.id}" id="\${removeReplyButtonId}">
    //                                 <i class="fa-solid fa-x"></i>
    //                             </button>
    //                         </div>
    //                     </div>`;
    //                 replyListContainer.insertAdjacentHTML("beforeend", replyDiv);
    //                 // 수정 폼 모달에 댓글 내용 넣기
    //                 document.querySelector("#" + modifyReplyButtonId)
    //                     .addEventListener("click", function() {
    //                         document.querySelector("#modifyFormModalSubmitButton").setAttribute("data-reply-id", this.dataset.replyId);
    //                         readReplyAndSetModalForm(this.dataset.replyId);
    //                     });
    //                 // 삭제확인 버튼에 replyId 옮기기
    //                 document.querySelector("#" + removeReplyButtonId)
    //                     .addEventListener("click", function() {
    //                         // console.log(this.id + "번 삭제버튼 클릭됨");
    //                         console.log(this.dataset.replyId + "번 댓글 삭제할 예정, 모달 띄움")
    //                         document.querySelector("#removeConfirmModalSubmitButton").setAttribute("data-reply-id", this.dataset.replyId);
    //                         // removeReply(this.dataset.replyId);
    //                     });
    //             }
    //         });
    // }

    function removeReply(replyId) {
        // /reply/remove/{id}, method : "delete"
        fetch(ctx + "/reply/remove/" + replyId, {
            method: "delete"
        })
            .then(res => res.json())
            .then(data => {
                document.querySelector("#replyMessage1").innerText = data.message;
                toast.show();
            })
            .then(() => listReply());
    }

    // document.querySelector("#replySendButton1").addEventListener("click", function () {
    //     const boardId = document.querySelector("#boardId").value;
    //     const content = document.querySelector("#replyInput1").value;
    //
    //     const data = {
    //         boardId,
    //         content
    //     };
    //     fetch(`\${ctx}/reply/add`, {
    //         method : "POST",
    //         headers : {
    //             "Content-Type": "application/json"
    //         },
    //         body : JSON.stringify(data)
    //     })
    //         .then(res => res.json())
    //         .then(data => {
    //             document.querySelector("#replyInput1").value = "";
    //             document.querySelector("#replyMessage1").innerText = data.message
    //             toast.show();
    //         })
    //         .then(() => listReply())
    // });
</script>
</body>
</html>
