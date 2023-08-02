<%-- 
    Document   : clubgalary
    Created on : Feb 19, 2021, 7:36:34 PM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ClubGallery</title>
    </head>
    <body>
        <%
        String caption ="",image ="";
        if(request.getParameter("btnSave")!= null) {
            caption=request.getParameter("txtcaption");
            image=request.getParameter("fileimage");
            String ins = "insert into tbl_clubgallery(clubgalary_image,clubgalary_caption) value('"+ image +"','"+ caption +"')";
        
        if(con.executeCommand(ins)){
            out.println("<script>alert('saved!!')</script>");
        }
        }
        String delid="";
        delid=request.getParameter("delid");
        if((delid)!=null){
            String del= "delete from tbl_clubgallery where clubgalary_id='"+delid+"'";
                if(con.executeCommand(del)){
                    out.println("Deleted");
                    response.sendRedirect("ClubGallery.jsp");
                }else{
                    out.println("failed");
                }
        }
        %>
        <form method="post" enctype="multipart/form-data" action="../ActionPages/ClubGalleryAction.jsp">
            <table border="2">
                <tr>
                    <td>caption</td>
                    <td><input type="text" name="txtcaption" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>image</td>
                    <td><input type="file" name="fileimage" required=""></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnSave" value="save"></td>
                </tr>
            </table>
        </form>
   

        <hr>
<br>
<table align="center" border="1">


    <tr>
        <td>SI.No</td>
        <td>image</td>
        <td>caption</td>
        <td>Action</td>
    </tr>
    <%              
        int i = 0;
        String sel = "select * from tbl_clubgallery";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><img src="../Assets/CubGallery/<%=rs.getString("clubgalary_image")%>" width="120" height="120"></td>
        <td><%=rs.getString("clubgalary_caption")%></td>
        <td><a href="ClubGallery.jsp?delid=<%=rs.getString("clubgalary_id")%>">Delete</a></td>

    </tr>
    <%
        }
    %>
</table>
    </body>
</html>
