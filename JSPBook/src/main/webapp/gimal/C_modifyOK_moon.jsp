<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    int nIDX = Integer.parseInt(request.getParameter("nIDX"));
    String vName = request.getParameter("vName");
    String vPhone = request.getParameter("vPhone").replaceAll("-", "");
    int nGroup = Integer.parseInt(request.getParameter("nGroup"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/icc_jsp", "root", "abcd1234");
        String sql = "UPDATE ex_moon SET vName = ?, vPhone = ?, nGroup = ? WHERE nIDX = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, vName);
        pstmt.setString(2, vPhone);
        pstmt.setInt(3, nGroup);
        pstmt.setInt(4, nIDX);
        pstmt.executeUpdate();
    } catch(Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
    response.sendRedirect("C_list_moon.jsp");
%>
