<%--
    Document   : Place
    Created on : Feb 19, 2021, 12:39:59 PM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>place</title>
    </head>
    <body>
        <%
            String delid = "";
            String district = "";
            String place = "";

            if (request.getParameter("btnsave") != null) {
                district = request.getParameter("seldistrict");
                place = request.getParameter("txtplace");

                String ins = "insert into tbl_place(district_id,place_name) value('" + district + "','" + place + "')";

                if (con.executeCommand(ins)) {
                    out.println("<script>alert('saved!!')</script>");
                }
            }

             delid = request.getParameter("delid");
            if (delid != null) {
                String del = "delete from tbl_place where place_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted");
                    response.sendRedirect("Place.jsp");
                } else {
                    out.println("failed");
                }

            }
        %>

        <form method="post">
             <table border="1" align="center" cellpadding="10" style="border-collapse: ">
                <tr>
                    <td>District</td> 


                    <td>

                        <select name="seldistrict" required="">
                            <option>--select--</option>
                            <%            String sel = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {

                            %>


                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>


                            <%
                                }
                            %>

                        </select>
                    </td>

                </tr>
                <tr>
                    <td>Place</td> 
                    <td><input type="text" name="txtplace" required="" autocomplete="off"></td>



                </tr>

                <tr>
                    <td><input type="submit" name="btnsave" value="Save"></td>
                    <td><input type="reset" name="btncancel" value="Cancel"></td>
                </tr>

            </table>
                              </form>
 
<br>
<br>

            <table align="center" border="1">
                <tr>
                    <td>SI.No</td>
                    <td>District</td>
                    <td>Place</td>
                    <td>Action</td>
                </tr>
                <%                int i = 0;
                    String sel1 = "select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
                    ResultSet rs1 = con.selectCommand(sel1);
                    while (rs1.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs1.getString("district_name")%></td>
                    <td><%=rs1.getString("place_name")%></td>
                    <td><a href="Place.jsp?delid=<%=rs1.getString("place_id")%>">Delete</a></td>



                </tr>
                <%
                    }
                %>
            </table>
    </body>
</html>
