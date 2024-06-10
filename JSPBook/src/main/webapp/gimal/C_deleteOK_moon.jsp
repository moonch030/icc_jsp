<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int nIDX = Integer.parseInt(request.getParameter("nIDX"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
    	Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icc_jsp", "root", "abcd1234");
        String sql = "DELETE FROM ex_moon WHERE nIDX = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, nIDX);
        pstmt.executeUpdate();
    } catch(Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
    response.sendRedirect("C_list_moon.jsp");
%>
