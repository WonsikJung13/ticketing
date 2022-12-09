<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<my:navBar active="get"/>
<div class="container-md">
    <div class="row">
        <div class="col">
            <c:if test="${not empty message }">
                <div class="alert alert-success">
                        ${message }
                </div>
            </c:if>

            <h1>회원 정보 수정하기</h1>


            <div class="mb-3">
                <label for="" class="form-label">
                    이름
                </label>
                <input class="form-control" type="text" value="${customer.customerName }" readonly>
            </div>
            <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#nameModal">
                이름 변경하기
            </button>

            <div class="mb-3">
                <label for="" class="form-label">
                    생년월일
                </label>
                <input class="form-control" type="date" value="${customer.customerBirth }" readonly>
            </div>
            <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#birthModal">
                생년월일 변경하기
            </button>

            <div class="mb-3">
                <label for="" class="form-label">
                    아이디
                </label>
                <input class="form-control" type="text" value="${customer.customerId }" readonly>
            </div>

            <div class="mb-3" class="form-label">
                <label for="" class="form-label">
                    비밀번호
                </label>
                <input class="form-control" type="password" value="${customer.customerPassword}" readonly>
            </div>
            <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#passwordModal">
                비밀번호 변경하기
            </button>

            <div class="mb-3">
                <label for="" class="form-label">
                    이메일
                </label>
                <div>
                    <input class="form-control" type="email" value="${customer.customerEmail }" readonly>
                </div>
            </div>

            <div class="mb-3">
                <label for="" class="form-label">
                    핸드폰 번호
                </label>
                <div>
                    <input class="form-control" type="text" value="${customer.customerPhoneNumber }" readonly>
                </div>

            </div>
            <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#phoneNumberModal">
                핸드폰 번호 변경하기
            </button>


            <div class="mb-3">
                <label for="" class="form-label">
                    주소
                </label>
                <form id="addressForm" action="addressModify" method="post">
                    <div class="input-group">
                        <input id="customerAddressInput" name="customerAddress" class="form-control" type="text" value="${customer.customerAddress }" readonly>
                        <input type="hidden" name="customerId" value="${customer.customerId}">
                        <input id="customerAddressButton" type="button" onClick="goPopup();" value="검색"/>
                    </div>
                </form>
            </div>
            <button id="modalConfirmAddressButton" type="button" class="btn btn-outline-secondary">
                주소 변경하기
            </button>


            <div class="mb-3">
                <label for="" class="form-label">
                    등급
                </label>
                <input class="form-control" type="text" value="${customer.customerGrade }" readonly>
            </div>

            <div class="mb-3" >
                <label for="" class="form-label">
                    가입일시
                </label>
                <input class="form-control" type="datetime-local" value="${customer.customerInserted}" readonly>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                <button id="exitButton" type="button" class="btn btn-warning">
                    나가기
                </button>
            </div>
            <br>
        </div>
    </div>
</div>

<%-- 이름 변경 모달창 --%>
<div class="modal fade" id="nameModal" tabindex="-1" aria-labelledby="nameModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="nameModalLabel">이름 변경하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="nameForm" action="nameModify" method="post">
                    <div class="mb-3">
                        <label for="" class="form-label">
                            이름
                        </label>
                        <input id="customerNameInput" class="form-control" type="text" name="customerName" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                        <div style="color: red" id="customerNameText" class="form-text"></div>
                        <input type="hidden" name="customerId" value="${customer.customerId}">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="modalConfirmNameButton" type="button" class="btn btn-primary">수정</button>
            </div>
        </div>
    </div>
</div>

<%-- 생년월일 변경 모달창 --%>
<div class="modal fade" id="birthModal" tabindex="-1" aria-labelledby="birthModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="birthModalLabel">생년월일 변경하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="birthForm" action="birthModify" method="post">
                    <div class="mb-3">
                        <label for="" class="form-label">
                            생년월일
                        </label>
                        <input id="customerBirthInput" class="form-control" type="date" name="customerBirth" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                        <div style="color: red" id="customerBirthText" class="form-text"></div>
                        <input type="hidden" name="customerId" value="${customer.customerId}">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="modalConfirmBirthButton" type="button" class="btn btn-primary">수정</button>
            </div>
        </div>
    </div>
</div>

