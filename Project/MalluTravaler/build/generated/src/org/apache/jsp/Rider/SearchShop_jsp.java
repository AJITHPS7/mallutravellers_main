package org.apache.jsp.Rider;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class SearchShop_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"1\" align=\"center\" cellpadding=\"10\" style=\"border-collapse: \">\n");
      out.write("                <tr>\n");
      out.write("                    <td>District</td> \n");
      out.write("\n");
      out.write("\n");
      out.write("                    <td>\n");
      out.write("\n");
      out.write("                        <select name=\"seldistrict\" required=\"\">\n");
      out.write("                            <option>--select--</option>\n");
      out.write("                            ");
            String sel = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(sel);
                                while (rs.next()) {

                            
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <option value=\"");
      out.print(rs.getString("district_id"));
      out.write('"');
      out.write('>');
      out.print(rs.getString("district_name"));
      out.write("</option>\n");
      out.write("\n");
      out.write("\n");
      out.write("                            ");

                                }
                            
      out.write("\n");
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"submit\" name=\"btnsearch\" value=\"Search\"><td>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    int count = 0;

                    if (request.getParameter("seldistrict") != null) {

                        String sele = "select * from tbl_shop sp inner join tbl_place pl on sp.place_id=pl.place_id where sp.district_id='" + request.getParameter("seldistrict") + "'";
                        //out.print(sele);
                        ResultSet rs1 = con.selectCommand(sele);
                        while (rs1.next()) {
                            count = count + 1;
                
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                <td>\n");
      out.write("                    <img src=\"../Assets/NewClubLogo//");
      out.print(rs1.getString("shop_logo"));
      out.write("\" alt=\"");
      out.print(rs1.getString("shop_logo"));
      out.write("\" width=\"120\" height=\"120\">\n");
      out.write("                    <br>\n");
      out.write("                    Name:");
      out.print(rs1.getString("shop_name"));
      out.write("\n");
      out.write("                    <br>\n");
      out.write("                    Contact:");
      out.print(rs1.getString("shop_contact"));
      out.write("\n");
      out.write("                    <br>\n");
      out.write("                    Email:");
      out.print(rs1.getString("shop_email"));
      out.write("\n");
      out.write("                <td><a href=\"ViewProduct.jsp?shid=");
      out.print(rs1.getString("shop_id"));
      out.write("\">view product</a></td>\n");
      out.write("                </td>\n");
      out.write("\n");
      out.write("                ");

                    if (count == 3) {
                        count = 0;

                
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                ");
                       }
                        }
                    }
                
      out.write("\n");
      out.write("            </table>\n");
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
