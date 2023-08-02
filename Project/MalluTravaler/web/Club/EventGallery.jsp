<%-- 
    Document   : eventgalery
    Created on : Feb 19, 2021, 8:03:26 PM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Galery</title>
    </head>
    <body>
        
        <%
            session.setAttribute("evid",request.getParameter("eventgallery"));
            String delid = "";
            String caption = "";
            String image = "";
            String update ="";
            String offroadevent_id="";
           

             delid = request.getParameter("delid");
            if (delid != null) {
                String del = "delete from tbl_eventgallary where eventgallery_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted");
                    response.sendRedirect("Place.jsp");
                } else {
                    out.println("failed");
                }

            }
        %>
        <form enctype="multipart/form-data" action="../ActionPages/EventGalleryAction.jsp" method="post">
            
          <table border="1" align="center" cellpadding="10" style="border-collapse: ">
             
              <tr>
                    <td>caption</td>
                    <td><input type="text" name="txtcaption" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>image</td>
                    <td><input type="file" name="fileimage" required=""></td>
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
                    <td>offroadevent_id</td>
                    <td>caption</td>
                    <td>image</td>
                    <td>Action</td>
                </tr>
                <%
        int i = 0;
        String sel1 = "select * from tbl_eventgallary";
        ResultSet rs1 = con.selectCommand(sel1);
        while (rs1.next()) {
            i++;
    %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs1.getString("offroadevent_id")%></td>
                    <td><%=rs1.getString("offroadevent_caption")%></td>
                    <td><img src="../Assets/Image/<%=rs1.getString("offroadevent_image")%>" width="120" height="120"></td>
                    <td><%=rs1.getString("offroadevent_update")%></td>
                    <td><a href="EventGallery.jsp?delid=<%=rs1.getString("eventgallery_id")%>">Delete</a></td>



                </tr>
                <%
                    }
                %>
            </table>
</body>
</html>
