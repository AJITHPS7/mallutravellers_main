package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class ViewShopList_jsp extends org.apache.jasper.runtime.HttpJspBase
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

         String accid=request.getParameter("accid");
            if(accid!=null){
                String up="update tbl_shop set shop_status='1' where shop_id='"+accid+"'";
                if(con.executeCommand(up)){
                    response.sendRedirect("ViewShopList.jsp");
                }
            }
            String rej=request.getParameter("rej");
            if(rej!=null){
                String up="update tbl_shop set shop_status='2' where shop_id='"+rej+"'";
                if(con.executeCommand(up)){
                    response.sendRedirect("ViewShopList.jsp");
                }
            }
        
        
        
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       <br>\n");
      out.write("       <table align=\"center\" border=\"1\" cellpadding=\"10\" style=\"border-collapse:collapse;\">\n");
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>SI.No</td>\n");
      out.write("      <td>Name</td>\n");
      out.write("        <td>Contact</td>\n");
      out.write("        <td>Email</td>\n");
      out.write("        <td>Address</td>\n");
      out.write("        <td>Logo</td>\n");
      out.write("        <td>Proof</td>\n");
      out.write("         <td>District</td>\n");
      out.write("         <td>Place</td>\n");
      out.write("        <td>User Name</td>\n");
      out.write("        <td>Password</td>\n");
      out.write("        <td>Accept</td>\n");
      out.write("        <td>Reject</td>\n");
      out.write("        \n");
      out.write("    </tr>\n");
      out.write("    ");
   int i = 0;
        String sel = "select * from tbl_shop where shop_status='0'";
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("shop_name"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("shop_contact"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("shop_email"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("shop_address"));
      out.write("</td>\n");
      out.write("        <td><img src=\"../Assets/ShopLogo/");
      out.print(rs.getString("shop_logo"));
      out.write("\" width=\"120\" height=\"120\"></td>\n");
      out.write("        <td>");
      out.print(rs.getString("shop_proof"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("district_id"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("place_id"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("shop_username"));
      out.write("</td>\n");
      out.write("        <td>");
      out.print(rs.getString("shop_password"));
      out.write("</td>\n");
      out.write("        <td><a href=\"ViewShopList.jsp?accid=");
      out.print(rs.getString("shop_id"));
      out.write("\">Accept</a></td>\n");
      out.write("         <td><a href=\"ViewShopList.jsp?rej=");
      out.print(rs.getString("shop_id"));
      out.write("\">Reject</a></td>\n");
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
