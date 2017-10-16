<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to cocoaNOTE</title>
</head>
<body>
<form action="DispatcherServlet">
Sign in<br />
<input type="text" id="id" placeholder="아이디(email)"/><br />
<input type="password" id="password" placeholder="password" /><br />


<input type="submit" value="로그인"/>
<input type="hidden" id="command" value="login" />
</form>
</body>
</html>