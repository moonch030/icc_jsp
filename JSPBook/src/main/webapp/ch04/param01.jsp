<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>param 액션 태그</h3>
	<jsp:forward page = "param01_data.jsp">
		<jsp:param name="id" value ="admin"/>
		<jsp:param name="name" value ="문채현"/>
	</jsp:forward>
</body>
</html>