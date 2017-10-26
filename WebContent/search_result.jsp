<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>

<div class="row d-flex justify-content-center" style=" min-height: 1000px;">
	<div class="col-8">
	<!-- No search result -->

		
	<!-- Find Schedule card -->
	
		<div class="card rounded-content" style="width: 100%; min-height: 10%; margin-bottom:20px;">
			<div class="card-body">
				<h4 class="card-title">Find Schedule</h4>				
				<p class="card-text">
	<c:forEach var="schedule" items="${schedules}">
		${schedule.value}<br />
	</c:forEach>
				</p>
			</div>
		</div>
		
		<!-- Find Note card -->
		
		<div class="card rounded-content" style="width: 100%; min-height: 10%; margin-bottom:20px;">
			<div class="card-body">
				<h4 class="card-title">Find Note</h4>				
				<p class="card-text">
	<c:forEach var="note" items="${notes}">
		<span class="text-bold"><strong>${note.value.title}</strong></span> ${note.value.content}<br />
	</c:forEach>
				</p>
			</div>
		</div>
		
		<!-- Find Memo card -->
		
		<div class="card rounded-content" style="width: 100%; min-height: 10%; margin-bottom:20px;">
			<div class="card-body">
				<h4 class="card-title">Find Memo</h4>				
				<p class="card-text">
	<c:forEach var="memo" items="${memos}">
		${memo.value.content}<br />
	</c:forEach>
				</p>
			</div>
		</div>
	</div>
</div>



<jsp:include page="foot.jsp"></jsp:include>