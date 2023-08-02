<%-- 
    Document   : eventprize
    Created on : Feb 19, 2021, 7:58:07 PM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Prize</title>
    </head>
    <body>
        <%
            String position = "", prize= "",delid="";

            if (request.getParameter("btnsub") != null) {
                position = request.getParameter("txtposition");
                prize=request.getParameter("txtprize");
                String ins = "insert into tbl_eventprize(eventprize_position,eventprize_prize,offroadevent_id) value('" +position+ "','"+prize+"','"+request.getParameter("selectevent")+"')";

                if (con.executeCommand(ins)) {
                    out.println("<script>alert('saved!!')</script>");
                }
            }
            
            
            
            delid=request.getParameter("deleteid");
            if(delid!=null){
                String del="delete from tbl_eventprize where eventprize_id='"+delid+"'";
                if(con.executeCommand(del)){
                    out.println("Deleted");
                    response.sendRedirect("EventPrize.jsp");
                }else{
                    out.println("failed");
                }
            }

        %>

        <form method="post">
             <table border="1" align="center" cellpadding="10" style="border-collapse: ">
                <tr>
                    <td>position</td>
                    <td><input type="text" name="txtposition" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>prize</td>
                    <td><input type="text" name="txtprize" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsub" value="SAVE"></td>
                </tr>
            </table>
        </form>
        <hr>
<br>
<table align="center" border="1">


    <tr>
        <td>SI.No</td>
        <td>position</td>
        <td>prize</td>
        <td>offroadevent_id</td>
        <td>Action</td>
    </tr>
    <%              
            
        int i = 0;
        String sel = "select * from  tbl_eventprize";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs.getString("eventprize_position")%></td>
        <td><%=rs.getString("eventprize_prize")%></td>
        <td><%=rs.getString("offroadevent_id")%></td>
        <td><a href="EventPrize.jsp?deleteid=<%=rs.getString("eventprize_id")%>">Delete</a></td>

    </tr>
    <%
        }
    %>
</table>
    </body>
</html>


