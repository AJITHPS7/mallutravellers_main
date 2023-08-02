<%-- 
    Document   : Tripmedia
    Created on : Feb 20, 2021, 2:58:59 PM
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
        <%  String delid = "";
            delid = request.getParameter("delid");
            if (delid != null) {
                String del = "delete from tbl_albummedia where album_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted");
                    response.sendRedirect("TripAlbum.jsp");
                } else {
                    out.println("failed");
                }

            }
        %>
        <form method="post" enctype="multipart/form-data" action="../ActionPages/AlbumMediaAction.jsp">>
            <table border="2">
                <tr>
                    <th>Caption</th>
                    <td><input type="text" name="txtcaption" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <th>Image</th>
                    <td><input type="file" name="fileimage" required="">
                    <input type="hidden" name="hid" value="<%=request.getParameter("media")%>">
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsub" value="SAVE"></td>
                </tr>
            </table>
        </form>
  
<table border="1" align="center" cellpadding="10" style="border-collapse:collapse; ">
    <tr>
        <td>SI.No</td>
        <td>Album caption</td>
        <td>Album image</td>
        <td>Album id</td>
        <td>Action</td>
    </tr>
    <%
        int i = 0;
        String sel1 = "select * from tbl_albummedia am inner join tbl_album a on am.album_id=a.album_id";
        ResultSet rs1 = con.selectCommand(sel1);
        while (rs1.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs1.getString("albummedia_caption")%></td>
        <td><img src="../Assets/TripAlbum/<%=rs1.getString("albummedia_image")%>" width="120" height="120"></td>
        <td><%=rs1.getString("album_tittle")%></td>
        <td><a href="TripMedia.jsp?delid=<%=rs1.getString("albummedia_id")%>">Delete</a></td>

    </tr>
    <%
        }
    %>
</table>
</body>
</html>

