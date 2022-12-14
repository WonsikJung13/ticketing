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
    <style>
        body {
            background-image: url("/back.jpg");
        }
    </style>
</head>
<body class="align-middle">


<div class="container-fluid d-flex justify-content-center">
    <div class="row">
        <h1 style="color: antiquewhite">회원가입</h1>
        <div class="col card align-self-center" style="border: white 5px solid">
            <form action="" method="post" id="formId" name="form">

                <div class="mb-3">
                    <label for="" class="form-label" style="margin-top: 30px">
                        이름
                    </label>

                    <div class="input-group">
                        <input id="customerNameInput" class="form-control" type="text" name="customerName"
                               onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                    </div>

                    <div style="color: red" id="customerNameText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        생년월일
                    </label>

                    <div class="input-group">
                        <input id="customerBirthInput" class="form-control" type="date" name="customerBirth"
                               onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                    </div>

                    <div style="color: red" id="customerBirthText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        아이디
                    </label>

                    <div class="input-group">
                        <input id="customerIdInput" class="form-control" type="text" name="customerId"
                               onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                        <button id="customerIdButton" class="btn btn-outline-secondary" type="button">중복확인</button>
                    </div>

                    <div style="color: red" id="customerIdText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        비밀번호
                    </label>
                    <input id="customerPasswordInput1" class="form-control" type="password" name="customerPassword"
                           onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                    <div style="color: red" id="customerPasswordText1" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        비밀번호 확인
                    </label>
                    <input id="customerPasswordInput2" class="form-control" type="password" onkeyup="noSpaceForm(this)"
                           onchange="noSpaceForm(this)">
                    <div style="color: red" id="customerPasswordText2" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        이메일
                    </label>
                    <div class="input-group">
                        <input id="customerEmailInput" class="form-control" type="email" name="customerEmail" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                        <button id="customerEmailButton" disabled class="btn btn-outline-secondary" type="button">중복확인</button>
                        <button id="emailAuthenticationButton" disabled type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#emailModal">이메일 인증하기</button>
                    </div>
                    <div style="color: red" id="customerEmailText" class="form-text"></div>
                </div>
                <div class="mb-3">
                    <label for="" class="form-label">
                        핸드폰 번호
                    </label>

                    <div class="input-group">
                        <input id="customerPhoneNumberInput" class="form-control" type="text"
                               onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="customerPhoneNumber"
                               placeholder="010 부터 숫자만 입력  (ex. 01011112222)" maxlength="11" onkeyup="noSpaceForm(this)"
                               onchange="noSpaceForm(this)">
                    </div>

                    <div style="color: red" id="customerPhoneNumberText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        주소
                    </label>

                    <div class="input-group">
                        <input id="customerAddressInput" readonly class="form-control" type="text"
                               name="customerAddress">
                        <input id="customerAddressButton" class="btn btn-outline-secondary" type="button"
                               onClick="goPopup();" value="검색"/>
                    </div>
                    <div style="color: red" id="customerAddressText" class="form-text"></div>
                </div>

                <input type="hidden" name="social" value="false">

                <input id="submitButton" class="btn btn-primary" type="submit" value="가입" style="margin-bottom: 30px">

            </form>
        </div>
    </div>
</div>

