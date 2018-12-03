<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>메인</title>
</head>
<body>
<c:if test="${sessionScope.member != null}">
    ${sessionScope.member.nickname}님 어서오세요. <a href="/logout">로그아웃</a>
</c:if>
<c:if test="${sessionScope.member == null}">
    <a href="/login">로그인</a>
    <a href="/signUp">회원가입</a>
</c:if>
</body>
</html>