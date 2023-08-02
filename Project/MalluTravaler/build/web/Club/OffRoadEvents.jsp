<%-- 
    Document   : offroadevent
    Created on : Feb 19, 2021, 7:44:39 PM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OffRoadEvents</title>
    </head>
    <body>
     
            
        <form method="post" enctype="multipart/form-data" action="../ActionPages/OffRoadEventAction.jsp">
            <table border="1" align="center" cellpadding="10" style="border-collapse:collapse; ">
                <tr> 
                    <td>Name</td>
                    <td><input type="text" name="txtname" required="" pattern="([A-Za-z]{1,100})" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td>
                        <select name="seldistrict" required="">
                            <option>--select--</option>
                            <%            String sel = "select * from tbl_district";
                                ResultSet rs= con.selectCommand(sel);
                                while (rs.next()) {

                            %>


                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%
                                }
                             %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Landmark 1</td>
                    <td><input type="text" name="txtlandmark1" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Landmark 2</td>
                    <td><input type="text" name="txtlandmark2" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Event Date</td>
                    <td><input type="date" name="txteventdate" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Rules</td>
                    <td><input type="file" name="filerules" required=""></td>
                </tr>
               
                <tr>
                    <td>Entry Fee</td>
                    <td><input type="text" name="txtoffroadeventreg" required="" autocomplete="off"></td>
                </tr>
                <tr>
                    <td>Offroadevent Type</td>
                    <td>
                        <select name="offftype" required="">
                            <option>---select---</option>
                            <option>mud race</option>
                            <option>4*4</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Allowed Vehicles</td>
                    <td>
                        <select name="vehicle type" required="">
                            <option>---Select---</option>
                              <%           String sel1 = "select * from tbl_vehicletype";
                                ResultSet rs1 = con.selectCommand(sel1);
                                while (rs1.next()) {

                            %>
                            <option value="<%=rs1.getString("vehicletype_id")%>"><%=rs1.getString("vehicletype_name")%></option>
                            <%
                                }
                                %>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2"><input type="submit" name="btnsub" value="Add Events"></td>
                </tr>
                
            </table>
        </form>
  
                                <br>
                                <br>
                                <br>
  <table border="1" align="center" cellpadding="10" style="border-collapse:collapse; ">
                <tr>
                    <td>SI.No</td>
                    <td>name</td>
                    <td>District</td>
                    <td>Vehicle Type</td>
                    <td>Landmark 1</td>
                    <td>Landmark 2</td>
                    <td>Event Date</td>
                    <td>Rules</td>
                    <td>Entry Fees</td>
                    <td>offroadevent_type</td>
                    <td>Action</td>
                    <td>Action</td>
                    <td>Action</td>
                </tr>
                <%                int i = 0;
                    String sel2 = "select * from tbl_offroadevents o inner join tbl_district d on o.district_id=d.district_id inner join tbl_vehicletype vt on o.vehicletype_id=vt.vehicletype_id where club_id='"+session.getAttribute("cid")+"'";
//                     out.print(sel2);
                    ResultSet rs3 = con.selectCommand(sel2);
                    while (rs3.next()) {
                        i++;
                    
     
 
          %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs3.getString("offroadevent_name")%></td>
                    <td><%=rs3.getString("district_name")%></td>
                    <td><%=rs3.getString("vehicletype_name")%></td>
                    <td><%=rs3.getString("district_location1")%></td>
                    <td><%=rs3.getString("district_location2")%></td>
                    <td><%=rs3.getString("offroadevent_date")%></td>
                    <td><img src="../Assets/Offroadeventrules/<%=rs3.getString("offroadevent_rules")%>" width="120" height="120"></td>
                    <td><%=rs3.getString("offroadevent_regfees")%></td>
                    <td><%=rs3.getString("offroadevent_type")%></td>
                    <td><a href="EventPrize.jsp?selectevent=<%=rs3.getString("offroadevent_id")%>">set prize</a></td>
                    <td><a href="EventGallery.jsp?eventgallery=<%=rs3.getString("offroadevent_id")%>">set event Gallery</a></td>
                    <td><a href="EventParticipance.jsp?eventparticipant=<%=rs3.getString("offroadevent_id")%>">Participands</a></td>
                    <td><a href="OffRoadEvent.jsp?delid=<%=rs3.getString("offroadevent_id")%>">Delete</a></td>



                </tr>
                <%
                    }
                %>
            </table>
    </body>
</html>
