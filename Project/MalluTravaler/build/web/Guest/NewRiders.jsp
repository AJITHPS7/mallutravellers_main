<%-- 
    Document   : Newriders
eb 19, 2021, 2:50:45 PM
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
        <title>JSP Page</title>
    </head>
    <body>

        <form method="post" enctype="multipart/form-data" action="../ActionPages/RiderUploadAction.jsp">
            <table border="1" cellpadding="10" style="border-collapse: collapse;">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname1" required="" pattern="([A-Za-z]{1,100})" autocomplete="off" autofocus="on"></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact1" required="" pattern="([0-9]{10,10})" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtmail" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="District" onchange="getplace(this.value)" required="">
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
                    <td>Place</td>
                    <td>
                        <select name="Place" id="Place" required="">
                            <option>---Select---</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" required=""></textarea></td>
                </tr>

                <tr>
                    <td>Vehicle type</td>
                    <td>
                        <select name="type" required="" autocomplete="off">
                            <option>---Select---</option>
                            <%            String sel1 = "select * from tbl_vehicletype";
                                ResultSet rs1 = con.selectCommand(sel1);
                                while (rs1.next()) {

                            %>


                            <option value="<%=rs1.getString("vehicletype_id")%>"><%=rs1.getString("vehicletype_name")%></option>


                            <%
                                }
                            %>


                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Vehicle Name</td>
                    <td><input type="text" name="vname" required="" autocomplete="off"></td>
                </tr>

                <td>Lisence no</td>
                <td><input type="text" name="txtlisenceno" required="" pattern="([0-9]{10})" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Lisence</td>
                    <td><input type="file" name="filelisence" required="" autocomplete="off"></td>
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
                    <td>Re-password</td>
                    <td><input type="password" name="txtrepassword" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="btnsub" value="Create Account"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
