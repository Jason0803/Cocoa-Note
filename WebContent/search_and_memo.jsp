<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
function writeMemo(){
	if(document.searchAndMemoFrm.line.value != ""){
	var openNewWindow = window.open("about:blank");	
	openNewWindow.location.href="write_memo_result.jsp?command=writeMemo&content="+document.searchAndMemoFrm.line.value;
	}
}
function search(){
	if(document.searchAndMemoFrm.line.value != ""){
	location.href="DispatcherServlet?command=search&keyword="+document.searchAndMemoFrm.line.value;
	}
}
</script>
	<div class="row d-flex justify-content-center" >
		<form action="#" class="d-flex justify-content-center fixed-bottom" method="post" name="searchAndMemoFrm" >
		<input class="form-control rounded-bar" style="width: 70%;" type="text" name="line" placeholder="여기에서 검색이나 메모를 해보세요!"/>&nbsp;
		<input type="button" class="btn bg-pink rounded-bar" style="width: 5%;" value="검색" onclick="search()" accesskey="z"></input>&nbsp;
		<input type="button" class="btn bg-pink rounded-bar" style="width: 5%;" value="메모" onclick="writeMemo()" accesskey="x"></input>
		</form>

	</div>
	
