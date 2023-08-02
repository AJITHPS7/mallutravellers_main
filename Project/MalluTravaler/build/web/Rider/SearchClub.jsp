<%-- 
    Document   : SearchClub
    Created on : Apr 1, 2021, 2:40:13 PM
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
        <form method="post">
            <table align="center" border="1" style="border-collapse:collapse;" cellpadding="10">
    <tr>
        <td>District</td>
        <td><select name="seldistrict" required="">
                            <option>--select--</option>
                            <%            String sel = "select * from tbl_district";
                                ResultSet rs1 = con.selectCommand(sel);
                                while (rs1.next()) {

                            %>


                            <option value="<%=rs1.getString("district_id")%>"><%=rs1.getString("district_name")%></option>


                            <%
                                }
                            %>
         </select>
        </td>
    </tr>
    <tr>
        <td><input type="submit" name="btnsub" value="Search"></td>
    </tr>
            </table>
    </form>
        <table align="center" border="1" style="border-collapse:collapse;" cellpadding="10">

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
       
    </tr>
    <%
        int i = 0;
        String sell = "select * from tbl_club cl inner join tbl_district dis on cl.district_id=dis.district_id ";
        ResultSet rs = con.selectCommand(sell);
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
        
    </tr>
    <%
        }
    %>
</table>
    </body>
</html>

