<%-- 
    Document   : vechicle_type
    Created on : Feb 19, 2021, 12:58:31 PM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>vechicle_type</title>
    </head>
    <body>

        <%
            String vehicle_type = "", vTypeEdit = "", vID = "";

            String editid = "";
            editid = request.getParameter("edid");

            if (editid != null) {
                String sel1 = "select * from tbl_vehicletype where vehicletype_id='" + editid + "'";
                ResultSet rs1 = con.selectCommand(sel1);
                if (rs1.next()) {
                    vTypeEdit = rs1.getString("vehicletype_name");
                }
            }

            if (request.getParameter("btnSave") != null) {
                out.println("hai");
                vehicle_type = request.getParameter("txtVehicleType");
                vID = request.getParameter("txtID");
                out.print(vID);
                if (vID.contains("null")) {

                    String ins = "insert into tbl_vehicletype(vehicletype_name) values('" + vehicle_type + "')";
                    out.println(ins);
                    if (con.executeCommand(ins)) {
                        out.println("<script>alert('saved!!')</script>");
                        response.sendRedirect("VehicleType.jsp");
                    } else {
                        out.println(ins);
                    }

                } else {

                    String up = "update tbl_vehicletype set vehicletype_name='" + vehicle_type + "' where vehicletype_id='" + vID + "'";

                    if (con.executeCommand(up)) {
                        out.println("<script>alert('updated!!')</script>");
                        response.sendRedirect("VehicleType.jsp");
                    }
                }

            }

            String delid = "";
            delid = request.getParameter("delid");
            if (delid != null) {
                String del = " delete from tbl_vehicletype where vehicletype_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted!!!");
                    response.sendRedirect("VehicleType.jsp");
                } else {
                    out.println("failed");
                }
            }
        %>

        <form method="post">
            <table border="2" align="center" style="border-collapse:collapse;" cellpadding="10">
                <tr>
                    <th>Vehicle Type</th>
                    <td><input type="text" name="txtVehicleType" required="" autocomplete="off" value="<%=vTypeEdit%>">
                        <input type="hidden" name="txtID" value="<%=editid%>">
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="btnSave" value="Save">
                        <input type="reset" name="btncancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    
<br>
<br>
<br>
<table align="center" border="1" align="center" cellpadding="10">

    <tr>
        <td>Sl.No</td>
        <td>Vehicle Type</td>
        <td>Action</td>
    </tr>



    <%
        int i = 0;
        String sel = "select * from tbl_vehicletype";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs.getString("vehicletype_name")%></td>
        <td><a href="VehicleType.jsp?delid=<%=rs.getString("vehicletype_id")%>">Delete</a></td>
        <td><a href="VehicleType.jsp?edid=<%=rs.getString("vehicletype_id")%>">Edit</a></td>

    </tr>
    <%
        }
    %>
</table>
    </body>
</html>