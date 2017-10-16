<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
<c:if test="${memberVO}!=null">
	location.href = "cal.jsp";
</c:if>

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
<form action="DispatcherServlet" method="post" name="registerFrm" onsubmit="return registerCheck();">
Sign up<br />
<input type="text" name="id" placeholder="아이디(email)" required="required"/><br />
<input type="password" name="password" placeholder="password" required="required" /><br />
<input type="password" name="password_chk" placeholder="password check" required="required" /><br />
<input type="text" name="name" placeholder="이름" required="required" /><br />
<input type="submit" value="가입"/>
<input type="hidden" name="command" value="register" /><br />
이미 회원이신가요? <a href="login.html">Login</a>
</form>
</body>
</html>