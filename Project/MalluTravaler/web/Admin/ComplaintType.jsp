<%-- 
    Document   : complaint_type
    Created on : Feb 19, 2021, 12:47:24 PM
    Author     : Ajay P S
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ComplaintType</title>
    </head>
    <body>
        <%
            String complainttype = "";

            if (request.getParameter("btnsub") != null) {

                String ins = "insert into tbl_complainttype(complainttype_name) value('" + request.getParameter("txtcomplaint") + "' )";

                if (con.executeCommand(ins)) {
                    out.println("<script>alert('saved!!')</script>");
                }
            }
            String delid = "";
            delid = request.getParameter("delid");
            if ((delid) != null) {
                String del = "delete from tbl_complainttype where complainttype_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted");
                    response.sendRedirect("ComplaintType.jsp");
                } else {
                    out.println("failed");
                }
            }
        %>
        <form method="post">
            <table border="2" align="center">
                <tr>
                    <th>Complaint Type</th>
                    <td><input type="text" name="txtcomplaint" required="" autocomplete="off"></td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsub" value="Save">
                        <input type="reset" name="btnreset" value="Cancel"></td>
                </tr>
            </table>
        </form>
    
<br>
<table align="center" border="1">
    <tr>
        <td>SI.No</td>
        <td>ComplaintType</td>
    </tr>
    <%                int i = 0;
        String sel = "select * from tbl_complainttype";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs.getString("complainttype_name")%></td>
        <td><a href="ComplaintType.jsp?delid=<%=rs.getString("complainttype_id")%>">Delete</a></td>

    </tr>
    <%
        }
    %>
</table>
    </body>
</html>