<!-- email Modal -->
<div class="modal fade" id="emailModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">인증코드 입력</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input id="agreementEmailInput" type="text" class="form-control" maxlength="8" >
                <div style="color: red" id="agreementEmailText" class="form-text"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button id="agreementEmailButton" disabled type="button" class="btn btn-primary" data-bs-dismiss="modal">인증하기</button>
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

    let checkedDoubleId = false;
    let checkedDoubleEmail = false;
    let checkedId = false;
    let checkedEmail = false;
    let checkedPassword = false;
    let checkedName = false;
    let checkedBirth = false;
    let checkedPassword1 = false;
    let checkedPassword2 = false;
    let checkedPhoneNumber = false;
    let checkedAddress = false;
    let checkedEmailAuthentication = false;

    // 1. 아이디 중복 확인
    document.querySelector("#customerIdButton").addEventListener("click", function () {
        checkedDoubleId = false;
        const insertCustomerId = document.querySelector("#customerIdInput").value;

        fetch(ctx + "/customer/checkId/" + insertCustomerId)
            .then(res => res.json())
            .then(data => {
                document.querySelector("#customerIdText").innerText = data.message;

                if (data.statusId == "not exist") {
                    customerIdText.removeAttribute("style");
                    checkedDoubleId = true;
                }
            })
    })

    // 2. 이메일 중복 확인
    document.querySelector("#customerEmailButton").addEventListener("click", function () {
        checkedDoubleEmail = false;
        checkedEmailAuthentication == false
        const insertCustomerEmail = document.querySelector("#customerEmailInput").value;

        fetch(ctx + "/customer/checkEmail/" + insertCustomerEmail)
            .then(res => res.json())
            .then(data => {
                document.querySelector("#customerEmailText").innerText = data.message;

                if (data.statusEmail == "not exist") {
                    customerEmailText.removeAttribute("style");
                    document.getElementById("emailAuthenticationButton").removeAttribute("disabled");
                    checkedDoubleEmail = true;
                    // checkedEmailAuthentication = true;

                }
            })
    })

    // 이메일 인증하기
    document.querySelector("#emailAuthenticationButton").addEventListener("click", function () {
        checkedEmailAuthentication == false
        const customerEmail = document.querySelector("#customerEmailInput").value;
        fetch(ctx + "/customer/emailConfirm/", {
            method : "POST",
            headers : {
                "Content-Type" : "application/json"
            },
            body : JSON.stringify({customerEmail})

        })
    })

    // 이메일 모달 인증확인
    document.querySelector("#agreementEmailInput").addEventListener("keyup", function () {
        checkedEmailAuthentication = false;
        noSpaceForm(this);

        const agreementEmailInput = document.querySelector("#agreementEmailInput").value;

        fetch(ctx + "/customer/verifyCode/", {
            method : "POST",
            headers : {
                "Content-Type" : "application/json"
            },
            body : JSON.stringify({agreementEmailInput})
        })
            .then(res => res.json())
            .then(result => {
                document.querySelector("#agreementEmailText").innerText = document.getElementById("agreementEmailText");
                    if (result == 1) {
                        document.getElementById("agreementEmailText").innerText = "인증 성공!"
                        document.getElementById("agreementEmailText").removeAttribute("style");
                        document.getElementById("agreementEmailButton").removeAttribute("disabled");

                    } else {
                        document.getElementById("agreementEmailText").innerText = "인증 실패 - 인증코드를 다시 확인해주세요"
                        document.getElementById("agreementEmailText").setAttribute("style", "color:red");
                    }
            })
    })

    // 이메일 모달창 인증확인 눌렀을 때
    document.querySelector("#agreementEmailButton").addEventListener("click", function () {
        customerEmailText.innerText = ""
        checkedEmailAuthentication = true;
    })


    // 3-1. 아이디, 이메일, 패스워드 중복확인 + 모든 input값 입력해야 가입 가능
    document.querySelector("#submitButton").addEventListener("click", function (e) {
        matchAddress();
        e.preventDefault();

        if (checkedId && checkedDoubleId && checkedDoubleEmail && checkedEmail && checkedPassword && checkedPassword1 && checkedPassword2 && checkedName && checkedBirth && checkedPhoneNumber && checkedAddress && checkedEmailAuthentication) {
            document.getElementById('formId').submit();
            alert("가입에 성공했습니다. 환영합니다!")
        } else {
            if (checkedName == false) {
                customerNameText.innerText = "이름을 작성해주세요"
                document.getElementById("customerNameInput").focus();
            } else if (checkedBirth == false) {
                customerBirthText.innerText = "생년월일을 선택해주세요"
                document.getElementById("customerBirthInput").focus();
            } else if (checkedId == false) {
                customerIdText.innerText = "아이디를 작성해주세요"
                document.getElementById("customerIdInput").focus();
            } else if (checkedDoubleId == false) {
                customerIdText.innerText = "아이디 중복확인 해주세요"
                document.getElementById("customerIdInput").focus();
            } else if (checkedPassword1 == false) {
                customerPasswordText1.innerText = "비밀번호를 작성해주세요"
                document.getElementById("customerPasswordInput1").focus();
            } else if (checkedPassword2 == false) {
                customerPasswordText2.innerText = "비밀번호를 한번 더 작성해주세요"
                document.getElementById("customerPasswordInput2").focus();
            } else if (checkedPassword == false) {
                customerPasswordText2.innerText = "비밀번호가 일치하지 않습니다"
                document.getElementById("customerPasswordInput2").focus();
            } else if (checkedEmail == false) {
                customerEmailText.innerText = "이메일을 작성해주세요"
                document.getElementById("customerEmailInput").focus();
            } else if (checkedDoubleEmail == false) {
                customerEmailText.innerText = "이메일 중복확인 해주세요"
                document.getElementById("customerEmailInput").focus();
            } else if (checkedPhoneNumber == false) {
                customerPhoneNumberText.innerText = "핸드폰 번호를 입력해주세요"
                document.getElementById("customerPhoneNumberInput").focus();
            } else if (checkedAddress == false) {
                customerAddressText.innerText = "주소를 입력해주세요"
                document.getElementById("customerAddressInput").focus();
            } else if (checkedEmailAuthentication == false) {
                document.getElementById("customerEmailText").setAttribute("style", "color:red");
                document.getElementById("customerEmailInput").focus();
            }
        }
    })

    // 4. 비밀번호 일치하는지 확인
    const customerPasswordInput1 = document.querySelector("#customerPasswordInput1");
    const customerPasswordInput2 = document.querySelector("#customerPasswordInput2");

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

    // 5. input 값이 모두 입력되었는지 확인
    const customerNameInput = document.querySelector("#customerNameInput");
    const customerBirthInput = document.querySelector("#customerBirthInput");
    const customerIdInput = document.querySelector("#customerIdInput");
    const customerEmailInput = document.querySelector("#customerEmailInput");
    const customerPhoneNumberInput = document.querySelector("#customerPhoneNumberInput");
    const customerAddressInput = document.querySelector("#customerAddressInput");

    const customerNameText = document.querySelector("#customerNameText");
    const customerBirthText = document.querySelector("#customerBirthText");
    const customerIdText = document.querySelector("#customerIdText");
    const customerPasswordText1 = document.querySelector("#customerPasswordText1");
    const customerPasswordText2 = document.querySelector("#customerPasswordText2");
    const customerEmailText = document.querySelector("#customerEmailText");
    const customerPhoneNumberText = document.querySelector("#customerPhoneNumberText");
    const customerAddressText = document.querySelector("#customerAddressText");

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
            customerBirthText.innerText = "생년월일을 선택해주세요"
            customerBirthText.setAttribute("style", "color:red");
        } else {
            customerBirthText.innerText = ""
            checkedBirth = true;
        }
    }

    document.querySelector("#customerBirthInput").addEventListener("change", matchBirth);

    function matchId() {
        checkedId = false;

        const id = customerIdInput.value;

        if (id == "") {
            customerIdText.innerText = "아이디를 작성해주세요"
            customerIdText.setAttribute("style", "color:red");
        } else {
            checkedDoubleId = false;
            customerIdText.innerText = ""
            checkedId = true;
        }
    }

    document.querySelector("#customerIdInput").addEventListener("keyup", matchId);


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


    function matchEmail() {
        checkedEmail = false;

        const email = customerEmailInput.value;
        const emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        const emailButtonAbled = document.querySelector("#customerEmailButton");

        if (email == "") {
            customerEmailText.innerText = "이메일을 작성해주세요"
            customerEmailText.setAttribute("style", "color:red");
            document.getElementById("emailAuthenticationButton").setAttribute("disabled", "");
            emailButtonAbled.setAttribute("disabled", "");
        } else if (!emailRule.test(email)) {
            customerEmailText.innerText = "이메일 형식에 맞게 작성해주세요"
            customerEmailText.setAttribute("style", "color:red");
            document.getElementById("emailAuthenticationButton").setAttribute("disabled", "");
            emailButtonAbled.setAttribute("disabled", "");
        } else {
            checkedDoubleEmail = false;
            customerEmailText.innerText = ""
            emailButtonAbled.removeAttribute("disabled");
            document.getElementById("emailAuthenticationButton").setAttribute("disabled", "");
            checkedEmail = true;
        }
    }


    document.querySelector("#customerEmailInput").addEventListener("keyup", matchEmail);

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

    // document.querySelector("#customerAddressInput").addEventListener("keyup", matchAddress);

    function noSpaceForm(obj) { // 공백사용못하게
        var str_space = /\s/;  // 공백체크
        if (str_space.exec(obj.value)) { //공백 체크
            //alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
            obj.focus();
            obj.value = obj.value.replace(/\s| /gi, ''); // 공백제거
            return false;
        }
    }

    function goPopup() {
        // 주소검색을 수행할 팝업 페이지를 호출합니다.
        // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
        var pop = window.open("/customer/jusoPopup", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");

        // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
        //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
    }

    function jusoCallBack(customerAddressInput) {
        console.log(customerAddressInput)
        // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
        document.form.customerAddressInput.value = customerAddressInput;

    }

    var now_utc = Date.now() // 지금 날짜를 밀리초로
    // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
    var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
    // new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
    var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
    document.getElementById("customerBirthInput").setAttribute("max", today);


</script>

</body>
</html>
