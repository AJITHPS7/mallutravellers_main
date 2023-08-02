package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Login</title>\n");
      out.write("    </head>\n");
      out.write("    ");

        String uname="", pass="";
        if(request.getParameter("btn_login")!=null)
        {
            uname=request.getParameter("uname");
            pass=request.getParameter("pass");
           
            //select query start
            
            
            String user="select * from tbl_users where user_username='"+uname+"' and user_password='"+pass+"'";
            ResultSet rs=con.selectCommand(user);
            
            //select quary end
            //select query start
            
            
            String rider="select * from tbl_riders where riders_username='"+uname+"' and riders_password='"+pass+"'";
            ResultSet rs1=con.selectCommand(rider);
            
            //select quary end
            String club="select * from tbl_club where club_username='"+uname+"' and club_password='"+pass+"'";
            ResultSet rs2=con.selectCommand(club);
            
            
            
            String shop="select * from tbl_shop where shop_username='"+uname+"' and shop_password='"+pass+"' and shop_status='1'";
            ResultSet rs3=con.selectCommand(shop);
            if(rs.next())
            {
                session.setAttribute("uid",rs.getString("user_id"));
                session.setAttribute("uname",rs.getString("user_name"));
                response.sendRedirect("../User/HomePage.jsp");
            }
            else if(rs1.next())
             {
                session.setAttribute("rid",rs1.getString("riders_id"));
                session.setAttribute("uname",rs1.getString("riders_name"));
                response.sendRedirect("../Rider/HomePage.jsp");
            }        
             else if(rs2.next())
             {
                session.setAttribute("cid",rs2.getString("club_id"));
                session.setAttribute("uname",rs2.getString("club_name"));
                response.sendRedirect("../Club/HomePage.jsp");
            }  
               else if(rs3.next())
             {
                session.setAttribute("sid",rs3.getString("shop_id"));
                session.setAttribute("uname",rs3.getString("shop_name"));
                response.sendRedirect("../Shop/HomePage.jsp");
            }           
            else
            {
                out.println("<script>alert('Invalid User')</script>");
            }
        }
    
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("        <form method=\"post\">\n");
      out.write("            <table border=\"1\" align=\"center\" cellpadding=\"10\" style=\"border-collapse: \">\n");
      out.write("                <tr>\n");
      out.write("                    <td>User Name</td>\n");
      out.write("                    <td><input type=\"text\" name=\"uname\"></td>\n");
      out.write("                </tr> \n");
      out.write("                <tr>\n");
      out.write("                    <td>Password</td>\n");
      out.write("                    <td><input type=\"text\" name=\"pass\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"submit\" name=\"btn_login\" value=\"Login\"></td>\n");
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
