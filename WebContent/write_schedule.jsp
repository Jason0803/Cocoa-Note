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

</script>
<form action="DispatcherServlet" name="scheduleFrm" method="post" onsubmit="return valueCheck()">
	제목 : <input type="text" name="title" required="required"/><br>
	기간 : <input type="datetime-local" name="startDate" required="required" /> ~ <input type="datetime-local" name="endDate" required="required"/><br>
	내용 : <input type="text" name="content" required="required"/><br>
	함께하는 사람 : <input type="text" name="schedule_group" /> <input type="button" value="추가" onclick="addGroupMember()"/><br />
	<div id="shcedule_group_container"></div>
	<input type="submit" value="전송" />
	<input type="hidden" name="command" value="writeSchedule" />
	<input type="hidden" name="start_date" />
	<input type="hidden" name="end_date" />
	<input type="hidden" name="group_member" />
</form>
<script type="text/javascript">
	document.scheduleFrm.startDate.value = "${param.year}-${param.month}-${param.date}T09:00:00.000";
	document.scheduleFrm.endDate.value = "${param.year}-${param.month}-${param.date}T18:00:00.000";
</script>
<jsp:include page="foot.jsp"></jsp:include>