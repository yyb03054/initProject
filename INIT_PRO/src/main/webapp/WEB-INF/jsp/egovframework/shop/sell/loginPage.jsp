<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/login" method="post">

    <input type="text" name="loginId" placeholder="ID">

    <input type="password" name="loginPwd" placeholder="Password">

    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>

    <input name="remember-me" type="checkbox" />자동 로그인

    <button type="submit">로그인</button>
</form>


</body>
</html>