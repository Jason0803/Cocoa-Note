/**
 * 
 */
function setDate(dateQuery) {
	var year = dateQuery.substring(0,4);
	var month = dateQuery.substring(4,6);
	var date = dateQuery.substring(6,8);
	var hour = dateQuery.substring(8,10);
	var minute = dateQuery.substring(10);
	var rdate = new Date();
	rdate.setYear(year);
	rdate.setMonth(month-1);
	rdate.setDate(date);
	return rdate;
}

function drawEvent(title, startQuery, endQuery, nowYear, nowMonth){ // 달력에 이벤트를 뿌려주는 함수
	var findId = "";
	var drawCol;
	var spanCount;
	var startDate = setDate(startQuery);
	var endDate = setDate(endQuery);
	var firstDate = new Date();
	var lastDate = new Date();
	firstDate.setYear(nowYear);
	firstDate.setMonth(nowMonth-1);
	firstDate.setDate(1);
	lastDate.setYear(nowYear);
	lastDate.setMonth(firstDate.getMonth()+1);
	lastDate.setDate(firstDate.getDate()-1);
	
	if(startDate.getTime() < firstDate.getTime())
		startDate = firstDate;
	if(lastDate.getTime() < endDate.getTime())
		endDate = lastDate;
	spanCount=0;
	for(findDate=startDate.getDate();findDate<=endDate.getDate();findDate++){
		drawCol = document.getElementById("date_"+findDate);
		var drawItem = document.createElement('SPAN');
		if(findDate==startDate.getDate()) {
			/*spanCount = drawCol.getElementsByClassName('cal_schedule_item').length+1;*/
			if(drawCol.getElementsByClassName('csi_1').length==0) spanCount=1;
			else if(drawCol.getElementsByClassName('csi_2').length==0) spanCount=2;
			else if(drawCol.getElementsByClassName('csi_3').length==0) spanCount=3;
			else if(drawCol.getElementsByClassName('csi_4').length==0) spanCount=4;
			else spanCount=5;
			drawItem.appendChild(document.createTextNode(title));
		}
		if(spanCount<=4) {
			drawItem.className += ("cal_schedule_item csi_"+spanCount);
			drawCol.appendChild(drawItem);
		}
	}
}

