<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	특정 날짜 : ${dayInfo.date.year}년 ${dayInfo.date.month}월 ${dayInfo.date.date}일
	<c:forEach var = "schedule" items="${dayInfo.schedules}">
	일정명 : ${schedule.title}
	일정 기간 : ${schedule.startDate.year}.${schedule.startDate.month}.${schedule.startDate.date}
				~${schedule.endDate.year}.${schedule.endDate.month}.${schedule.endDate.date}
	일정 내용 : ${schedule.content}
	</c:forEach>
	
	<c:forEach var="note" items="${dayInfo.notes}">
	노트 제목 : <a href = DispatcherServlet?command=noteView&diaryNo=${note.no}>${note.title}</a>
	</c:forEach>
	
</body>
</html>