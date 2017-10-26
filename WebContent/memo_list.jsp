<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<title>코코아노트</title>
<c:forEach var="memo" items="${memos}">
	<div class="memo card rounded-content">
	<div class="memoWrtDate">${memo.writeDate}</div>
	<input type="button" class="deleteBtn hover" onclick="deleteMemo(${memo.no})">
	<div class="memoContent">${memo.content}</div>
	</div>
</c:forEach>
<script type="text/javascript">
function deleteMemo(memoNo){
	location.href="DispatcherServlet?command=deleteDiary&no="+memoNo;	
}

var memos = document.getElementsByClassName('memo');
for(i=0;i<memos.length;i++){
	var count = Math.floor(Math.random()*5)+1;
	memos[i].className += " memo"+count+"";
}

</script>
<jsp:include page="foot.jsp"></jsp:include>
</div>