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
			var path = "DispatcherServlet?command=cal&year="+year+"&month="+month;
		</c:if>
		location.href=path;
	</script>
</c:if>
<script type="text/javascript">
	function prevMonth() {
		var year = ${param.year};
		var month = ${param.month};
		if(month==1){
			year -= 1;
			month = 12;
		} else month -= 1;
		location.href="DispatcherServlet?command=cal&year="+year+"&month="+month;
	}
	function nextMonth() {
		var year = ${param.year};
		var month = ${param.month};
		if(month==12){
			year += 1;
			month = 1;
		} else month +=1;
		location.href="DispatcherServlet?command=cal&year="+year+"&month="+month;
	}
</script>
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

.sam {
	position: fixed;
	bottom: 0;
	width: 100%;
	height: 50px;
	background-color: silver;
	text-align:center;

}
</style>
</head>
<body>
<a href="DispatcherServlet?command=cal&year=${today.year}&month=${today.month}">캘린더</a><br />
<a href="DispatcherServlet?command=noteList">노트 리스트</a><br />
<a href="DispatcherServlet?command=memoList">메모 리스트</a><br />

<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<a href="javascript:prevMonth()">◀</a>
${param.year}년 ${param.month}월
<a href="javascript:nextMonth()">▶</a><br />
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
	<td id="date_${day.date.date}">
			<a href="DispatcherServlet?command=calView&year=${param.year}&month=${param.month}&date=${day.date.date}"><span class="date">${day.date.date}</span></a><br/>
			<c:forEach var="note" items="${day.notes}">
				<a href="DispatcherServlet?command=noteView&diaryNo=${note.no}"><span class="span-note">${note.title}</span></a><br />
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
<div class="sam"><jsp:include page="search_and_memo.jsp"></jsp:include></div>
</body>
</html>