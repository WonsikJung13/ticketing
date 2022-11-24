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
            <form action="" method="post">

                <div class="mb-3">
                    <label for="" class="form-label">
                        이름
                    </label>

                    <div class="input-group">
                        <input class="form-control" type="text" name="customerName">
                    </div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        생년월일
                    </label>

                    <div class="input-group">
                        <input class="form-control" type="date" name="customerBirth">
                    </div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        아이디
                    </label>

                    <div class="input-group">
                        <input class="form-control" type="text" name="customerId">
                        <button class="btn btn-outline-secondary" type="button">중복확인</button>
                    </div>

                    <div class="form-text">어떤 메시지....</div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        비밀번호
                    </label>
                    <input class="form-control" type="password" name="customerPassword">
                    <div class="form-text">암호 확인 결과...</div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        비밀번호 확인
                    </label>
                    <input class="form-control" type="password">
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        이메일
                    </label>
                    <div class="input-group">
                        <input class="form-control" type="email" name="customerEmail">
                        <button class="btn btn-outline-secondary" type="button">중복확인</button>
                    </div>

                    <div class="form-text">확인 메시지....</div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        핸드폰 번호
                    </label>

                    <div class="input-group">
                        <input class="form-control" type="text" name="customerPhoneNumber">
                    </div>
                </div>

                <div class="mb-3">
                    <label for="" class="form-label">
                        주소
                    </label>

                    <div class="input-group">
                        <input class="form-control" type="text" name="customerAddress">
                    </div>
                </div>

                <input class="btn btn-primary" type="submit" value="가입">
            </form>
        </div>
    </div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>

</body>
</html>
