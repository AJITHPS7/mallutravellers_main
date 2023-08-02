<%-- 
    Document   : Place
    Created on : 19 Jan, 2020, 2:26:44 PM
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
             String district="",place="";
        district=request.getParameter("slct_district");
        place=request.getParameter("txtplace");
         if(request.getParameter("btnsave")!=null)
        {
           
                    String InsQry="insert into tbl_place(district_id,place_name)values('"+district+"','"+place+"')";
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
                        District
                    </td>
                   <td>
                       <select name="slct_district" required="">
                        <option value="" selected disabled>Choose District</option>
                       
                        <%
                String sel="select * from tbl_district";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                {
                    %>
                    <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%>
                    </option>
                    <%
                }
                %>
                    </select>
                </td>
                </tr>
                 <tr>
                    <td>
                       Place
                    </td>
                    <td>
                        <input type="text" name="txtplace" required="" autocomplete="off" pattern="[a-zA-Z. ]{4,20}" title="please fill correctly">
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
