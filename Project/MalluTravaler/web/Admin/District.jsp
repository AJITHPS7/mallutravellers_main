<%-- 
    Document   : District
    Created on : Feb 19, 2021, 12:31:36 PM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <body>

        <%
            String dName = "", delid = "", edname = "", edid = "";

            dName = request.getParameter("txtdistrict");

            if (request.getParameter("btnsave") != null) {

                if (request.getParameter("txthid").equals("")) {

                    String ins = "insert into tbl_district(district_name) value('" + dName + "')";

                    if (con.executeCommand(ins)) {
                        out.println("<script>alert('saved!!')</script>");
                    }
                } else {
                    String up = "update tbl_district set district_name='" + dName + "' where district_id='" + request.getParameter("txthid") + "'";

                    if (con.executeCommand(up)) {
                        out.println("<script>alert('saved!!')</script>");
                    }

                }

            }

            delid = request.getParameter("deleteid");
            if (delid != null) {
                String del = "delete from tbl_district where district_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted");
                    response.sendRedirect("District.jsp");
                } else {
                    out.println("failed");
                }
            }
            if (request.getParameter("edid") != null) {
                String sel = "select * from tbl_district where district_id='" + request.getParameter("edid") + "'";
                ResultSet rs = con.selectCommand(sel);
                if (rs.next()) {

                    edid = rs.getString("district_id");
                    edname = rs.getString("district_name");
                }

            }


        %>





        <form method="post">
            <table align="center" border="1" cellpadding="10" style="border-collapse: collapse;">

                <tr>
                    <td>District</td> 



                    <td><input type="text" name="txtdistrict" value="<%=edname%>" required="" autocomplete="off"></td>
                    <td> <input type="hidden" name="txthid" value="<%=edid%>"></td>


                
                    <td><input type="submit" name="btnsave" value="Save"></td>
                    <td><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>

            </table>

        </form>
                    <hr>   
<br>
<table align="center" border="1" cellpadding="10">

    <tr>
        <td>SI.No</td>
        <td>DistrictName</td>
        <td>Action</td>
    </tr>
    <%
        int i = 0;
        String sel = "select * from tbl_district";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs.getString("district_name")%></td>
        <td><a href="District.jsp?deleteid=<%=rs.getString("district_id")%>">Delete</a>
        <a href="District.jsp?edid=<%=rs.getString("district_id")%>">Edit</a></td>

    </tr>
    <%
        }
    %>
</table>
</body>
</html>

