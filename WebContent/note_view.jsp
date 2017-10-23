<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript">
function write_note() {
	document.writeFrm.submit();
}

function deleteNote(no) {
	location.href="DispatcherServlet?command=deleteDiary&no="+no;
}
</script>
<input type="button" value="새 노트 작성" onclick="javascript:write_note();">
<form class="hidden_form" name="writeFrm" method="post" action="DispatcherServlet">
	<input type="text" name="title" value="제목 없음" />
	<textarea name="content">-</textarea>
	<input type="hidden" name="command" value="writeNote" />
	<input type="hidden" name="isCurr" value="true" />
</form>
<div>
<c:forEach var="noteitem" items="${notes}">
	<a href="DispatcherServlet?command=noteView&diaryNo=${noteitem.no}&isCurr=false">${noteitem.title}</a>
</c:forEach>
</div>
<div>
<form action="DispatcherServlet" name="updateFrm" method="post">
	<input type="text" value="${note.title}" name="title"> <br/>
	작성 : ${note.writeDate.year}-${note.writeDate.month}-${note.writeDate.date} / 최종수정 : ${note.currentDate.year}-${note.currentDate.month}-${note.currentDate.date}<br />
	<textarea name="content">${note.content}</textarea>
	<input type="submit" value="저장"  />
	<input type="button" value="노트삭제" onclick="deleteNote(${note.no})" />
	<input type="hidden" name="command" value="updateNote" />
	<input type="hidden" name="isCurr" value="false" />
	<input type="hidden" name="diaryNo" value="${note.no}" />
</form>
</div>
<jsp:include page="foot.jsp"></jsp:include>