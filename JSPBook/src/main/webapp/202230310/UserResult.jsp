<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 입력 결과</title>
</head>
<body>
<%
    // 폼에서 전송된 데이터를 가져옵니다.
    String id = request.getParameter("id");
    String password = request.getParameter("pw");
    String rePassword = request.getParameter("repw");
    String phoneNum = request.getParameter("phNum");

%>
	<h1>회원 입력 결과</h1>
	<p>아이디 : <%=id%>
	<p>비밀번호 : <%=password%>
<%
	// 비밀번호 일치 여부를 확인합니다.
	if (password != null && password.equals(rePassword)) {
		out.println("<p>비밀번호 확인: 입력한 비밀번호 2개가 동일합니다.");
	}else{
		out.println("<p>비밀번호 확인: 입력한 비밀번호 2개가 다릅니다.");
	}

	phoneNum = phoneNum.substring(0, 3) + "-" + phoneNum.substring(3, 7) + "-" + phoneNum.substring(7);
%>
	<p>핸드폰: <%=phoneNum%>
</body>
</html>
