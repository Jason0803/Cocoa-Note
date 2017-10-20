<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>

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
			<c:if test="${day.date.date!=null }">
				<a href="DispatcherServlet?command=calView&year=${param.year}&month=${param.month}&date=${day.date.date}"><span class="date">${day.date.date}</span></a><br/>
				<c:forEach var="note" items="${day.notes}">
					<a href="DispatcherServlet?command=noteView&diaryNo=${note.no}"><span class="span-note">${note.title}</span></a><br />
				</c:forEach>
				<c:forEach var="schedule" items="${day.schedules}">
					<span class="span-note">${schedule.title}</span><br />
				</c:forEach>
			</c:if>
	</td>
	<c:if test="${column.count%7==0}">
	</tr>
	<tr>
	</c:if>
</c:forEach>
</tr>
</tbody>
</table>
<jsp:include page="foot.jsp"></jsp:include>