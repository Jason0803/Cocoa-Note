<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to cocoaNOTE</title>
</head>
<body>
<form action="DispatcherServlet">
Log in<br />
<input type="text" name="id" placeholder="아이디(email)" required="required"/><br />
<input type="password" name="password" placeholder="password" required="required" /><br />


<input type="submit" value="로그인"/>
<c:if test="${param.login==false}">회원정보가 일치하지 않습니다.</c:if>
<input type="hidden" name="command" value="login" />
</form>
</body>
</html>