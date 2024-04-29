<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script>
	function checkform(){
		alert("아이디: "+document.loginForm.id.value + "\n"+
				"비밀번호: "+document.loginForm.pw.value);
	}
</script>
<body>
	<form name = "loginForm">
		<p>아이디: <input type = "text" name="id">
		<p>비밀번호: <input type="password" name="pw">
		<p><input type="submit" value="전송" onclick="checkform()">
	</form>
</body>
</html>