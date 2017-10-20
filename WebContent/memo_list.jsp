<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>

<c:forEach var="memo" items="${memos}">
	<div class="memo">${memo.content}<br /> ${memo.writeDate}</div>
</c:forEach>
<jsp:include page="foot.jsp"></jsp:include>