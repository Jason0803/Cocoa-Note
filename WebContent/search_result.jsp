<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<div>
	"${param.keyword}" : Note 검색결과<br/>
	<c:forEach var="note" items="${notes}">
		[${note.value.title}] ${note.value.content}<br />
	</c:forEach>
</div>

<div>
	"${param.keyword}" : Schedule 검색결과<br/>
	<c:forEach var="schedule" items="${schedules}">
		${schedule.value}<br />
	</c:forEach>
</div>

<div>
	"${param.keyword}" : Memo 검색결과<br/>
	<c:forEach var="memo" items="${memos}">
		${memo.value.content}<br />
	</c:forEach>
</div>
<jsp:include page="foot.jsp"></jsp:include>