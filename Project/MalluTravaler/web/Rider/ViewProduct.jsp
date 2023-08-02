<%-- 
    Document   : BuyProduct
    Created on : Apr 7, 2021, 11:14:41 AM
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
            String shid=request.getParameter("shid");
        %>
        <table align="center" border="1">

    <tr>
        <td>SI.No</td>
        <td>Type</td>
        <td>SubType</td>
        <td>Brand</td>
        <td>Rate</td>
        <td>Image</td>
        <td>Name</td>
        <td>action</td>
        
    </tr>
    <%
        int i = 0;
        String sel1 = "select * from tbl_products p inner join tbl_productsubtype pst on p.productsubtype_id=pst.productsubtype_id  inner join tbl_producttype pt on pst.producttype_id=pt.producttype_id where shop_id='"+shid+"'";
        ResultSet rs1 = con.selectCommand(sel1);
        while (rs1.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs1.getString("producttype_name")%></td>
        <td><%=rs1.getString("productsubtype_name")%></td>
        <td><%=rs1.getString("product_brand")%></td>
        <td><%=rs1.getString("product_rate")%></td>
        <td><img src="../Assets/ProductImage/<%=rs1.getString("product_image")%>" width="120" height="120"></td>
        <td><%=rs1.getString("product_name")%></td>
        <td><a href="BuyProduct.jsp?pr=<%=rs1.getString("product_id")%>">Buy Product</a></td>
        <%
        }
        %>
        </table>
    </body>
</html>