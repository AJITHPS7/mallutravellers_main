<%-- 
    Document   : Login
    Created on : Mar 13, 2021, 2:18:27 PM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <%
        String uname="", pass="";
        if(request.getParameter("btn_login")!=null)
        {
            uname=request.getParameter("uname");
            pass=request.getParameter("pass");
           
            //select query start
            
            
            String user="select * from tbl_users where user_username='"+uname+"' and user_password='"+pass+"'";
            ResultSet rs=con.selectCommand(user);
            
            //select quary end
            //select query start
            
            
            String rider="select * from tbl_riders where riders_username='"+uname+"' and riders_password='"+pass+"'";
            ResultSet rs1=con.selectCommand(rider);
            
            //select quary end
            String club="select * from tbl_club where club_username='"+uname+"' and club_password='"+pass+"'";
            ResultSet rs2=con.selectCommand(club);
            
            
            
            String shop="select * from tbl_shop where shop_username='"+uname+"' and shop_password='"+pass+"' and shop_status='1'";
            ResultSet rs3=con.selectCommand(shop);
            if(rs.next())
            {
                session.setAttribute("uid",rs.getString("user_id"));
                session.setAttribute("uname",rs.getString("user_name"));
                response.sendRedirect("../User/HomePage.jsp");
            }
            else if(rs1.next())
             {
                session.setAttribute("rid",rs1.getString("riders_id"));
                session.setAttribute("uname",rs1.getString("riders_name"));
                response.sendRedirect("../Rider/HomePage.jsp");
            }        
             else if(rs2.next())
             {
                session.setAttribute("cid",rs2.getString("club_id"));
                session.setAttribute("uname",rs2.getString("club_name"));
                response.sendRedirect("../Club/HomePage.jsp");
            }  
               else if(rs3.next())
             {
                session.setAttribute("sid",rs3.getString("shop_id"));
                session.setAttribute("uname",rs3.getString("shop_name"));
                response.sendRedirect("../Shop/HomePage.jsp");
            }           
            else
            {
                out.println("<script>alert('Invalid User')</script>");
            }
        }
    %>
    <body>
        <br>
        <br>
        <br>
        <br>
        
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: ">
                <tr>
                    <td>User Name</td>
                    <td><input type="text" name="uname"></td>
                </tr> 
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="pass"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btn_login" value="Login"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
