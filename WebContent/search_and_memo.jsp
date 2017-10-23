<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
function writeMemo(){
	var openNewWindow = window.open("about:blank");
	openNewWindow.location.href="write_memo_result.jsp?command=writeMemo&content="+document.searchAndMemoFrm.line.value;
}
function search(){
	location.href="DispatcherServlet?command=search&keyword="+document.searchAndMemoFrm.line.value;
}
</script>
	<div class="row d-flex justify-content-center" >
		<form action="#" class="d-flex justify-content-center" method="post" name="searchAndMemoFrm" style="margin-top:30px; width: 100%; position:fixed; bottom:0;">
		<input class="form-control rounded-bar" style="width: 70%;" type="text" name="globalSearch" placeholder="여기에서 검색이나 메모를 해보세요!"
			required="required" />&nbsp;
		<button type="button" class="btn bg-pink rounded-bar" style="width: 5%;" onclick="search()">검색</button>&nbsp;
		<button type="button" class="btn bg-pink rounded-bar" style="width: 5%;" onclick="writeMemo()">메모</button>
		</form>

	</div>
	