function calView(year,month,date){
	var year = year;
	var month = month;
	var date = date;
	location.href = "DispatcherServlet?command=calView&year="+year+"&month="+month+"&date="+date;
}
function getD_Day(upcomings){
	for(i=0;i<upcomings.length;i++){
		var tempStr = upcomings[i].innerHTML;
		tempStr = tempStr.split(',');
		tempStr = tempStr[0].split('/');
		var year = tempStr[0];
		var month = tempStr[1];
		var date = tempStr[2];
		var nowDate = new Date();
		var targetDate = new Date(year,month-1,date);
		var count = Math.ceil((targetDate-nowDate) / 1000 / 60 / 60 / 24);
		if(count>0) upcomings[i].innerHTML = "D - "+count;
		else if(count==0) upcomings[i].innerHTML = "D-DAY";
		else if(count<0) upcomings[i].parentNode.parentNode.style.display='none';
	}
	
}
//----------------------------------------------------------------------------
function prevMonth(year, month) {
	var year = year;
	var month = month;
	if(month==1){
		year -= 1;
		month = 12;
	} else month -= 1;
	location.href="DispatcherServlet?command=cal&year="+year+"&month="+month;
}
function nextMonth(year, month) {
	var year = year;
	var month = month;
	if(month==12){
		year += 1;
		month = 1;
	} else month +=1;
	location.href="DispatcherServlet?command=cal&year="+year+"&month="+month;
}
// ---------------------------------------------------------------------------
var group_member = new Array();
function addGroupMember(jsValue, js) {
	var node = document.createElement("span"); // Create a <li> node
		node.setAttribute('class', 'invited_member');
	var textnode;         // Create a text node
	var idNode = document.createElement('span');
	idNode.setAttribute('style', 'display:none');
	idNode.setAttribute('class', 'hiddenId');
	var deleteNode = document.createElement("span");
	deleteNode.setAttribute('class', 'delete_member');
	deleteNode.setAttribute('onclick', 'javascript:deleteGroupMember(this)');
	if(jsValue!=null) {
		textnode = document.createTextNode(jsValue);
		group_member.push(js);
		idNode.innerText = js;
	} else {
		var group_memberFrm = document.scheduleFrm.schedule_group.value;
		textnode = document.createTextNode(group_memberFrm);
		group_member.push(group_memberFrm);
		idNode.innerText = group_memberFrm;
	}
	if(group_memberFrm!=""){
		node.appendChild(textnode);                              // Append the text to <li>
		node.appendChild(deleteNode);
		node.appendChild(idNode);
		document.getElementById("shcedule_group_container").appendChild(node);     // Append <li> to <ul> with id="myList"
	}
	document.scheduleFrm.schedule_group.value = "";
} // 추가 버튼을 누르면 schedule_group_container에 해당 아이디를 추가하고 텍스트박스를 초기화함
function deleteGroupMember(m){
	var deleted_member = m.parentNode.getElementsByClassName('hiddenId')[0].textContent;
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

function noteListView(nlId) {
	var viewStyle = document.getElementById(nlId).style['display'];
	if(viewStyle=='block')
		document.getElementById(nlId).style['display'] = 'none';
	else {
		var lists = document.getElementsByClassName('cal_note_list');
		for(i=0;i<lists.length;i++)
			lists[i].style['display'] = 'none';
		document.getElementById(nlId).style['display'] = 'block';
	}
}

function loadBtnSet(item){
	var child = item.getElementsByClassName('scheduleBtn');
	child[0].style['display'] = "block";
}

function hideBtnSet(item){
	var child = item.getElementsByClassName('scheduleBtn');
	child[0].style['display'] = "none";
}

function deleteDiary(scheduleNo,year, month, date){
	location.href="DispatcherServlet?command=deleteDiary&no="+scheduleNo+"&year="+year+"&month="+month+"&date="+date;
}

function updateSchedule(diaryNo, schedule){
	group_member = [];
	document.getElementById('shcedule_group_container').innerHTML = "";
	
	var title = schedule.split('title=')[1];
	title = title.substring(0,title.indexOf(','));
	var content = schedule.split('content=')[1];
	content = content.substring(0,content.indexOf(','));
	var startDate = schedule.split('startDate=')[1];
	startDate = startDate.substring(0,startDate.indexOf(','));
	
	var startTime = schedule.split('startDate='+startDate)[1];
	startTime = startTime.substring(2,startTime.indexOf(', e'));
	
	var endDate = schedule.split('endDate=')[1];
	endDate = endDate.substring(0,endDate.indexOf(','));
	
	var endTime = schedule.split('endDate='+endDate)[1];
	endTime = endTime.substring(2,endTime.indexOf(']'));
	
	var groupMembers = document.getElementById('gms_'+diaryNo).children;
	for(i=0;i<groupMembers.length;i++){
		addGroupMember(groupMembers[i].innerText, groupMembers[i].children[0].innerHTML);
	}
	
	
	if(startDate.length==8){
		startDate = startDate.replace('/', '-0');
		startDate = startDate.replace('/', '-0');
	} else if(startDate.lastIndexOf('/')==6){
		startDate = startDate.replace('/', '-0');
		startDate = startDate.replace('/', '0');
	} else if(startDate.length==10){
		startDate = startDate.replace('/', '-');
		startDate = startDate.replace('/', '-');
	} else {
		startDate = startDate.replace('/', '-');
		startDate = startDate.replace('/', '-0');
	}
	
	if(endDate.length==8){
		endDate = endDate.replace('/', '-0');
		endDate = endDate.replace('/', '-0');
	} else if(endDate.lastIndexOf('/')==6){
		endDate = endDate.replace('/', '-0');
		endDate = endDate.replace('/', '0');
	} else if(endDate.length==10){
		endDate = endDate.replace('/', '-');
		endDate = endDate.replace('/', '-');
	} else {
		endDate = endDate.replace('/', '-');
		endDate = endDate.replace('/', '-0');
	}
	
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
/* --------------------------------------------------------------------- */

