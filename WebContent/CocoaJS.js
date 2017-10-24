/**
 * 
 */
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
	group_member = [];
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