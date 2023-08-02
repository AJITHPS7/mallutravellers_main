<%-- 
    Document   : newshop
    Created on : Feb 20, 2021, 11:44:17 AM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <script src="../Ajax/jQuery.js" type="text/javascript"></script>
    <script>
        function getplace(a)
        {
            //alert(a);
            $.ajax({url: "../Ajax/AjaxPlace.jsp?disid=" + a,
                success: function(result) {
                    // alert(result);
                    $("#Place").html(result);
                }});
        }
    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NewShop</title>
    </head>
    <body>
        <form method="POST" enctype="multipart/form-data" action="../ActionPages/NewShopAction.jsp">
            <table border="2"cellpadding="10" style="border-collapse: collapse;">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" required="" pattern="([A-Za-z]{1,100})"  autocomplete="off" autofocus=""></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" required="" pattern="([0-9]{10,10})" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtemail" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" required=""></textarea></td>
                </tr>
                <tr>
                    <td>Logo</td>
                    <td><input type="file" name="filelogo" required=""></td>
                </tr>
                <tr>
                    <td>Proof</td>
                    <td><input type="file" name="fileproof" required=""></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="district" onchange="getplace(this.value)" required="">
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
                <tr>
                    <td>Place</td>
                    <td>
                        <select name="Place" id="Place" required="">
                            <option>---Select---</option>

                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="txtusername" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsub" value="SAVE"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
