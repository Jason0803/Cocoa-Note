<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<title>카카오노트</title>
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


		<div class="row" style="height: 900px;">
			<div class="col-8">
				<div class="card rounded-content" style="width: 100%; height: 90%;">
					<div class="card-body">
						<h4 class="card-title">Calender</h4>
						<h6 class="card-subtitle mb-2 ">
						<a href="javascript:prevMonth()"><img  src="icon/back-bold.svg" width="10px" height="10px"/></a> ${param.year}년 ${param.month}월 
						<a href="javascript:nextMonth()"><img  src="icon/next-bold.svg" width="10px" height="10px"/></a><br />
						</h6>
						<p class="card-text">
						<table class="table">
<thead>
	<tr>
		<th scope="col">일</th>
		<th scope="col">월</th>
		<th scope="col">화</th>
		<th scope="col">수</th>
		<th scope="col">목</th>
		<th scope="col">금</th>
		<th scope="col">토</th>
	</tr>
</thead>
<tbody>
<tr>
<c:forEach var="day" items="${monthlyDiary}" varStatus="column">
	<td id="date_${day.date.date}">
			<c:if test="${day.date.date!=null }">
				<a style="color:white;" href="DispatcherServlet?command=calView&year=${param.year}&month=${param.month}&date=${day.date.date}"><span class="date">${day.date.date}</span></a><br/>
				<c:forEach var="note" items="${day.notes}">
					<a href="DispatcherServlet?command=noteView&diaryNo=${note.no}"><span class="note">${note.title}</span></a><br />
				</c:forEach>
				<c:forEach var="schedule" items="${day.schedules}">
					<span >${schedule.title}</span><br />
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
						</p>

					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card rounded-content" style="width: 100%; height: 90%;">
					<div class="card-body">
						<h4 class="card-title">Upcoming events</h4>
						<h6 class="card-subtitle mb-2 text-muted"></h6>
						
						<div class="card rounded-notification bg-pink">
						<div class="card-body">
						<h4 class="card-title">D-7</h4>
						<h6 class="card-subtitle ">코코아노트 개발팀 회식</h6>
						</div>
						</div>
						
						<div class="card rounded-notification bg-pink">
						<div class="card-body">
						<h4 class="card-title">D-8</h4>
						<h6 class="card-subtitle ">프로젝트 마감일</h6>
						</div>
						</div>
						

					</div>
				</div>
			</div>
		</div>
		
		
		
		

<jsp:include page="foot.jsp"></jsp:include>