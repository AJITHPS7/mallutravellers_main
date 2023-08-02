package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class ComplaintType_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
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
      out.write("        <title>ComplaintType</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            String complainttype = "";

            if (request.getParameter("btnsub") != null) {

                String ins = "insert into tbl_complainttype(complainttype_name) value('" + request.getParameter("txtcomplaint") + "' )";

                if (con.executeCommand(ins)) {
                    out.println("<script>alert('saved!!')</script>");
                }
            }
            String delid = "";
            delid = request.getParameter("delid");
            if ((delid) != null) {
                String del = "delete from tbl_complainttype where complainttype_id='" + delid + "'";
                if (con.executeCommand(del)) {
                    out.println("Deleted");
                    response.sendRedirect("ComplaintType.jsp");
                } else {
                    out.println("failed");
                }
            }
        
      out.write("\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"2\" align=\"center\">\n");
      out.write("                <tr>\n");
      out.write("                    <th>Complaint Type</th>\n");
      out.write("                    <td><input type=\"text\" name=\"txtcomplaint\" required=\"\" autocomplete=\"off\"></td>\n");
      out.write("                </tr>\n");
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input type=\"submit\" name=\"btnsub\" value=\"Save\">\n");
      out.write("                        <input type=\"reset\" name=\"btnreset\" value=\"Cancel\"></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    \n");
      out.write("<br>\n");
      out.write("<table align=\"center\" border=\"1\">\n");
      out.write("    <tr>\n");
      out.write("        <td>SI.No</td>\n");
      out.write("        <td>ComplaintType</td>\n");
      out.write("    </tr>\n");
      out.write("    ");
                int i = 0;
        String sel = "select * from tbl_complainttype";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("complainttype_name"));
      out.write("</td>\n");
      out.write("        <td><a href=\"ComplaintType.jsp?delid=");
      out.print(rs.getString("complainttype_id"));
      out.write("\">Delete</a></td>\n");
      out.write("\n");
      out.write("    </tr>\n");
      out.write("    ");

        }
    
      out.write("\n");
      out.write("</table>\n");
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
