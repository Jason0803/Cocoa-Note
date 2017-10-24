<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript">
var group_member = new Array();
function addGroupMember() {
	var group_memberFrm = document.scheduleFrm.schedule_group.value;
	group_member.push(group_memberFrm);
	
	var node = document.createElement("span"); // Create a <li> node
		node.setAttribute('class', 'invited_member');
	var textnode = document.createTextNode(group_memberFrm);         // Create a text node
	var deleteNode = document.createElement("span");
	deleteNode.setAttribute('class', 'delete_member');
	deleteNode.setAttribute('onclick', 'javascript:deleteGroupMember(this)');
	node.appendChild(textnode);                              // Append the text to <li>
	node.appendChild(deleteNode);
	document.getElementById("shcedule_group_container").appendChild(node);     // Append <li> to <ul> with id="myList"
	document.scheduleFrm.schedule_group.value = "";
} // 추가 버튼을 누르면 schedule_group_container에 해당 아이디를 추가하고 텍스트박스를 초기화함
function deleteGroupMember(m){
	var deleted_member = m.parentNode.firstChild.textContent;
	var index = group_member.indexOf(deleted_member);
	if(index>=0) group_member.splice(index, 1);
	m.parentNode.remove();
}
function valueCheck() {
	var start_dateFrm = document.scheduleFrm.startDate.value;
	var end_dateFrm = document.scheduleFrm.endDate.value;
	
	if(start_dateFrm=="" || end_dateFrm=="") {
		alert("유효한 날짜를 선택해주세요.");
		return false;
	} else {
		var start_date = start_dateFrm.substring(0,4);
		start_date += start_dateFrm.substring(5,7);
		start_date += start_dateFrm.substring(8,10);
		start_date += start_dateFrm.substring(11,13);
		start_date += start_dateFrm.substring(14,16);
		
		
		var end_date = end_dateFrm.substring(0,4);
		end_date += end_dateFrm.substring(5,7);
		end_date += end_dateFrm.substring(8,10);
		end_date += end_dateFrm.substring(11,13);
		end_date += end_dateFrm.substring(14,16);
		
		document.scheduleFrm.start_date.value = start_date;
		document.scheduleFrm.end_date.value = end_date;
		
		if(Number(start_date)> Number(end_date)){
			alert("시작날짜가 종료날짜보다 늦습니다.");
			return false;
		} else {
			document.scheduleFrm.group_member.value = group_member;
			return true;
		}
	}
}
function noteView(noteNo) {
	location.href="DispatcherServlet?command=noteView&diaryNo="+noteNo+"&isCurr=false"
}
</script>
<div class="row">
<div class="col-7">
	<div class="card rounded-content">
		<div class="card-body">
			<h4 class="card-title">${dayInfo.date.year}년 ${dayInfo.date.month}월 ${dayInfo.date.date}일</h4>
			<hr>
			<h5>일정</h5>
			<c:if test="${empty dayInfo.schedules}">
				- 등록된 일정이 없습니다.
			</c:if>
			<c:forEach var = "schedule" items="${dayInfo.schedules}">
			일정명 : ${schedule.title}
			일정 기간 : ${schedule.startDate.year}.${schedule.startDate.month}.${schedule.startDate.date}
						~${schedule.endDate.year}.${schedule.endDate.month}.${schedule.endDate.date}
			일정 내용 : ${schedule.content}
			</c:forEach>
			<hr>
			<h5>노트</h5>
			<c:if test="${empty dayInfo.notes}">
				- 등록된 노트가 없습니다.
			</c:if>
			<ul>
				<c:forEach var="note" items="${dayInfo.notes}">
					<li style="cursor:pointer" onclick="noteView(${note.no})">${note.title}</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<div class="col-5">
	<div class="card rounded-content">
		<div class="card-body">
			<h4 class="card-title">새로운 일정</h4>
			<p class="card-text"></p>
			<hr>
			<form action="DispatcherServlet" name="scheduleFrm" method="post" onsubmit="return valueCheck()">
				<input type="text" class="form-control rounded-bar" name="title" required="required" placeholder="일정 제목"/><br>
				<input type="datetime-local" class="form-control rounded-bar date-control" name="startDate" required="required" />
				<p align="center">~</p>
				<input type="datetime-local" class="form-control rounded-bar date-control" name="endDate" required="required"/><br>
				<br/>
				<input type="text" class="form-control rounded-bar" name="content" required="required" placeholder="일정 내용"/><br>
				
				<div class="row">
					<div class="col-9">
						<input type="text" class="form-control rounded-bar shcedule_group" name="schedule_group" placeholder="함께하는 사람"/>
					</div>
					<div class="col-3" style="padding-left:0px"> 
						<input style="width:100%" type="button" class="btn btn-primary" value="추가" onclick="addGroupMember()"/><br />
					</div>
					<div id="shcedule_group_container"></div><br /><br />
				</div>
				<input id="btn-long-pink" style="width:100%; margin-top:20px;" type="submit" class="btn btn-primary" value="일정 등록" />
				<input type="hidden" name="command" value="writeSchedule" />
				<input type="hidden" name="start_date" />
				<input type="hidden" name="end_date" />
				<input type="hidden" name="group_member" />
			</form>
			<hr>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
	document.scheduleFrm.startDate.value = "${dayInfo.date.year}-${dayInfo.date.month}-${dayInfo.date.date}T09:00:00.000";
	document.scheduleFrm.endDate.value = "${dayInfo.date.year}-${dayInfo.date.month}-${dayInfo.date.date}T18:00:00.000";
</script>
<jsp:include page="foot.jsp"></jsp:include>