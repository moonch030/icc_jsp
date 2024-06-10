<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String vName = request.getParameter("vName");
    String vPhone = request.getParameter("vPhone");
    int nGroup = Integer.parseInt(request.getParameter("nGroup"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icc_jsp", "root", "abcd1234");
        
        String sql = "INSERT INTO ex_moon (vName, vPhone, nGroup, dRegDate) VALUES (?, ?, ?, NOW())";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, vName);
        pstmt.setString(2, vPhone);
        pstmt.setInt(3, nGroup);
        pstmt.executeUpdate();
    } catch(Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
    response.sendRedirect("C_list_moon.jsp");
%>
