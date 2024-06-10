<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int nIDX = Integer.parseInt(request.getParameter("nIDX"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
    	Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icc_jsp", "root", "abcd1234");
        String sql = "SELECT * FROM ex_moon WHERE nIDX = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, nIDX);
        rs = pstmt.executeQuery();
        if (rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
<title>MODIFY</title>
</head>
<body>
<h2>수정 & 삭제</h2>
<form action="C_modifyOK_moon.jsp" method="post">
    <input type="hidden" name="nIDX" value="<%=nIDX%>">
    Name: <input type="text" name="vName" value="<%=rs.getString("vName")%>" maxlength="10" required><br>
    Phone: <input type="text" name="vPhone" value="<%=rs.getString("vPhone").replaceAll("(...)(....)(....)", "$1-$2-$3")%>" pattern="\d{3}-\d{4}-\d{4}" required><br>
    Group Number:
    <select name="nGroup" required>
        <option value="1" <%=rs.getInt("nGroup") == 1 ? "selected" : ""%>>가족</option>
        <option value="2" <%=rs.getInt("nGroup") == 2 ? "selected" : ""%>>학교</option>
        <option value="3" <%=rs.getInt("nGroup") == 3 ? "selected" : ""%>>기타</option>
    </select><br>
    <input type="submit" value="수정">
</form>
<form action="C_deleteOK_moon.jsp" method="post">
    <input type="hidden" name="nIDX" value="<%=nIDX%>">
    <input type="submit" value="삭제" onclick="return confirm('삭제 완료');">
</form>
</body>
</html>
<%
        } else {
            out.println("<p>No record found with the provided ID.</p>");
        }
    } catch(Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
%>
