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
function loadBtnSet(item){
	var child = item.children;
	child[3].style['display'] = "block";
}

function hideBtnSet(item){
	var child = item.children;
	child[3].style['display'] = "none";
}

function deleteDiary(scheduleNo){
	location.href="DispatcherServlet?command=deleteDiary&no="+scheduleNo+"&year=${dayInfo.date.year}&month=${dayInfo.date.month}&date=${dayInfo.date.date}";
}

function updateSchedule(diaryNo, schedule){
	var scheduleToStringArray = schedule.split(',');
	var tempStr = scheduleToStringArray[0].split('=');
	var title = tempStr[1];
	tempStr = scheduleToStringArray[1].split('=');
	var content = tempStr[1];
	tempStr = scheduleToStringArray[3].split('=');
	var startDate = tempStr[1];
	var startTime = scheduleToStringArray[4];
	tempStr = scheduleToStringArray[5].split('=');
	var endDate = tempStr[1];
	var endTime = scheduleToStringArray[6].substring(0,scheduleToStringArray[6].length-1);
	
	startDate = startDate.replace('/', '-');
	startDate = startDate.replace('/', '-');
	
	startTime = startTime.trim();
	if(startTime[1]==':') {
		startTime = "0"+startTime+"";
	}
	if(startTime.length==4) {
		var tempChar = startTime[3];
		startTime[3] = "0";
		startTime += tempChar;
	}
	
	endTime = endTime.trim();
	if(endTime[1]==':') {
		endTime = "0"+endTime+"";
	}
	if(endTime.length==4) {
		var tempChar = endTime[3];
		endTime[3] = "0";
		endTime += tempChar;
	}
	
	startDate = startDate+"T"+startTime+":00.000";
	endDate = endDate.replace('/', '-');
	endDate = endDate.replace('/', '-');
	endDate = endDate+"T"+endTime+":00.000";

	var inputNode = document.createElement('input');
	inputNode.setAttribute('type', 'hidden');
	inputNode.setAttribute('name', 'diaryNo');
	inputNode.setAttribute('value', diaryNo);
	document.scheduleFrm.appendChild(inputNode);
	
	document.scheduleFrm.command.value = 'updateSchedule';
	document.scheduleFrm.title.value = title;
	document.scheduleFrm.title.value = title;
	document.scheduleFrm.content.value = content;
	document.scheduleFrm.startDate.value = startDate;
	document.scheduleFrm.endDate.value = endDate;
	
	document.getElementById('scheduleFrmTitle').innerHTML = "일정 변경하기";
	document.getElementsByName('scheduleFrmSubmit')[0].value="일정 수정";
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
				<div class="scheduleItem" onmouseover="loadBtnSet(this)" onmouseout="hideBtnSet(this)">
					<span class="scheduleTitle">${schedule.title}</span>
					<span class="scheduleDate">${schedule.startDate.year}.${schedule.startDate.month}.${schedule.startDate.date} ${schedule.startDate.hour}:${schedule.startDate.minute}
								~${schedule.endDate.year}.${schedule.endDate.month}.${schedule.endDate.date} ${schedule.endDate.hour}:${schedule.endDate.minute}</span>
					<p class="scheduleContent">- ${schedule.content}</p>
					<div class="scheduleBtn">
						<input type="button" value="수정" onclick="updateSchedule('${schedule.no}', '${schedule}')" />
						<input type="button" value="삭제" onclick="deleteDiary(${schedule.no})"/>
					</div>
				</div>
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
			<h4 class="card-title" id="scheduleFrmTitle">새로운 일정</h4>
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
				<input name="scheduleFrmSubmit" id="btn-long-pink" style="width:100%; margin-top:20px;" type="submit" class="btn btn-primary" value="일정 등록" />
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