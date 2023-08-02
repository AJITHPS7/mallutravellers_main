<%-- 
    Document   : Company
    Created on : 29 Jan, 2020, 7:46:28 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DatabaseConnection.ConnectionClass" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <%@include file="Links.jsp" %>

    </head>
    <body>
                <%@include file="Header.jsp" %>

      <%
             String company_name="",vehicletype="";
        company_name=request.getParameter("txtcompany");
        vehicletype=request.getParameter("slct_type");
         if(request.getParameter("btnsave")!=null)
        {
           
                    String InsQry="insert into tbl_vehiclecompany(company_name,vehicle_type_id)values('"+company_name+"','"+vehicletype+"')";
                    boolean b=obj.executeCommand(InsQry);
                    if(b==true)
                    {
                    %>
                        <script>alert('success')</script>
                  <%
                
                    }
                    else
                    {
                        out.println("fail");
                    }
        }
                    %>
      
        <form>
            <table>
                <tr>
                    <td>
                       Type
                    </td>
                   <td>
                       <select name="slct_type" required="">
                        <option value="" selected disabled>---Select---</option>
                       
                        <%
                String sel2="select * from tbl_vehicletype";
                ResultSet rs2=obj.selectCommand(sel2);
                while(rs2.next())
                {
                    %>
                    <option value="<%=rs2.getString("vehicle_type_id")%>"><%=rs2.getString("vehicle_type_name")%>
                    </option>
                    <%
                }
                %>
                    </select>
                </td>
                </tr>
                <tr>
                    <td>
                       Company Name
                    </td>
                    <td>
                        <input type="text" name="txtcompany" required="" autocomplete="off" pattern="[a-zA-Z. ]{4,20}" title="please fill correctly">
                    </td>
                </tr>
                
                <tr>
                <td>
                   
                    <input type="submit" name="btnsave" value="SAVE">
                </td>
           
                <td>
                   
                    <input type="submit" name="btncancel" value="CANCEL">
                </td>
            </tr>
            </table>
        </form>
                                <%@include file="Footer.jsp" %>

    </body>
</html>
