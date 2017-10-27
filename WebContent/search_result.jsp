<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<title>코코아노트</title>
<div class="row d-flex justify-content-center" style=" min-height: 1000px;">
	<div class="col-8">
	<!-- No search result -->

		
	<!-- Find Schedule card -->
	<c:if test="${schedules  != '{}'}">
		<div class="card rounded-content animated-card-1" style="width: 100%; min-height: 10%; margin-bottom:20px;">
			<div class="card-body">
				<h4 class="card-title">Find Schedule</h4>				
				<p class="card-text"> 
	<c:forEach var="schedule" items="${schedules}">
		<span class="text-bold"><strong>${schedule.value.title}</strong></span> ${schedule.value.content}<br />
		<div class="dropdown-divider"></div>

	</c:forEach>
				</p>
			</div>
		</div>
		</c:if>
		
		<!-- Find Note card -->
		<c:if test="${notes  != '{}'}">
		<div class="card rounded-content animated-card-2" style="width: 100%; min-height: 10%; margin-bottom:20px;">
			<div class="card-body">
				<h4 class="card-title">Find Note</h4>				
				<p class="card-text">
	<c:forEach var="note" items="${notes}">
		<span class="text-bold"><strong>${note.value.title}</strong></span><br/> 
		${note.value.content}<br />
		<div class="dropdown-divider"></div>
	</c:forEach>
				</p>
			</div>
		</div>
		</c:if>
		
		<!-- Find Memo card -->
		<c:if test="${memos  != '{}'}">
		<div class="card rounded-content animated-card-3" style="width: 100%; min-height: 10%; margin-bottom:20px;">
			<div class="card-body">
				<h4 class="card-title">Find Memo</h4>				
				<p class="card-text">
	<c:forEach var="memo" items="${memos}">
		${memo.value.content}<br />
		<div class="dropdown-divider"></div>
	</c:forEach>
				</p>
			</div>
		</div>
		</c:if>
		<!-- there is no result -->
		<c:if test="${(schedules eq '{}') and (notes eq'{}') and (memos eq '{}')}">
		<div class="d-flex justify-content-center" style="margin-top:10%;"><h1 style="color: indianred;">검색~끝! 찾으시는 내용이 없네요</h1></div>
		</c:if>
		
	</div>
</div>




<jsp:include page="foot.jsp"></jsp:include>