<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cocoa calender</title>
<c:if test="${param.year==null}">
	<script type="text/javascript">
		var path = "index.jsp";
		<c:if test="${today!=null}">
			var year = ${today.year};
			var month = ${today.month};
			var path = "DispatcherServlet?command=cal&year="+year"+&month="+month;
		</c:if>
		location.href=path;
	</script>
</c:if>
<style type="text/css">
table {
	width:70%;
}
td {
	text-align:center;
	border: 1px solid black;
	width:14.28%;
	vertical-align:top;
	height:100px;
}
.date {
	width:100%;
	background:pink;
	display:inline-block;
}

.span-note {
	display:inline-block;
}
</style>
</head>
<body>
${param.year}년 ${param.month}월<br />
<table>
<thead>
	<tr>
		<th>일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th>토</th>
	</tr>
</thead>
<tbody>
<tr>
<c:forEach var="day" items="${monthlyDiary}" varStatus="column">
	<td>
		<span class="date">${day.date.date}</span><br/>
		<c:forEach var="note" items="${day.notes}">
			<span class="span-note">${note.title}</span>
		</c:forEach>
	</td>
	<c:if test="${column.count%7==0}">
	</tr>
	<tr>
	</c:if>
</c:forEach>
</tr>
</tbody>
</table>
<a href="updateMember.jsp">회원정보수정</a>
<a href="write_note.jsp">글쓰기테스트</a>
</body>
</html>