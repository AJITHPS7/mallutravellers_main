package org.apache.jsp.Rider;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class ViewProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        ");

            String shid=request.getParameter("shid");
        
      out.write("\n");
      out.write("        <table align=\"center\" border=\"1\">\n");
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>SI.No</td>\n");
      out.write("        <td>Type</td>\n");
      out.write("        <td>SubType</td>\n");
      out.write("        <td>Brand</td>\n");
      out.write("        <td>Rate</td>\n");
      out.write("        <td>Image</td>\n");
      out.write("        <td>Name</td>\n");
      out.write("        <td>action</td>\n");
      out.write("        \n");
      out.write("    </tr>\n");
      out.write("    ");

        int i = 0;
        String sel1 = "select * from tbl_products p inner join tbl_productsubtype pst on p.productsubtype_id=pst.productsubtype_id  inner join tbl_producttype pt on pst.producttype_id=pt.producttype_id where shop_id='"+shid+"'";
        ResultSet rs1 = con.selectCommand(sel1);
        while (rs1.next()) {
            i++;
    
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs1.getString("producttype_name"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs1.getString("productsubtype_name"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs1.getString("product_brand"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs1.getString("product_rate"));
      out.write("</td>\n");
      out.write("        <td><img src=\"../Assets/ProductImage/");
      out.print(rs1.getString("product_image"));
      out.write("\" width=\"120\" height=\"120\"></td>\n");
      out.write("        <td>");
      out.print(rs1.getString("product_name"));
      out.write("</td>\n");
      out.write("        <td><a href=\"BuyProduct.jsp?pr=");
      out.print(rs1.getString("product_id"));
      out.write("\">Buy Product</a></td>\n");
      out.write("        ");

        }
        
      out.write("\n");
      out.write("        </table>\n");
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
