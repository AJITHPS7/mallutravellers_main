package org.apache.jsp.Rider;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class EventDetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

     
     if(request.getParameter("btnsub")!=null){
     
     
         String ins="insert into tbl_eventbook(event_id,rider_id,eventbook_date)value('"+session.getAttribute("evid")+"','"+request.getParameter("rid")+"',curdate())";
        out.println(ins);
         if(con.executeCommand(ins))
         {
          
             out.print("Data Saved");
         
         }else{
         
         
             out.print("Insertion Failed");
         }
     
     
     
     
     }
     
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form>\n");
      out.write("            <table>\n");
      out.write("        \n");
      out.write("  <table border=\"1\" align=\"center\" cellpadding=\"10\" style=\"border-collapse:collapse; \">\n");
      out.write("                <tr>\n");
      out.write("                    <td>SI.No</td>\n");
      out.write("                    <td>name</td>\n");
      out.write("                    <td>District</td>\n");
      out.write("                    <td>Vehicle Type</td>\n");
      out.write("                    <td>Landmark 1</td>\n");
      out.write("                    <td>Landmark 2</td>\n");
      out.write("                    <td>Event Date</td>\n");
      out.write("                    <td>Rules</td>\n");
      out.write("                    <td>Entry Fees</td>\n");
      out.write("                    <td>offroadevent_type</td>\n");
      out.write("                    \n");
      out.write("                </tr>\n");
      out.write("                ");
                int i = 0;
            String evid=request.getParameter("evid");
            String sel2 = "select * from tbl_offroadevents o inner join tbl_district d on o.district_id=d.district_id inner join tbl_vehicletype vt on o.vehicletype_id=vt.vehicletype_id where offroadevent_id='"+evid+"'";
          
                    //                     out.print(sel2);
                    ResultSet rs3 = con.selectCommand(sel2);
                    while (rs3.next()) {
                        i++;
                    
     
     
 
          
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs3.getString("offroadevent_name"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs3.getString("district_name"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs3.getString("vehicletype_name"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs3.getString("district_location1"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs3.getString("district_location2"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs3.getString("offroadevent_date"));
      out.write("</td>\n");
      out.write("                    <td><img src=\"../Assets/Offroadeventrules/");
      out.print(rs3.getString("offroadevent_rules"));
      out.write("\" width=\"120\" height=\"120\"></td>\n");
      out.write("                    <td>");
      out.print(rs3.getString("offroadevent_regfees"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs3.getString("offroadevent_type"));
      out.write("</td>\n");
      out.write("                    ");

                    }
                    
      out.write("\n");
      out.write("                     <tr>\n");
      out.write("                    <td><input type=\"submit\" name=\"btnsub\" value=\"Book Now\"></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
