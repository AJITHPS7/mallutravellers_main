<%-- 
    Document   : ViewClubList
    Created on : Mar 19, 2021, 2:24:47 PM
    Author     : Ajay P S
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
         String accid=request.getParameter("accid");
            if(accid!=null){
                String up="update tbl_club set club_status='1' where club_id='"+accid+"'";
                if(con.executeCommand(up)){
                    response.sendRedirect("ViewClubList.jsp");
                }
            }
            String rej=request.getParameter("rej");
            if(rej!=null){
                String up="update tbl_club set club_status='2' where club_id='"+rej+"'";
                if(con.executeCommand(up)){
                    response.sendRedirect("ViewClubList.jsp");
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
<table align="center" border="1">

    <tr>
        <td>SI.No</td>
        <td>Name</td>
        <td>Contact</td>
        <td>Email</td>
        <td>Address</td>
        <td>District</td>
        <td>Logo</td>
        <td>Proof</td>
        <td>Lisence No</td>
        <td>User Name</td>
        <td>Password</td>
        <td>Accept</td>
        <td>Reject</td>
    </tr>
    <%
        int i = 0;
        String sel = "select * from tbl_club";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs.getString("club_name")%></td>
        <td><%=rs.getString("club_contact")%></td>
        <td><%=rs.getString("club_email")%></td>
        <td><%=rs.getString("club_address")%></td>
        <td><%=rs.getString("district_id")%></td>
        <td><%=rs.getString("club_logo")%></td>
        <td><%=rs.getString("club_proof")%></td>
        <td><%=rs.getString("club_licno")%></td>
        <td><%=rs.getString("club_username")%></td>
        <td><%=rs.getString("club_password")%></td>
        <td><a href="ViewShopList.jsp?accid=<%=rs.getString("club_id")%>">Accept</a></td>
         <td><a href="ViewShopList.jsp?rej=<%=rs.getString("club_id")%>">Reject</a></td>
    </tr>
    <%
        }
    %>
</table>
    </body>
</html>
