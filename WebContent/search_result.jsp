<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	${keyword} : Note 검색결과<br/>
	<c:forEach var="note" items="${notes}">
		${note}<br />
	</c:forEach>
</div>

<div>
	${keyword} : Schedule 검색결과<br/>
	<c:forEach var="schedule" items="${schedules}">
		${schedule}<br />
	</c:forEach>
</div>

<div>
	${keyword} : Memo 검색결과<br/>
	<c:forEach var="memo" items="${memos}">
		${memo}<br />
	</c:forEach>
</div>
</body>
</html>