<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<div class="container-md">
    <div class="row">
        <div class="col">
            <h1>회원가입 하기</h1>
            <form action="" method="post" id="formId">

                <div class="mb-3">
                    <label for="" class="form-label">
                        이름
                    </label>

                    <div class="input-group">
                        <input id="customerNameInput" class="form-control" type="text" name="customerName" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                    </div>

                    <div style="color: red" id="customerNameText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        생년월일
                    </label>

                    <div class="input-group">
                        <input id="customerBirthInput" class="form-control" type="date" name="customerBirth" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                    </div>

                    <div style="color: red" id="customerBirthText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        아이디
                    </label>

                    <div class="input-group">
                        <input id="customerIdInput" class="form-control" type="text" name="customerId" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                        <button id="customerIdButton" class="btn btn-outline-secondary" type="button">중복확인</button>
                    </div>

                    <div style="color: red" id="customerIdText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        비밀번호
                    </label>
                    <input id="customerPasswordInput1" class="form-control" type="password" name="customerPassword" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                    <div style="color: red" id="customerPasswordText1" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        비밀번호 확인
                    </label>
                    <input id="customerPasswordInput2" class="form-control" type="password" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                    <div style="color: red" id="customerPasswordText2" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        이메일
                    </label>
                    <div class="input-group">
                        <input id="customerEmailInput" class="form-control" type="email" name="customerEmail" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                        <button id="customerEmailButton" class="btn btn-outline-secondary" type="button">중복확인</button>
                    </div>

                    <div style="color: red" id="customerEmailText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        핸드폰 번호
                    </label>

                    <div class="input-group">
                        <input id="customerPhoneNumberInput" class="form-control" type="text" name="customerPhoneNumber"
                               placeholder="숫자만 입력" maxlength="11" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                    </div>

                    <div style="color: red" id="customerPhoneNumberText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        주소
                    </label>

                    <div class="input-group">
                        <input id="customerAddressInput" class="form-control" type="text" name="customerAddress" onkeyup="noSpaceForm(this)" onchange="noSpaceForm(this)">
                    </div>

                    <div style="color: red" id="customerAddressText" class="form-text"></div>
                </div>

                <input id="submitButton" class="btn btn-primary" type="submit" value="가입" >
            </form>
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
        const insertCustomerEmail = document.querySelector("#customerEmailInput").value;

        fetch(ctx + "/customer/checkEmail/" + insertCustomerEmail)
            .then(res => res.json())
            .then(data => {
                document.querySelector("#customerEmailText").innerText = data.message;

                if (data.statusEmail == "not exist") {
                    customerEmailText.removeAttribute("style");
                    checkedDoubleEmail = true;
                }
            })
    })

    // 3-1. 아이디, 이메일, 패스워드 중복확인 + 모든 input값 입력해야 가입 가능
    document.querySelector("#submitButton").addEventListener("click", function (e) {
        e.preventDefault();


        if (checkedId && checkedDoubleId && checkedDoubleEmail && checkedEmail && checkedPassword && checkedPassword1 && checkedPassword2 && checkedName && checkedBirth && checkedPhoneNumber && checkedAddress) {
            document.getElementById('formId').submit();
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

        console.log(samePassword1)
        console.log(samePassword2)
        console.log("------------")


        if (samePassword1 == samePassword2) {
            customerPasswordText2.innerText = "비밀번호가 일치합니다"
            customerPasswordText2.removeAttribute("style");
            checkedPassword = true;
        } else {
            customerPasswordText2.innerText = "비밀번호가 일치하지 않습니다"
            customerPasswordText2.setAttribute("style", "color:red");
        }
    }

    function matchPassword22() {
        checkedPassword = false;

        const samePassword1 = customerPasswordInput1.value;
        const samePassword2 = customerPasswordInput2.value;

        console.log(samePassword1)
        console.log(samePassword2)
        console.log("------------")

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
    document.querySelector("#customerPasswordInput2").addEventListener("keyup", matchPassword22);

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
        } else {
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
            customerPasswordText2.innerText = ""
            checkedPassword2 = true;
        }
    }

    document.querySelector("#customerPasswordInput2").addEventListener("keyup", matchPassword2);

    function matchEmail() {
        checkedEmail = false;

        const email = customerEmailInput.value;

        if (email == "") {
            customerEmailText.innerText = "이메일을 작성해주세요"
        } else {
            customerEmailText.innerText = ""
            checkedEmail = true;
        }
    }

    document.querySelector("#customerEmailInput").addEventListener("keyup", matchEmail);

    function matchPhoneNumber() {
        checkedPhoneNumber = false;

        const phoneNumber = customerPhoneNumberInput.value;

        if (phoneNumber == "") {
            customerPhoneNumberText.innerText = "핸드폰 번호를 작성해주세요"
        } else {
            customerPhoneNumberText.innerText = ""
            checkedPhoneNumber = true;
        }
    }

    document.querySelector("#customerPhoneNumberInput").addEventListener("keyup", matchPhoneNumber);

    function matchAddress() {
        checkedAddress = false;

        const address = customerAddressInput.value;

        if (address == "") {
            customerAddressText.innerText = "주소를 작성해주세요"
        } else {
            customerAddressText.innerText = ""
            checkedAddress = true;
        }
    }

    document.querySelector("#customerAddressInput").addEventListener("keyup", matchAddress);

    function noSpaceForm(obj) { // 공백사용못하게
        var str_space = /\s/;  // 공백체크
        if(str_space.exec(obj.value)) { //공백 체크
            //alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
            obj.focus();
            obj.value = obj.value.replace(/\s| /gi,''); // 공백제거
            return false;
        }
    }


</script>

</body>
</html>
