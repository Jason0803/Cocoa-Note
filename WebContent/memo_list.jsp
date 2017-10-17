<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div {
	border: 1px solid black;
	width:15%;
}
</style>
</head>
<body>
<c:forEach var="memo" items="${memos}">
	<div class="memo">${memo.content}<br /> ${memo.writeDate}</div>
</c:forEach>
</body>
</html>