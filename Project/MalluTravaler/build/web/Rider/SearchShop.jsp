<%-- 
    Document   : SearchShop
    Created on : Apr 1, 2021, 12:39:26 PM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                    <td><input type="submit" name="btnsearch" value="Search"><td>
                </tr>
                <%
                    int count = 0;

                    if (request.getParameter("seldistrict") != null) {

                        String sele = "select * from tbl_shop sp inner join tbl_place pl on sp.place_id=pl.place_id where sp.district_id='" + request.getParameter("seldistrict") + "'";
                        //out.print(sele);
                        ResultSet rs1 = con.selectCommand(sele);
                        while (rs1.next()) {
                            count = count + 1;
                %>



                <td>
                    <img src="../Assets/NewClubLogo//<%=rs1.getString("shop_logo")%>" alt="<%=rs1.getString("shop_logo")%>" width="120" height="120">
                    <br>
                    Name:<%=rs1.getString("shop_name")%>
                    <br>
                    Contact:<%=rs1.getString("shop_contact")%>
                    <br>
                    Email:<%=rs1.getString("shop_email")%>
                <td><a href="ViewProduct.jsp?shid=<%=rs1.getString("shop_id")%>">view product</a></td>
                </td>

                <%
                    if (count == 3) {
                        count = 0;

                %>


                <%                       }
                        }
                    }
                %>
            </table>
    </body>
</html>
