<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>성적 입력 결과</title>
</head>
<body>
<%
    String department = request.getParameter("department"); //학과
    int serverScore = Integer.parseInt(request.getParameter("server")); //서버
    int javaScore = Integer.parseInt(request.getParameter("java")); //자바
    boolean isTotalChecked = request.getParameter("total") != null; //총점
    boolean isAverageChecked = request.getParameter("average") != null; //평균

    String departmentName = ""; //화면에 보여 질 과이름
 	// 학과에 따라 한글 이름을 설정합니다.
    if ("computer".equals(department)) {
        departmentName = "컴퓨터과";
    } else if ("civil".equals(department)) {
        departmentName = "토목학과";
    } else if ("physics".equals(department)) {
        departmentName = "물리학과";
    }
 
    int total = serverScore + javaScore;
    double average = total / 2.0;

    String serverGrade = ""; //등급
    if (serverScore >= 90) serverGrade = "A";
    else if (serverScore >= 80) serverGrade = "B";
    else if (serverScore >= 70) serverGrade = "C";
    else if (serverScore >= 60) serverGrade = "D";
    else serverGrade = "F";

    String javaGrade = "";
    if (javaScore >= 90) javaGrade = "A";
    else if (javaScore >= 80) javaGrade = "B";
    else if (javaScore >= 70) javaGrade = "C";
    else if (javaScore >= 60) javaGrade = "D";
    else javaGrade = "F";
%>
    <h1>성적 입력 결과</h1>
    <p>학과 : <%= departmentName %></p>
    <p>서버 점수 : <%= serverScore %> , <%= serverGrade %></p>
    <p>자바 점수 : <%= javaScore %> , <%= javaGrade %></p>
    
<% if (isTotalChecked) { %>
    <p>총점 : <%= total %></p>
<% }
   if (isAverageChecked) { %>
    <p>평균 점수 : <%= String.format("%.2f", average) %></p>
<% } %>
    <p>지금은 : <%=(new java.util.Date()).toLocaleString()%></p>
</body>
</html>
