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
<title>MySQL ���� ����̹� �׽�Ʈ</title>
</head>
<body>
   <h1>MySQL ���� ����̹� �׽�Ʈ</h1>
   <%
      String jdbcUrl = "jdbc:mysql://localhost:3306/icc_jsp";
      String dbId = "root";
      String dbPwd = "abcd1234";
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
         // MySQL ����̹� �ε� (Connector/J 5.x)
         Class.forName("com.mysql.jdbc.Driver");
         // �����ͺ��̽� ����
         conn = DriverManager.getConnection(jdbcUrl, dbId, dbPwd);
         out.println("MySQL ���� ����<br>");
         
         // SQL ���� ����
         String sql = "SELECT * FROM user_Tbl";
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         
         // ����� HTML ���̺�� ���
         out.println("<table border='1'>");
         out.println("<tr><th>��ȣ</th><th>���̵�</th><th>��й�ȣ</th><th>�̸�</th></tr>");
         
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
