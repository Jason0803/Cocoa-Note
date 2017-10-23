<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>

<c:forEach var="memo" items="${memos}">
	<div class="memo card rounded-content">
	<input type="button" value="KILL" onclick="deleteMemo(${memo.no})"><br/>
		${memo.writeDate}<br />${memo.content}
	</div>
</c:forEach>
<script type="text/javascript">
function deleteMemo(memoNo){
	location.href="DispatcherServlet?command=deleteDiary&no="+memoNo;	
}
</script>
<jsp:include page="foot.jsp"></jsp:include>
</div>