<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String title = request.getParameter("title");
	%>
	<h3><%= title %></h3>
	
	오늘의 날짜 : <%=request.getParameter("date") %>
</body>
</html>