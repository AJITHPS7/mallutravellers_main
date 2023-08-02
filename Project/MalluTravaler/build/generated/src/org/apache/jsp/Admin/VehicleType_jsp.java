package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class VehicleType_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>vechicle_type</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");

            String vehicle_type = "", vTypeEdit = "", vID = "";

            String editid = "";
            editid = request.getParameter("edid");

            if (editid != null) {
                String sel1 = "select * from tbl_vehicletype where vehicletype_id='" + editid + "'";
                ResultSet rs1 = con.selectCommand(sel1);
                if (rs1.next()) {
                    vTypeEdit = rs1.getString("vehicletype_name");
                }
            }

            if (request.getParameter("btnSave") != null) {
                out.println("hai");
                vehicle_type = request.getParameter("txtVehicleType");
                vID = request.getParameter("txtID");
                out.print(vID);
                if (vID.contains("null")) {

                    String ins = "insert into tbl_vehicletype(vehicletype_name) values('" + vehicle_type + "')";
                    out.println(ins);
                    if (con.executeCommand(ins)) {
                        out.println("<script>alert('saved!!')</script>");
                        response.sendRedirect("VehicleType.jsp");
                    } else {
                        out.println(ins);
                    }

                } else {

                    String up = "update tbl_vehicletype set vehicletype_name='" + vehicle_type + "' where vehicletype_id='" + vID + "'";

                    if (con.executeCommand(up)) {
                        out.println("<script>alert('updated!!')</script>");
                        response.sendRedirect("VehicleType.jsp");
                    }
                }

            }

            String delid = "";
            delid = request.getParameter("delid");
            if (delid != null) {
                String del = " delete from tbl_vehicletype where vehicletype_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted!!!");
                    response.sendRedirect("VehicleType.jsp");
                } else {
                    out.println("failed");
                }
            }
        
      out.write("\n");
      out.write("\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"2\" align=\"center\" style=\"border-collapse:collapse;\" cellpadding=\"10\">\n");
      out.write("                <tr>\n");
      out.write("                    <th>Vehicle Type</th>\n");
      out.write("                    <td><input type=\"text\" name=\"txtVehicleType\" required=\"\" autocomplete=\"off\" value=\"");
      out.print(vTypeEdit);
      out.write("\">\n");
      out.write("                        <input type=\"hidden\" name=\"txtID\" value=\"");
      out.print(editid);
      out.write("\">\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\">\n");
      out.write("                        <input type=\"submit\" name=\"btnSave\" value=\"Save\">\n");
      out.write("                        <input type=\"reset\" name=\"btncancel\" value=\"Cancel\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    \n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<br>\n");
      out.write("<table align=\"center\" border=\"1\" align=\"center\" cellpadding=\"10\">\n");
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>Sl.No</td>\n");
      out.write("        <td>Vehicle Type</td>\n");
      out.write("        <td>Action</td>\n");
      out.write("    </tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    ");

        int i = 0;
        String sel = "select * from tbl_vehicletype";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("vehicletype_name"));
      out.write("</td>\n");
      out.write("        <td><a href=\"VehicleType.jsp?delid=");
      out.print(rs.getString("vehicletype_id"));
      out.write("\">Delete</a></td>\n");
      out.write("        <td><a href=\"VehicleType.jsp?edid=");
      out.print(rs.getString("vehicletype_id"));
      out.write("\">Edit</a></td>\n");
      out.write("\n");
      out.write("    </tr>\n");
      out.write("    ");

        }
    
      out.write("\n");
      out.write("</table>\n");
      out.write("    </body>\n");
      out.write("</html>");
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
