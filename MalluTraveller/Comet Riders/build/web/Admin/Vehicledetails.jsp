<%-- 
    Document   : Vehicledetails
    Created on : 29 Jan, 2020, 7:52:44 PM
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

        
        <script src="../Assets/jQuery.js"></script>
        
        
        <script>
            
    function getCompany(vType)
{
        //alert(vType);
	
	$.ajax(
		{
			url:"../Assets/AjaxVtype.jsp?type="+vType,
			success:function(result)
			{
				$("#slct_company").html(result);
				
			}
		});
}


    </script>

    </head>
    <body>
                <%@include file="Header.jsp" %>

      <%
             String vehicle_type="",vehicle_company="",vehicle_name="";
              vehicle_name=request.getParameter("txtname");
               vehicle_company=request.getParameter("slct_company");
            vehicle_type=request.getParameter("slct_type");
         if(request.getParameter("btnsave")!=null)
        {
           
                    String InsQry="insert into tbl_vehicledetails(vehicle_name,company_id,vehicle_type_id)values('"+vehicle_name+"','"+vehicle_company+"','"+vehicle_type+"')";
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
            <table border="1" cellpadding="2" align="center">
                <tr>
                    <td>
                        Vehicle Type
                    </td>
                   <td>
                       <select name="slct_type" onchange="getCompany(this.value)" required="">
                        <option value="" selected disabled >---Select---</option>
                       
                        <%
                String sel="select * from tbl_vehicletype";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                {
                    %>
                    <option value="<%=rs.getString("vehicle_type_id")%>"><%=rs.getString("vehicle_type_name")%>
                    </option>
                    <%
                }
                %>
                    </select>
                </td>
                </tr>
                <tr>
                    <td>
                        Vehicle Company
                    </td>
                   <td>
                       <select name="slct_company" id="slct_company" required="">
                       
                       
                     
                    </select>
                </td>
                </tr>
                <tr>
                    <td>
                       Vehicle Name
                    </td>
                    <td>
                        <input type="text" name="txtname" required="" autocomplete="off" pattern="[a-zA-Z.]{4,20}" title="please fill correctly">
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
