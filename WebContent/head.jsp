<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="bg-ghostwhite">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script src="CocoaJS.js" type="text/javascript"></script>
<link rel="stylesheet" href="CocoaCSS.css">
<c:if test="${memberVO.theme eq '1'}">
<link rel="stylesheet" href="css/global-tier-one.css">
</c:if>
<c:if test="${memberVO.theme eq '2'}">
<link rel="stylesheet" href="css/global-tier-two.css">
</c:if>
<c:if test="${memberVO==null}">
	<script type="text/javascript">
		location.href="login.jsp";
	</script>
</c:if>
</head>
<body class="bg-ghostwhite">
<div class="bg-ghostwhite" style="margin-top: 50px"></div>
	<div class="container">
		<nav class="navbar navbar-light bg-grad-pink rounded-bar d-flex justify-content-start" style="margin-bottom:30px;">
			<span class="navbar-brand mb-0 h1">cocoaNOTE</span>
			<a href="DispatcherServlet?command=cal&year=${today.year}&month=${today.month}"><img class="icon"  src="icon/calendar-pink.svg" width="30px" height="30px"></a> 
			<a href="DispatcherServlet?command=noteView&isCurr=true"><img class="icon" src="icon/notebook-pink.svg" width="30px" height="30px"></a>
			<a href="DispatcherServlet?command=memoList"><img class="icon " src="icon/memo-pink.svg" width="30px" height="30px"></a>
			<div class="dropdown show profile">
				<button type="button"
					class="btn bg-white dropdown-toggle rounded-bar"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					${memberVO.name }</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="updateMember.jsp">설정</a> 
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="DispatcherServlet?command=logout">로그아웃</a>
				</div>
			</div>
		</nav>
	