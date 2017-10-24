<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<title>카카오노트</title>
<div class="row" style="height: 900px;">
	<div class="col-8">
		<div class="card rounded-content" style="width: 100%; height: 90%;">
			<div class="card-body">
				<h4 class="card-title">Calendar</h4>
				<h6 class="card-subtitle mb-2 ">
				<img src="icon/back-bold.svg" width="10px" height="10px" onclick="prevMonth(${param.year},${param.month})"/>
				${param.year}년 ${param.month}월 
				<img src="icon/next-bold.svg" width="10px" height="10px" onclick="nextMonth(${param.year},${param.month})"/><br />
				</h6>
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
						<td id="date_${day.date.date}" style="position:relative;">
							<c:if test="${day.date.date!=null}">
								<span class="date" onclick="calView(${day.date.year},${day.date.month},${day.date.date})">${day.date.date}</span><br/>
								<c:forEach var="note" items="${day.notes}">
									<span class="cal_note_item" onclick="noteView('${note.no}')">${note.title}</span><br />
								</c:forEach>
								<c:forEach var="schedule" items="${day.schedules}">
									<span class="cal_schedule_item">${schedule.title}</span><br />
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
			</div>
		</div>
	</div>
	<div class="col-4">
		<div class="card rounded-content" style="width: 100%; height: 90%;">
			<div class="card-body">
				<h4 class="card-title">Upcoming events</h4>
				<h6 class="card-subtitle mb-2 text-muted"></h6>
				<c:forEach var="scheduleItem" items="${scheduleList}">
					<div class="card rounded-notification bg-pink">
						<div class="card-body">
							<h4 class="card-title" name="d-day">${scheduleItem.startDate}</h4>
							<h6 class="card-subtitle ">${scheduleItem.title}</h6>
						</div>
					</div>
				</c:forEach>
				<script type="text/javascript">
					var upcomings = document.getElementsByName('d-day');
					getD_Day(upcomings);
				</script>
			</div>
		</div>
	</div>
</div>
	
	
	
		

<jsp:include page="foot.jsp"></jsp:include>