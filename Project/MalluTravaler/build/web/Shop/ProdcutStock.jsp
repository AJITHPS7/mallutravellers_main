<%-- 
    Document   : productstock
    Created on : Feb 20, 2021, 2:49:55 PM
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
            String product_id="",Quantity = "", delid = "",productdate="",edid="",edname="";
   
            Quantity = request.getParameter("txtquantity");
       

            if (request.getParameter("btnsub") != null)
            {
                if (request.getParameter("ihid").equals("")) {

                String ins = "insert into tbl_productstock(product_id,productstock_quantity,productstock_date) value('"+session.getAttribute("id")+"','"+Quantity+"',curdate())";;
                 out.println(ins);

                    if (con.executeCommand(ins)) {
                        out.println("<script>alert('saved!!')</script>");
                    }
                } 
            else
                {
                    String up = "update tbl_productstock set productstock_quantity='" + Quantity + "' where productstock_id='" + request.getParameter("ihid") + "'";

                    if (con.executeCommand(up)) {
                        out.println("<script>alert('saved!!')</script>");
                    }
                }
            }
            delid = request.getParameter("deleteid");
            if (delid != null) {
                String del = "delete from tbl_productstock where productstock_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted");
                    response.sendRedirect("ProductStock.jsp");
                } else {
                    out.println("failed");
                }
            }
            
            if (request.getParameter("eid") != null) {
                String sel = "select * from tbl_productstock where productstock_id='" + request.getParameter("eid") + "'";
                ResultSet rs = con.selectCommand(sel);
                if (rs.next()) {

                    edid = rs.getString("productstock_id");
                    edname = rs.getString("productstock_quantity");
                }
        }
        %>

        <form method="post">
            <table border="2" cellpadding="10" align="center"style="border-collapse:collapse;">
                
         
                <tr>
                    <td>Quantity</td>
                <input type="hidden" id="ihid" name="ihid" value="<%=edid%>">
                    <td><input type="text" name="txtquantity" required="" autocomplete="off" value="<%=edname%>"></td>
                </tr>
              
                <tr>

                    <td><input type="submit" name="btnsub" value="SAVE"></td>
                </tr>
            </table>
        </form>
   
<br>
<br>

<table align="center" border="1">

    <tr>
        <td>SI.No</td>
        <td>Quantity</td>
        
    </tr>
    <%
        int i = 0;
        String sel1 = "select * from tbl_productstock";
        ResultSet rs1 = con.selectCommand(sel1);
        while (rs1.next()) {
            i++;
    %>
    <tr>
        <td><%=i%></td>
        <td><%=rs1.getString("productstock_quantity")%></td>
        <td><a href="ProdcutStock.jsp?deleteid=<%=rs1.getString("productstock_id")%>">Delete</a></td>
       <td><a href="ProdcutStock.jsp?eid=<%=rs1.getString("productstock_id")%>">Edit</a></td>
       
        
    </tr>
    <%
        }
    %>
</table>
    </body>
</html>


