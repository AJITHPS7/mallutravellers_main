<%-- 
    Document   : productsub_type
    Created on : Feb 20, 2021, 2:28:03 PM
    Author     : Ajay P S
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>productsubtype</title>
    </head>
    <body>
        <%
            String producttype_name = "";
            String productsubtype_name = "";

            if (request.getParameter("btnsub") != null) {
                producttype_name = request.getParameter("txttype");
                productsubtype_name = request.getParameter("txtsubtype");

                String ins = "insert into tbl_productsubtype(producttype_id,productsubtype_name) value('" + producttype_name + "','" + productsubtype_name +"')";

                if (con.executeCommand(ins)) {
                    out.println("<script>alert('saved!!')</script>");
                }
            }
            String delid = "";
            delid = request.getParameter("delid");
            if (delid != null) {
                String del = " delete from tbl_productsubtype where productsubtype_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted!!!");
                    response.sendRedirect("ProductSubType.jsp");
                } else {
                    out.println("failed");
                }
            }
           
            
        %>
        <form method="post">
            <table border="1" align="center" cellpadding="10" style="border-collapse: ">
                <tr>
                    <th>Type</th>
                    <td>
                        <select name="txttype" required="">
                            <option>---Select---</option>
                            <%              
        String sel = "select * from  tbl_producttype";
     
        ResultSet rs = con.selectCommand(sel);
        
        while (rs.next()) {
            
    %>
    
        
    <option value="<%=rs.getString("producttype_id")%>"><%=rs.getString("producttype_name")%></option>

    
    <%
        }
    %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Subtype</th>
                    <td><input type="text" name="txtsubtype" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btnsub" value="SAVE">
                    <input type="reset" name="btncancel" value="Cancel"></td>
                </tr>
            </table>
        </form>
    
 <table align="center" border="1">
    <tr>
        <td>SI.No</td>
        <td>Type</td>
        <td>Subtype</td>
        <td>Action</td>
    </tr>
    <%                int i = 0;
        String sel1 = "select * from tbl_productsubtype s inner join tbl_producttype t on s.producttype_id=t.producttype_id";
        ResultSet rs1 = con.selectCommand(sel1);
        while (rs1.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs1.getString("producttype_name")%></td>
        <td><%=rs1.getString("productsubtype_name")%></td>
        <td><a href="ProductSubType.jsp?delid=<%=rs1.getString("productsubtype_id")%>">Delete</a></td>
        
        

    </tr>
    <%
        }
    %>
</table>

 
    </body>
</html>
