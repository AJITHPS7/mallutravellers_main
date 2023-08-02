<%-- 
    Document   : newclub
    Created on : Feb 19, 2021, 3:17:07 PM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NewClub</title>
    </head>
    <body>
      
        <form method="post" enctype="multipart/form-data" action="../ActionPages/NewClubAction.jsp">
            <table border="1" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" required="" pattern="([A-Za-z]{1,100})" autocomplete="off" autofocus=""></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" required="" pattern="([0-9]{10,10})" autocomplete="off" ></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" required="" autocomplete="off" ></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" required=""></textarea></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="district" required="">
                            <option>---Select---</option>
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
                    <td>Logo</td>
                    <td><input type="file" name="txtlogo" required=""></td>
                </tr>
                <tr>
                    <td>Proof</td>
                    <td><input type="file" name="txtproof" required=""></td>
                </tr>
                <tr>
                    <td>Lisence no</td>
                    <td><input type="text" name="txtlisence" required="" pattern="([0-9]{10})" autocomplete="off" ></td>
                </tr>
                <tr>
                    <td>User name</td>
                    <td><input type="text" name="txtusername" required="" autocomplete="off"></td>
                </tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" name="btnsub" value="SAVE"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
