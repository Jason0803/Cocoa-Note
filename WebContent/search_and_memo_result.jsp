<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<c:if test="${param.close}">
<script type="text/javascript">
	opener.document.searchAndMemoFrm.line.value="";
	self.close();
</script>
</c:if>
<script type="text/javascript">
	location.href="DispatcherServlet?command=${param.command}&content=${param.content}";
</script>
</html>