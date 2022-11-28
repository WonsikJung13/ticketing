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
                        <input id="customerNameInput" class="form-control" type="text" name="customerName">
                    </div>

                    <div style="color: red" id="customerNameText" class="form-text">이름을 작성해주세요</div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        생년월일
                    </label>

                    <div class="input-group">
                        <input id="customerBirthInput" class="form-control" type="date" name="customerBirth">
                    </div>

                    <div style="color: red" id="customerBirthText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        아이디
                    </label>

                    <div class="input-group">
                        <input id="customerIdInput" class="form-control" type="text" name="customerId">
                        <button id="customerIdButton" class="btn btn-outline-secondary" type="button">중복확인</button>
                    </div>

                    <div style="color: red" id="customerIdText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        비밀번호
                    </label>
                    <input id="customerPasswordInput1" class="form-control" type="password" name="customerPassword">
                    <div style="color: red" id="customerPasswordText1" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        비밀번호 확인
                    </label>
                    <input id="customerPasswordInput2" class="form-control" type="password">
                    <div style="color: red" id="customerPasswordText2" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        이메일
                    </label>
                    <div class="input-group">
                        <input id="customerEmailInput" class="form-control" type="email" name="customerEmail">
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
                               value="" placeholder="숫자만 입력" autocomplete="off">
                    </div>

                    <div style="color: red" id="customerPhoneNumberText" class="form-text"></div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        주소
                    </label>

                    <div class="input-group">
                        <input id="customerAddressInput" class="form-control" type="text" name="customerAddress">
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
        checkedId = false;
        const insertCustomerId = document.querySelector("#customerIdInput").value;

        fetch(ctx + "/customer/checkId/" + insertCustomerId)
            .then(res => res.json())
            .then(data => {
                document.querySelector("#customerIdText").innerText = data.message;

                if (data.statusId == "not exist") {
                    customerIdText.removeAttribute("style");
                    checkedId = true;
                }
            })
    })

    // 2. 이메일 중복 확인
    document.querySelector("#customerEmailButton").addEventListener("click", function () {
        checkedEmail = false;
        const insertCustomerEmail = document.querySelector("#customerEmailInput").value;

        fetch(ctx + "/customer/checkEmail/" + insertCustomerEmail)
            .then(res => res.json())
            .then(data => {
                document.querySelector("#customerEmailText").innerText = data.message;

                if (data.statusEmail == "not exist") {
                    customerEmailText.removeAttribute("style");
                    checkedEmail = true;
                }
            })
    })

    // 3-1. 아이디, 이메일, 패스워드 중복확인 + 모든 input값 입력해야 가입 가능
    document.querySelector("#submitButton").addEventListener("click", function (e) {
        e.preventDefault();

        if (checkedId && checkedEmail && checkedPassword && checkedName && checkedBirth && checkedPhoneNumber && checkedAddress) {
            document.getElementById('formId').submit();
        } else {
            if (checkedId == false) {
                alert("아이디 중복확인 해주세요")
            } else if (checkedEmail == false) {
                alert("이메일 중복확인 해주세요")
            } else if (checkedPassword == false) {
                alert("패스워드가 일치하지 않습니다")
            }
        }
    })

    // 3-2. 아이디 수정하고 다시 중복확인 해야 가입 가능
    document.querySelector("#customerIdInput").addEventListener("keyup", function () {
        checkedId = false;

    })

    // 3-3. 이메일 수정하고 다시 중복확인 해야 가입 가능
    document.querySelector("#customerEmailInput").addEventListener("keyup", function () {
        checkedEmail = false;
    })

    // 4. 비밀번호 일치하는지 확인
    const customerPasswordInput1 = document.querySelector("#customerPasswordInput1");
    const customerPasswordInput2 = document.querySelector("#customerPasswordInput2");
    const customerPasswordText = document.querySelector("#customerPasswordText1");

    function matchPassword() {
        checkedPassword = false;

        const samePassword1 = customerPasswordInput1.value;
        const samePassword2 = customerPasswordInput2.value;

        if (samePassword1 == samePassword2) {
            customerPasswordText.innerText = "패스워드가 일치합니다"
            customerPasswordText.removeAttribute("style");
            checkedPassword = true;
        } else {
            customerPasswordText.innerText = "패스워드가 일치하지 않습니다"
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
            checkedName = true;
        } else {
            customerNameText.innerText = ""
        }
    }

    document.querySelector("#customerNameInput").addEventListener("keyup", matchName);

    function matchBirth() {
        checkedBirth = false;

        const birth = customerBirthInput.value;

        if (birth == "") {
            customerBirthText.innerText = "생년월일을 선택해주세요"
            checkedBirth = true;
        } else {
            customerBirthText.innerText = ""
        }
    }

    document.querySelector("#customerBirthInput").addEventListener("keyup", matchBirth);

    function matchId() {
        checkedId = false;

        const id = customerIdInput.value;

        if (id == "") {
            customerIdText.innerText = "아이디를 작성해주세요"
            checkedId = true;
        } else {
            customerIdText.innerText = ""
        }
    }

    document.querySelector("#customerIdInput").addEventListener("keyup", matchId);

    function matchPassword1() {
        checkedPassword1 = false;

        const password1 = customerPasswordInput1.value;

        if (password1 == "") {
            customerPasswordText1.innerText = "패스워드를 작성해주세요"
            checkedPassword1 = true;
        } else {
            customerPasswordText1.innerText = ""
        }
    }

    document.querySelector("#customerPasswordInput1").addEventListener("keyup", matchPassword1);

    function matchPassword2() {
        checkedPassword2 = false;

        const password2 = customerPasswordInput2.value;

        if (password2 == "") {
            customerPasswordText2.innerText = "패스워드를 한번 더 작성해주세요"
            checkedPassword2 = true;
        } else {
            customerPasswordText2.innerText = ""
        }
    }

    document.querySelector("#customerPasswordInput2").addEventListener("keyup", matchPassword2);

    function matchEmail() {
        checkedEmail = false;

        const email = customerEmailInput.value;

        if (email == "") {
            customerEmailText.innerText = "이메일을 작성해주세요"
            checkedEmail = true;
        } else {
            customerEmailText.innerText = ""
        }
    }

    document.querySelector("#customerEmailInput").addEventListener("keyup", matchEmail);

    function matchPhoneNumber() {
        checkedPhoneNumber = false;

        const phoneNumber = customerPhoneNumberInput.value;

        if (phoneNumber == "") {
            customerPhoneNumberText.innerText = "핸드폰 번호를 작성해주세요"
            checkedPhoneNumber = true;
        } else {
            customerPhoneNumberText.innerText = ""
        }
    }

    document.querySelector("#customerPhoneNumberText").addEventListener("keyup", matchPhoneNumber);

    function matchAddress() {
        checkedAddress = false;

        const address = customerAddressInput.value;

        if (address == "") {
            customerAddressText.innerText = "주소를 작성해주세요"
            checkedAddress = true;
        } else {
            customerAddressText.innerText = ""
        }
    }

    document.querySelector("#customerAddressText").addEventListener("keyup", matchAddress);

    // function checkForm() {
    //     console.log("------------------------------------------")
    //
    //     if (customerNameInput == "") {
    //         // customerNameInput.focus();
    //         customerNameText.innerText = "이름을 입력해주세요";
    //         return false;
    //     } else {
    //         customerNameText.innerText = "";
    //     }
    //     // else if (!customerBirthInput == "") {
    //     //     customerBirthText.innerText = "생년월일을 선택해주세요"
    //     // }
    //     if (customerIdInput == "") {
    //         customerIdText.innerText = "아이디를 입력해주세요";
    //
    //     }
    //
    //     if (!customerPasswordInput1 == "") {
    //         customerPasswordText1.innerText = "비밀번호를 입력해주세요";
    //
    //     }
    //
    //     if (!customerPasswordInput2 == "") {
    //         customerPasswordText2.innerText = "비밀번호를 한번 더 입력해주세요";
    //
    //     }
    //
    //     if (!customerEmailInput == "") {
    //         customerEmailText.innerText = "이메일을 입력해주세요";
    //
    //     }
    //
    //     if (!customerPhoneNumberInput == "") {
    //         customerPhoneNumberText.innerText = "핸드폰 번호를 입력해주세요";
    //
    //     }
    //
    //     if (!customerAddressInput == "") {
    //         customerAddressText.innerText = "주소를 입력해주세요";
    //
    //     }
    //     // else if (checkedId == false) {
    //     //     alert("아이디 중복확인 해주세요")
    //     // } else if (checkedEmail == false) {
    //     //     alert("이메일 중복확인 해주세요")
    //     // } else if (checkedPassword == false) {
    //     //     alert("패스워드가 일치하지 않습니다")
    //     // }
    //
    //
    //     if (checkedId && checkedEmail && checkedPassword) {
    //         document.getElementById('formId').submit();
    //     }
    // }

</script>

</body>
</html>
