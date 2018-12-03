<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<c:if test="${msg==-1}">
    <script>alert('이메일 혹은 패스워드가 일치하지 않습니다.');</script>
</c:if>


<form method="post" name="login" action="/login">
    이메일  <input type="email" name="email" placeholder="gildong@gmail.com" value="${email}" required="required" maxlength="40"> <br>
    패스워드 <input type="password" name="password" placeholder="*******" value="${password}" required="required"><br>
    <input type="submit" value="로그인">
    <button onclick="location.href='/main'">취소</button>
</form>

</body>
</html>
