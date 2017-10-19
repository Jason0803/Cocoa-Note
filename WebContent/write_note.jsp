<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="DispatcherServlet" method="post">
<input type="text" name="title" />
<textarea rows="10" cols="50" name="content"></textarea>
<input type="submit" value="작성"/>
<input type="hidden" name="command" value="writeNote" />
</form>
</body>
</html>