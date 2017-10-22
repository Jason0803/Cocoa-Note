<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html class="bg-ghostwhite">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/global-tier-one.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>
<title>캘린더</title>
</head>
<body class="bg-ghostwhite">
	<!-- As a heading -->
	<div class="bg-ghostwhite" style="margin-top: 50px"></div>
	<div class="container">

		<nav class="navbar navbar-light bg-grad-pink rounded-bar">
			<span class="navbar-brand mb-0 h1">cocoaNOTE</span>
		</nav>
		<div class="row" style="margin-top: 50px">
			<div class="col-8">
				<div class="card rounded-content" style="width: 100%; height: 70%;">
					<div class="card-body">
						<h4 class="card-title">Calender</h4>
						<h6 class="card-subtitle mb-2 text-muted">2017 / 10</h6>
						<p class="card-text"></p>

					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card rounded-content" style="width: 100%; height: 70%;">
					<div class="card-body">
						<h4 class="card-title">Upcoming events</h4>
						<h6 class="card-subtitle mb-2 text-muted"></h6>
						
						<div class="card rounded-notification bg-pink" style="margin-top:30px; height: 15%">
						<div class="card-body">
						<h4 class="card-title">D-7</h4>
						<h6 class="card-subtitle ">코코아노트 개발팀 회식</h6>
						</div>
						</div>
						
						<div class="card rounded-notification bg-pink" style="margin-top:20px; height: 15%">
						<div class="card-body">
						<h4 class="card-title">D-8</h4>
						<h6 class="card-subtitle ">프로젝트 마감일</h6>
						</div>
						</div>
						

					</div>
				</div>
			</div>
		</div>
		<div class="row d-flex justify-content-center" style="margin-top : 20px">

						<input class="form-control rounded-bar"  style="width: 84%;"  type="text" name="globalSearch" 	placeholder="여기에 입력하세요..." required="required" />&nbsp;
						<button type="button" class="btn bg-pink rounded-bar" style="width: 6%;">검색</button> &nbsp;
						<button type="button" class="btn bg-pink rounded-bar" style="width: 6%;">메모</button>

		</div>
	</div>

</body>
</html>