<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icc_jsp", "root", "abcd1234");
        String sql = "SELECT * FROM ex_moon";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<title>Member List</title>
</head>
<body>
<h2>Member List</h2>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Phone</th>
        <th>Group</th>
    </tr>
<%
        while (rs.next()) {
            String groupName = (rs.getInt("nGroup") == 1 ? "Family" : rs.getInt("nGroup") == 2 ? "School" : "Other");
%>
    <tr>
        <td><a href="C_modify_moon.jsp?nIDX=<%=rs.getInt("nIDX")%>"><%=rs.getString("vName")%></a></td>
        <td><%=rs.getString("vPhone")%></td>
        <td><%=groupName%></td>
    </tr>
<%
        }
%>
</table>
</body>
</html>
<%
    } catch(Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
