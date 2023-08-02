<%-- 
    Document   : product_type
    Created on : Feb 20, 2021, 2:15:49 PM
    Author     : Ajay P S
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>producttype</title>
    </head>
    <body>
        <%
            String producttype = "";

            if (request.getParameter("btnsub") != null) {
                producttype = request.getParameter("txtproducttype");

                String ins = "insert into tbl_producttype(producttype_name) value('" + producttype + "')";

                if (con.executeCommand(ins)) {
                    out.println("<script>alert('saved!!')</script>");
                }
            }
            String delid="";
            delid=request.getParameter("delid");
            if((delid)!=null){
            String del="delete from tbl_producttype where producttype_id='"+delid+"'";
            if(con.executeCommand(del)){
                out.println("Deleted!!!");
                response.sendRedirect("ProdcutType.jsp");
            } 
            else {
                        out.println("Failed");
                        }
            
                    
        }
        %>
        <form method="post">
           <table border="1" align="center" cellpadding="10" style="border-collapse: ">
                <tr>
                    <th>Product type</th>
                    <td><input type="text" name="txtproducttype" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsub" value="SAVE"></td>
                </tr>
            </table>
        </form>
  
<br/>
<table align="center" border="1">
    <tr>
        <td>SI.No</td>
        <td>producttype_name</td>
        <td>Action</td>
    </tr>
    <%                int i = 0;
        String sel = "select * from tbl_producttype";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs.getString("producttype_name")%></td>
        <td><a href="ProdcutType.jsp?delid=<%=rs.getString("producttype_id")%>">Delete</a></td>

    </tr>
    <%
        }
    %>
</table>
    </body>
</html>
