<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
<form method="post" name="signUp" onsubmit="return checkForm()" action="/signUp">
    이메일  <input type="email" name="email" placeholder="gildong@gmail.com" required="required" maxlength="40"> <br>
    닉네임  <input type="text" placeholder="홍길동" name="nickname" required="required" maxlength="20"> <br>
    패스워드 <input type="password" name="password" placeholder="*******" required="required"><br>
    패스워드 확인 <input type="password" name="checkPassowrd" placeholder="*******" required="required"><br>
    <div id="checkPwd">동일한 암호를 입력하세요.</div><br>
    <input type="submit">
    <button onclick="location.href='/main'">취소</button>
</form>


<script language="javascript">
    function checkForm() {
        if (document.signUp.password.value != document.signUp.checkPassowrd.value) {
            document.getElementById('checkPwd').style.color = "red";
            document.getElementById('checkPwd').innerHTML = "일치하지 않습니다.";
            return false;
        }
    }
</script>
</body>
</html>
