<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function writeMemo(){
	var openNewWindow = window.open("about:blank");
	openNewWindow.location.href="search_and_memo_result.jsp?command=writeMemo&content="+document.searchAndMemoFrm.line.value;
}
</script>
<form action="#" method="post" name="searchAndMemoFrm">
<input type="text" name="line"/>
<input type="button" value="검색" onclick="search()"/>
<input type="button" value="메모" onclick="writeMemo()"/>
</form>
</body>
</html>