<%-- 비밀번호 변경 모달창 --%>
<div class="modal fade" id="passwordModal" tabindex="-1" aria-labelledby="passwordModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="passwordModalLabel">비밀번호 변경하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="passwordForm" action="passwordModify" method="post">
                    <div class="mb-3">
                        <label for="" class="form-label">
                            비밀번호
                        </label>
                        <input id="customerPasswordInput1" class="form-control" type="password" name="customerPassword" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                        <div style="color: red" id="customerPasswordText1" class="form-text"></div>
                        <input type="hidden" name="customerId" value="${customer.customerId}">
                    </div>
                </form>

                <div class="mb-3">
                    <label for="" class="form-label">
                        비밀번호 확인
                    </label>
                    <input id="customerPasswordInput2" class="form-control" type="password" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                    <div style="color: red" id="customerPasswordText2" class="form-text"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="modalConfirmPasswordButton" type="button" class="btn btn-primary">수정</button>
            </div>
        </div>
    </div>
</div>

<%-- 핸드폰 번호 변경 모달창 --%>
<div class="modal fade" id="phoneNumberModal" tabindex="-1" aria-labelledby="phoneNumberModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="phoneNumberModalLabel">핸드폰 번호 변경하기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="phoneNumberForm" action="phoneNumberModify" method="post">
                    <div class="mb-3">
                        <label for="" class="form-label">
                            핸드폰 번호
                        </label>
                        <input id="customerPhoneNumberInput" class="form-control" type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="customerPhoneNumber"
                               placeholder="010 부터 숫자만 입력 (ex. 01011112222)" maxlength="11" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                        <div style="color: red" id="customerPhoneNumberText" class="form-text"></div>
                        <input type="hidden" name="customerId" value="${customer.customerId}">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="modalConfirmPhoneNumberButton" type="button" class="btn btn-primary">수정</button>
            </div>
        </div>
    </div>
</div>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>

