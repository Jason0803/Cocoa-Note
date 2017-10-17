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
			var path = "DispatcherServlet?command=cal&year="+year"+&month="+month;
		</c:if>
		location.href=path;
	</script>
</c:if>

</head>
<body>
${memberVO }
${today }
<a href="updateMember.jsp">회원정보수정</a>
</body>
</html>