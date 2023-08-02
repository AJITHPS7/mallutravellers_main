package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class ProdcutType_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>producttype</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            String producttype = "";

            if (request.getParameter("btnsub") != null) {
                producttype = request.getParameter("txtproducttype");

                String ins = "insert into tbl_producttype(producttype_name) value('" + producttype + "')";

                if (con.executeCommand(ins)) {
                    out.println("<script>alert('saved!!')</script>");
                }
            }
            String delid="";
            delid=request.getParameter("delid");
            if((delid)!=null){
            String del="delete from tbl_producttype where producttype_id='"+delid+"'";
            if(con.executeCommand(del)){
                out.println("Deleted!!!");
                response.sendRedirect("ProdcutType.jsp");
            } 
            else {
                        out.println("Failed");
                        }
            
                    
        }
        
      out.write("\n");
      out.write("        <form method=\"post\">\n");
      out.write("           <table border=\"1\" align=\"center\" cellpadding=\"10\" style=\"border-collapse: \">\n");
      out.write("                <tr>\n");
      out.write("                    <th>Product type</th>\n");
      out.write("                    <td><input type=\"text\" name=\"txtproducttype\" required=\"\" autocomplete=\"off\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"submit\" name=\"btnsub\" value=\"SAVE\"></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("  \n");
      out.write("<br/>\n");
      out.write("<table align=\"center\" border=\"1\">\n");
      out.write("    <tr>\n");
      out.write("        <td>SI.No</td>\n");
      out.write("        <td>producttype_name</td>\n");
      out.write("        <td>Action</td>\n");
      out.write("    </tr>\n");
      out.write("    ");
                int i = 0;
        String sel = "select * from tbl_producttype";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("producttype_name"));
      out.write("</td>\n");
      out.write("        <td><a href=\"ProdcutType.jsp?delid=");
      out.print(rs.getString("producttype_id"));
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
