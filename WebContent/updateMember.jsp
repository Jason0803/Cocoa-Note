<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"></jsp:include>
<script>
function chgTheme(radioBtn){
	if(radioBtn.value==1){
		/* alert(); */
		document.getElementById("img1").src = 'img/1.JPG';
		document.getElementById("img2").src = 'img/2.JPG';
		document.getElementById("img3").src = 'img/3.JPG';
		}else{
		document.getElementById("img1").src = 'img/blue.png';
		document.getElementById("img2").src = 'img/pink.png';
		document.getElementById("img3").src = 'img/green.png';
		}
}
</script>
<title>회원정보 수정</title>
<div class="row">
	<div class="col-6 d-flex justify-content-end" >
		<div class="card rounded-content textcenter" style="width: 25rem; height: 30rem;">
			<div class="card-body" >
				<h4 class="card-title" style="text-align:center;">Mypage</h4>
				<br />
				<form action="DispatcherServlet" method="post">
					<input class="form-control" type="text" name="id" readonly="readonly" value="${memberVO.id}" /><br /> 
					<input class="form-control" type="password" name="password"	placeholder="현재 비밀번호" required="required" /><br /> 
					<input class="form-control" type="password" name="new_password"	placeholder="변경할 비밀번호" /><br /> 
					<input class="form-control" type="text" name="name" placeholder="이름" required="required" value="${memberVO.name}" /><br /> 
					<span>
					테마 <input type="radio" name="theme" id=cocoaTheme value="1" onchange="chgTheme(this)" checked="checked">코코아 
						<input type="radio" name="theme" id=peachTheme value="2" onchange="chgTheme(this)">피치
					</span>
					<br/>
						<input type="submit" class="updateBtn" value="저장" />
						<input type="hidden" name="command" value="updateMember" />
				</form>
			</div>
		</div>
	</div>
	<div class="col-6 d-flex justify-content-start">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block rounded" id="img1" src="img/1.JPG" width="400"
						height="480" alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block rounded" id="img2" src="img/2.JPG" width="400"
						height="480" alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block rounded" id="img3" src="img/3.JPG" width="400"
						height="480" alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span class="sr-only">Next</span>
			</a>
		</div>
	</div>	
</div>


<jsp:include page="foot.jsp"></jsp:include>