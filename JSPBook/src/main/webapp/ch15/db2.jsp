<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MySQL 연결 드라이버 테스트</title>
</head>
<body>
   <h1>MySQL 연결 드라이버 테스트</h1>
   <%
      String jdbcUrl = "jdbc:mysql://localhost:3306/icc_jsp";
      String dbId = "root";
      String dbPwd = "abcd1234";
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
         // MySQL 드라이버 로드 (Connector/J 5.x)
         Class.forName("com.mysql.jdbc.Driver");
         // 데이터베이스 연결
         conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
         out.println("MySQL 연결 성공<br>");
         
         // SQL 쿼리 실행
         String sql = "SELECT * FROM user_Tbl";
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         
         // 결과를 HTML 테이블로 출력
         out.println("<table border='1'>");
         out.println("<tr><th>번호</th><th>아이디</th><th>비밀번호</th><th>이름</th></tr>");
         
         while(rs.next()) {
            String userNum = rs.getString("userNum");
            String userId = rs.getString("userId");
            String userPw = rs.getString("userPw");
            String userName = rs.getString("userName");
            out.println("<tr>");
            out.println("<td>" + userNum + "</td>");
            out.println("<td>" + userId + "</td>");
            out.println("<td>" + userPw + "</td>");
            out.println("<td>" + userName + "</td>");
            out.println("</tr>");
         }
         out.println("</table>");
   %>
</body>
</html>
