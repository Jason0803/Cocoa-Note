<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>코코아노트 가입하기</title>
<c:if test="${memberVO!=null}">
<script type="text/javascript">
	location.href = "DispatcherServlet?command=cal&year=${today.year}&month=${today.month}";
</script>
</c:if>
<script type="text/javascript">

function registerCheck() {
	var regFrm = document.registerFrm;
	if(regFrm.password.value==regFrm.password_chk.value){
		return true;
	} else {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
}
</script>

</head>
<body>
	<div class="container">
		<div class="row ">			
		<div class="col">
		<br /><br /><h2>cocoaNOTE</h2>
		</div>
				
			</div>
			<div class="dropdown-divider"></div>






		
	<div class="row" style="margin-bottom:100px;">
				<div class="col-6  text-wrapper  " style="border-right: 0px solid gray;">
			<div><br/><br/><br/></div>
				<div class="animated-words d-flex justify-content-start" style="margin-left:100px;" >
					<br> <br><span>일정, 노트, 메모를<br> 한 곳에서 모두
						기록하세요.
					</span> <span>설정 없이,<br> 모든 기기와 연동됩니다.
					</span> <span>일정을 <br>친구와 공유해 보세요.
					</span> <span>당신의<br>하루를 담아보세요.
					</span>
				</div>
				<div class="animated-words-last d-flex justify-content-center">
					<span>자, 이제<br>시작해 보세요.
					</span>
				</div>
			</div>
			
			<div class="col-6	 d-flex justify-content-end" style="margin-top: 30px; margin-bottom:100px;	">
				<div><br/><br/><br/></div>
				 
				
				<div class="card text-center" style="width: 25rem; min-height: 30rem">
				<br/>				
				<h4>
					<strong>지금 코코아노트에 가입하세요.</strong>
				</h4>
					<div class="card-body">
						<form action="DispatcherServlet" method="post" name="registerFrm"
							onsubmit="return registerCheck();">
							<input class="form-control" type="email" name="id" placeholder="아이디(email)" required="required" /><br /> 
							<input class="form-control" type="password" name="password" placeholder="비밀번호" required="required" /><br />
							<input class="form-control" type="password" name="password_chk" 	placeholder="비밀번호 확인" required="required" /><br /> 
							<input class="form-control" type="text" name="name" placeholder="이름" required="required" /><br />
							<input id="btn-longer-pink" class="btn btn-primary"   type="submit" value="가입하기" />
							<c:if test="${param.register==false}">
								<br />
								<span style="color: red">이미 존재하는 ID입니다.</span>
							</c:if>
							
							 <input class="form-control" type="hidden" name="command" value="register" /><br /> 
							 <br/>
							 <h6><small>가입과 동시에 귀하는 쿠키 사용을 포함해 이용약관과 개인정보 처리방침에 동의하는 것입니다. </small></h6>
							<h6>이미 회원이신가요? <a	href="login.jsp">로그인</a></h6>
						</form>
				</div>
			</div>
			
			
			</div>

</div>
</div>
</body>
</html>