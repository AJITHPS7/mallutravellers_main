<%-- 

    Document   : newuser
    Created on : Feb 19, 2021, 2:23:51 PM
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
                $.ajax({url:"../Ajax/AjaxPlace.jsp?disid="+a,
                success: function(result){
           // alert(result);
                $("#Place").html(result);}});
}
</script>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New user</title>
    </head>
    <body>
        <%
            String delid = "";
            String name = "";
            String contact="";
            String email="";
            String address="";
            String district="";
            String Place="";
            String username="";
            String password="";
            String repassword= "";

            if (request.getParameter("btnsub") != null) {
                name = request.getParameter("txtname");
                contact = request.getParameter("txtcontact");
                email = request.getParameter("txtmail");
                address = request.getParameter("txtaddress");
                district = request.getParameter("District");
                Place = request.getParameter("Place");
                username = request.getParameter("txtusername");
                password = request.getParameter("txtpassword");
                repassword = request.getParameter("txtrepassword");
                String ins = "insert into tbl_users(user_name,user_contact,user_email,user_address,district_id,place_id,user_username,user_password,user_repassword) value('" + name + "','" + contact + "','"+ email +"','"+ address +"','"+ district +"','"+ Place +"','"+ username +"','"+ password +"','"+ repassword +"')";
                //out.println(ins);
                if (con.executeCommand(ins)) {
                    out.println("<script>alert('saved!!')</script>");
                }
            }
        %>
        <form method="post"> 
            <table border="1" align="center" cellpadding="10" style="border-collapse: ">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" required="" pattern="([A-Za-z]{1,100})" autocomplete="off" autofocus=""></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" required="" pattern="([0-9]{10,10})" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="email" name="txtmail" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><textarea name="txtaddress" required=""></textarea></td>
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
                    <td>User Name</td>
                    <td><input type="text" name="txtusername" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="txtpassword" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Re-password</td>
                    <td><input type="text" name="txtrepassword" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsub" value="SAVE">
                    <input type="reset" name="btncancel" value="CANCEL"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
