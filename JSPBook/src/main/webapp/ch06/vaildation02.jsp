<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script>
	function checkLogin(){
		var form = document.loginForm;
		if(form.id.value==""){
			alert("아이디를 입력하세요.");
			form.id.focus();
			return false;
		}else if(form.pw.value==""){
			alert("비밀번호를 입력하세요")
			form.pw.focus();
			return false;
		}
		form.submit();
	}
</script>
<body>
	<form name = "loginForm" action="vaildation02_process.jsp" method="post">
		<p>아이디: <input type = "text" name="id">
		<p>비밀번호: <input type="password" name="pw">
		<p><input type="submit" value="전송" onclick="checkLogin()">
	</form>
</body>
</html>