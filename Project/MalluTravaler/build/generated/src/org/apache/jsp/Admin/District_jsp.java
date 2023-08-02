package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class District_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>District</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");

            String dName = "", delid = "", edname = "", edid = "";

            dName = request.getParameter("txtdistrict");

            if (request.getParameter("btnsave") != null) {

                if (request.getParameter("txthid").equals("")) {

                    String ins = "insert into tbl_district(district_name) value('" + dName + "')";

                    if (con.executeCommand(ins)) {
                        out.println("<script>alert('saved!!')</script>");
                    }
                } else {
                    String up = "update tbl_district set district_name='" + dName + "' where district_id='" + request.getParameter("txthid") + "'";

                    if (con.executeCommand(up)) {
                        out.println("<script>alert('saved!!')</script>");
                    }

                }

            }

            delid = request.getParameter("deleteid");
            if (delid != null) {
                String del = "delete from tbl_district where district_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted");
                    response.sendRedirect("District.jsp");
                } else {
                    out.println("failed");
                }
            }
            if (request.getParameter("edid") != null) {
                String sel = "select * from tbl_district where district_id='" + request.getParameter("edid") + "'";
                ResultSet rs = con.selectCommand(sel);
                if (rs.next()) {

                    edid = rs.getString("district_id");
                    edname = rs.getString("district_name");
                }

            }


        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table align=\"center\" border=\"1\" cellpadding=\"10\" style=\"border-collapse: collapse;\">\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>District</td> \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <td><input type=\"text\" name=\"txtdistrict\" value=\"");
      out.print(edname);
      out.write("\" required=\"\" autocomplete=\"off\"></td>\n");
      out.write("                    <td> <input type=\"hidden\" name=\"txthid\" value=\"");
      out.print(edid);
      out.write("\"></td>\n");
      out.write("\n");
      out.write("\n");
      out.write("                \n");
      out.write("                    <td><input type=\"submit\" name=\"btnsave\" value=\"Save\"></td>\n");
      out.write("                    <td><input type=\"reset\" name=\"btncancel\" value=\"Cancel\"></td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("                    <hr>   \n");
      out.write("<br>\n");
      out.write("<table align=\"center\" border=\"1\" cellpadding=\"10\">\n");
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>SI.No</td>\n");
      out.write("        <td>DistrictName</td>\n");
      out.write("        <td>Action</td>\n");
      out.write("    </tr>\n");
      out.write("    ");

        int i = 0;
        String sel = "select * from tbl_district";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("district_name"));
      out.write("</td>\n");
      out.write("        <td><a href=\"District.jsp?deleteid=");
      out.print(rs.getString("district_id"));
      out.write("\">Delete</a>\n");
      out.write("        <a href=\"District.jsp?edid=");
      out.print(rs.getString("district_id"));
      out.write("\">Edit</a></td>\n");
      out.write("\n");
      out.write("    </tr>\n");
      out.write("    ");

        }
    
      out.write("\n");
      out.write("</table>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
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
