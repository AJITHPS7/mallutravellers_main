<%-- 
    Document   : tripalbum
    Created on : Feb 20, 2021, 2:54:06 PM
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
        
        <%
            String delid = "";
            String album_tittle = "";
            String album_date = "";

            if (request.getParameter("btnsub") != null) {
                album_tittle = request.getParameter("txtalbumtittle");
                album_date = request.getParameter("txtdate");

                String ins = "insert into tbl_album(album_tittle,album_date,rider_id) value('" + album_tittle + "','" + album_date + "','"+session.getAttribute("rid")+"')";

                if (con.executeCommand(ins)) {
                    out.println("<script>alert('saved!!')</script>");
                }
            }

             delid = request.getParameter("delid");
            if (delid != null) {
                String del = "delete from tbl_album where album_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted");
                    response.sendRedirect("TripAlbum.jsp");
                } else {
                    out.println("failed");
                }

            }
        %>
        <form method="post">
            <table border="2">
                <tr>
                    <th>Albumtittle</th>
                    <td><input type="text" name="txtalbumtittle" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <th>Date</th>
                    <td><input type="date" name="txtdate" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsub" value="SAVE"></td>
                </tr>
                
            </table>
        </form>
  
                              <br>
                                <br>
  <table border="1" align="center" cellpadding="10" style="border-collapse:collapse; ">
                <tr>
                    <td>SI.No</td>
                    <td>Album tittle</td>
                    <td>Album date</td>
                    <td>Riders id</td>
                    <td>Action</td>
                    <td>Action</td>
                </tr>
              <%
        int i = 0;
        String sel1 = "select * from tbl_album";
        ResultSet rs1 = con.selectCommand(sel1);
        while (rs1.next()) {
            i++;
    %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs1.getString("album_tittle")%></td>
                    <td><%=rs1.getString("album_date")%></td>
                    <td><%=rs1.getString("rider_id")%></td>
                   <td><a href="TripMedia.jsp?media=<%=rs1.getString("album_id")%>">Album media</a></td>
                    <td><a href="TripAlbum.jsp?delid=<%=rs1.getString("album_id")%>">Delete</a></td>



                </tr>
                <%
                    }
                %>
            </table>
    </body>
</html>

