<%-- 
    Document   : products
    Created on : Feb 20, 2021, 2:33:43 PM
    Author     : Ajay P S
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <script src="../Ajax/jQuery.js" type="text/javascript"></script>
          
         <script>
            function getSubType(a)
            {
//	alert(a);
                $.ajax({url:"../Ajax/AjaxSubType.jsp?disid="+a,
                success: function(result){
           // alert(result);
                $("#SubType").html(result);}});
}
</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            
            if(request.getParameter("stock")!=null)
            {
            session.setAttribute("id",request.getParameter("stock"));
            response.sendRedirect("ProdcutStock.jsp");
            }
            
            
            
            
            
            
         %>
        
        
        
        
        
        
        
        
        
        <form method="post" enctype="multipart/form-data" action="../ActionPages/ProductActionPage.jsp">
            <table border="2" cellpadding="10" align="center"style="border-collapse:collapse;">
                <tr>
                    <th>Type</th>
                    <td>
                        <select name="type" onchange="getSubType(this.value)" required="">
                            <option>---Select---</option>
                              <%           
                String sel = "select * from tbl_producttype";
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
                    <td>
                        <select name="SubType" id="SubType" required="">
                            <option>---Select---</option>
                             
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Brand</th>
                    <td><input type="text" name="txtbrand" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <th>Rate</th>
                    <td><input type="text" name="txtrate" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <th>Image</th>
                    <td><input type="file" name="txtfile" required=""></td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td><input type="text" name="txtname" required="" pattern="([A-Za-z]{1,100})" autocomplete="off"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" name="btnsub" value="Save"></td>
                </tr>
            </table>
        </form>
    
  <br>
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
        String sel1 = "select * from tbl_products";
        ResultSet rs1 = con.selectCommand(sel1);
        while (rs1.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs1.getString("product_id")%></td>
        <td><%=rs1.getString("productsubtype_id")%></td>
        <td><%=rs1.getString("product_brand")%></td>
        <td><%=rs1.getString("product_rate")%></td>
        <td><img src="../Assets/ProductImage/<%=rs1.getString("product_image")%>" width="120" height="120"></td>
        <td><%=rs1.getString("product_name")%></td>
        <td><a href="ManageProducts.jsp?stock=<%=rs1.getString("product_id")%>">add product stock</a></td>
        
    </tr>
    <%
        }
    %>
</table>
    </body>
</html>

