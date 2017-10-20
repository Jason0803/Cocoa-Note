<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="global-tier-one.css">
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

<title>Welcome to cocoaNOTE</title>
</head>
<body>
	
		<div class="row">
			<div class="col-6" style="border-right: 1px solid #000;">아따맘마</div>
			<div class="col-4 d-flex justify-content-center", style="margin-top: 10%">
				<div class="card" style="width: 20rem;">
					<div class="card-body">
						<form action="">
							<h4 class="card-title text-center">오늘도 파이팅!</h4>
							<input class="form-control" type="text" name="id"
								placeholder="아이디(email)" required="required" /><br /> <input
								class="form-control" type="password" name="password"
								placeholder="password" required="required" /><br /> <input
								id="btn-long-pink" class="btn btn-primary" type="submit"
								value="로그인" />
						</form>
					</div>
				

				<!-- <div id="layout-center" class="card" style="width: 20rem;">
					<form action="DispatcherServlet" method="post">

						<div class="card-body">
							<h4 class="card-title">오늘도 파이팅!</h4>
							<input class="form-control" type="text" name="id"
								placeholder="아이디(email)" required="required" /><br /> <input
								class="form-control" type="password" name="password"
								placeholder="password" required="required" /><br /> <input
								id="btn-long-pink" class="btn btn-primary" type="submit"
								value="로그인" />
						</div>

					</form>
				</div> -->
			</div>
		</div>






		<c:if test="${param.login==false}">
			<br />
			<span style="color: red">회원정보가 일치하지 않습니다.</span>
		</c:if>
		<input type="hidden" name="command" value="login" />
		</form>
	</div>

</body>
</html>