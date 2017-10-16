<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="DispatcherServlet">
Sign up<br />
<input type="text" id="id" placeholder="아이디(email)"/><br />
<input type="password" id="password" placeholder="password" /><br />
<input type="password" id="password_chk" placeholder="password check" /><br />
<input type="text" id="name" placeholder="이름" /><br />
<input type="submit" value="가입"/>
<input type="hidden" id="command" value="register" />
</form>
</body>
</html>