<script>
    const ctx = "${pageContext.request.contextPath}";

    let checkedPassword = false;
    let checkedPassword1 = false;
    let checkedPassword2 = false;
    let checkedPhoneNumber = false;
    let checkedAddress = false;
    let checkedName = false;
    let checkedBirth = false;

    document.querySelector("#modalConfirmNameButton").addEventListener("click", function() {
        if (checkedName) {
            document.getElementById('nameForm').submit();
        } else if (checkedName == false) {
            customerNameText.innerText = "이름을 작성해주세요"
            document.getElementById("customerNameInput").focus();
        }

    })

    document.querySelector("#modalConfirmBirthButton").addEventListener("click", function() {
        if (checkedBirth) {
            document.getElementById('birthForm').submit();
        } else if (checkedBirth == false) {
            customerBirthText.innerText = "생년월일을 입력해주세요"
            document.getElementById("customerBirthInput").focus();
        }

    })

    document.querySelector("#modalConfirmPasswordButton").addEventListener("click", function(e) {
        e.preventDefault();

        if (checkedPassword && checkedPassword1 && checkedPassword2) {
            document.getElementById('passwordForm').submit();
        } else if (checkedPassword1 == false) {
            customerPasswordText1.innerText = "비밀번호를 작성해주세요"
            document.getElementById("customerPasswordInput1").focus();
        } else if (checkedPassword2 == false) {
            customerPasswordText2.innerText = "비밀번호를 한번 더 작성해주세요"
            document.getElementById("customerPasswordInput2").focus();
        } else if (checkedPassword == false) {
            customerPasswordText2.innerText = "비밀번호가 일치하지 않습니다"
            document.getElementById("customerPasswordInput2").focus();
        }
    })

    document.querySelector("#modalConfirmPhoneNumberButton").addEventListener("click", function() {
        if (checkedPhoneNumber) {
            document.getElementById('phoneNumberForm').submit();
        } else if (checkedPhoneNumber == false) {
            customerPhoneNumberText.innerText = "핸드폰 번호를 작성해주세요"
            document.getElementById("customerPhoneNumberInput").focus();
        }
    })

    document.querySelector("#modalConfirmAddressButton").addEventListener("click", function() {
        document.getElementById('addressForm').submit();

    })

    document.querySelector("#exitButton").addEventListener("click", function() {
        window.location.href = "/";
    })


    // input 값이 모두 입력되었는지 확인
    const customerPasswordInput1 = document.querySelector("#customerPasswordInput1");
    const customerPasswordInput2 = document.querySelector("#customerPasswordInput2");
    const customerPhoneNumberInput = document.querySelector("#customerPhoneNumberInput");
    const customerAddressInput = document.querySelector("#customerAddressInput");
    const customerNameInput = document.querySelector("#customerNameInput");
    const customerBirthInput = document.querySelector("#customerBirthInput");

    const customerPasswordText1 = document.querySelector("#customerPasswordText1");
    const customerPasswordText2 = document.querySelector("#customerPasswordText2");
    const customerPhoneNumberText = document.querySelector("#customerPhoneNumberText");
    const customerAddressText = document.querySelector("#customerAddressText");
    const customerNameText = document.querySelector("#customerNameText");
    const customerBirthText = document.querySelector("#customerBirthText");

    function matchName() {
        checkedName = false;

        const name = customerNameInput.value;

        if (name == "") {
            customerNameText.innerText = "이름을 작성해주세요"
            customerNameText.setAttribute("style", "color:red");
        } else {
            customerNameText.innerText = ""
            checkedName = true;
        }
    }

    document.querySelector("#customerNameInput").addEventListener("keyup", matchName);

    function matchBirth() {
        checkedBirth = false;

        const birth = customerBirthInput.value;

        if (birth == "") {
            customerBirthText.innerText = "생년월일을 입력해주세요"
            customerBirthText.setAttribute("style", "color:red");
        } else {
            customerBirthText.innerText = ""
            checkedBirth = true;
        }
    }

    document.querySelector("#customerBirthInput").addEventListener("change", matchBirth);

    // 비밀번호 일치하는지 확인
    function matchPassword() {
        checkedPassword = false;

        const samePassword1 = customerPasswordInput1.value;
        const samePassword2 = customerPasswordInput2.value;

        if (samePassword1 == samePassword2) {
            customerPasswordText2.innerText = "비밀번호가 일치합니다"
            customerPasswordText2.removeAttribute("style");
            checkedPassword = true;
        } else {
            customerPasswordText2.innerText = "비밀번호가 일치하지 않습니다"
            customerPasswordText2.setAttribute("style", "color:red");
        }
    }

    document.querySelector("#customerPasswordInput1").addEventListener("keyup", matchPassword);
    document.querySelector("#customerPasswordInput2").addEventListener("keyup", matchPassword);

    function matchPassword1() {

        checkedPassword1 = false;

        const password1 = customerPasswordInput1.value;

        if (password1 == "") {
            customerPasswordText1.innerText = "비밀번호를 작성해주세요"
            customerPasswordText1.setAttribute("style", "color:red");
            customerPasswordText2.innerText = ""
        } else {
            customerPasswordText1.innerText = ""
            checkedPassword1 = true;
        }
    }

    document.querySelector("#customerPasswordInput1").addEventListener("keyup", matchPassword1);

    function matchPassword2() {
        checkedPassword2 = false;

        const password2 = customerPasswordInput2.value;

        if (password2 == "") {
            customerPasswordText2.innerText = "비밀번호를 한번 더 작성해주세요"
            customerPasswordText2.setAttribute("style", "color:red");
        } else {
            checkedPassword2 = true;
        }
    }

    document.querySelector("#customerPasswordInput2").addEventListener("keyup", matchPassword2);

    function matchPhoneNumber() {
        checkedPhoneNumber = false;

        const phoneNumber = customerPhoneNumberInput.value;

        if (phoneNumber == "") {
            customerPhoneNumberText.innerText = "핸드폰 번호를 작성해주세요"
            customerPhoneNumberText.setAttribute("style", "color:red");
        } else {
            customerPhoneNumberText.innerText = ""
            checkedPhoneNumber = true;
        }
    }

    document.querySelector("#customerPhoneNumberInput").addEventListener("keyup", matchPhoneNumber);

    function matchAddress() {
        checkedAddress = false;

        const address = document.form.customerAddressInput.value;

        if (address == "") {
            customerAddressText.innerText = "주소를 입력해주세요"
            customerAddressText.setAttribute("style", "color:red");
        } else {
            customerAddressText.innerText = ""
            checkedAddress = true;
        }
    }

    function noSpaceForm(obj) { // 공백사용못하게
        var str_space = /\s/;  // 공백체크
        if(str_space.exec(obj.value)) { //공백 체크
            //alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
            obj.focus();
            obj.value = obj.value.replace(/\s| /gi,''); // 공백제거
            return false;
        }
    }

    function goPopup(){
        // 주소검색을 수행할 팝업 페이지를 호출합니다.
        // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
        var pop = window.open("/customer/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");

        // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
    }

    function jusoCallBack(customerAddressInput){
        // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
        document.querySelector("#customerAddressInput").value = customerAddressInput;
    }

    var now_utc = Date.now() // 지금 날짜를 밀리초로
    // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
    var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
    // new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
    var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    document.getElementById("customerBirthInput").setAttribute("max", today);

</script>


</body>
</html>
