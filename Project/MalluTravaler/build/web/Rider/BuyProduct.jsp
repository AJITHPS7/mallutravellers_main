<%-- 
    Document   : BuyProduct
    Created on : Apr 7, 2021, 11:38:21 AM
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
            String pr=request.getParameter("pr");
        %>
            <form method="post">
                <table border="1" align="center" cellpadding="10" style="border-collapse:collapse;">>
                <tr>
                <td>Product Name</td>
                <td><input type="text" name="txtproductname" required="" pattern="([A-Za-z]{1,100})" autocomplete="off"></td>
            </tr>
            <tr>
                <td>Product Quantity</td>
                <td><input type="text" name="txtquantity" required="" autocomplete="off"></td>
            </tr>
            <tr>
                <td>Grand Total</td>
                <td><input type="text" name="txttotal" required="" autocomplete="off"></td>
            </tr>
            <tr>
                <td><input type="submit" name="btnorder" value="Order">
                <input type="reset" name="btnorder" value="Cancel"></td>
            </tr>
           
        </table>
            </form>
    </body>
</html>
