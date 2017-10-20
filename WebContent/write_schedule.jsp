<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
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
		} else
			document.scheduleFrm.submit();
	}
}

</script>
</head>
<body>
<form action="DispatcherServlet" name="scheduleFrm" method="post">
	제목 : <input type="text" name="title"/><br>
	기간 : <input type="datetime-local" name="startDate" required="required" /> ~ <input type="datetime-local" name="endDate" required="required"/><br>
	내용 : <input type="text" name="content"/><br>
	<input type="button" onclick="valueCheck()" value="전송" />
	<input type="hidden" name="command" value="writeSchedule" />
	<input type="hidden" name="start_date" />
	<input type="hidden" name="end_date" />
</form>
</body>
</html>