<%-- 
    Document   : ViewShopList
    Created on : Mar 19, 2021, 2:24:58 PM
    Author     : Ajay P S
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
         String accid=request.getParameter("accid");
            if(accid!=null){
                String up="update tbl_shop set shop_status='1' where shop_id='"+accid+"'";
                if(con.executeCommand(up)){
                    response.sendRedirect("ViewShopList.jsp");
                }
            }
            String rej=request.getParameter("rej");
            if(rej!=null){
                String up="update tbl_shop set shop_status='2' where shop_id='"+rej+"'";
                if(con.executeCommand(up)){
                    response.sendRedirect("ViewShopList.jsp");
                }
            }
        
        
        %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <br>
       <table align="center" border="1" cellpadding="10" style="border-collapse:collapse;">

    <tr>
        <td>SI.No</td>
      <td>Name</td>
        <td>Contact</td>
        <td>Email</td>
        <td>Address</td>
        <td>Logo</td>
        <td>Proof</td>
         <td>District</td>
         <td>Place</td>
        <td>User Name</td>
        <td>Password</td>
        <td>Accept</td>
        <td>Reject</td>
        
    </tr>
    <%   int i = 0;
        String sel = "select * from tbl_shop where shop_status='0'";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs.getString("shop_name")%></td>
        <td><%=rs.getString("shop_contact")%></td>
        <td><%=rs.getString("shop_email")%></td>
        <td><%=rs.getString("shop_address")%></td>
        <td><img src="../Assets/ShopLogo/<%=rs.getString("shop_logo")%>" width="120" height="120"></td>
        <td><%=rs.getString("shop_proof")%></td>
        <td><%=rs.getString("district_id")%></td>
        <td><%=rs.getString("place_id")%></td>
        <td><%=rs.getString("shop_username")%></td>
        <td><%=rs.getString("shop_password")%></td>
        <td><a href="ViewShopList.jsp?accid=<%=rs.getString("shop_id")%>">Accept</a></td>
         <td><a href="ViewShopList.jsp?rej=<%=rs.getString("shop_id")%>">Reject</a></td>
    </tr>
    <%
        }
    %>
</table>
    </body>
</html>
