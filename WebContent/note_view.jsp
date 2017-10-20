<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${note.title} <br/>
작성 : ${note.writeDate.year}-${note.writeDate.month}-${note.writeDate.date} / 최종수정 : ${note.currentDate.year}-${note.currentDate.month}-${note.currentDate.date}<br />
${note.content}
</body>
</html>