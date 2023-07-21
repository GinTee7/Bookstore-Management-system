package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"mystyle.css\" type=\"text/css\"/>\n");
      out.write("        <title>BookStore</title> \n");
      out.write("    </head>\n");
      out.write("    <body class=\"header-login\">\n");
      out.write("        <header class=\"header\">\n");
      out.write("            <nav class=\"navbar\">\n");
      out.write("                \n");
      out.write("                    <a href=\"\"><img src=\"images/logo.png\" id=\"logo\"></a>\n");
      out.write("                    <a href=\"mainController?action=\">Home</a>  \n");
      out.write("                    <a href=\"registration.jsp\">Register</a>\n");
      out.write("                    <a href=\"login.jsp\">Login</a>\n");
      out.write("                    <a href=\"mainController?action=viewcart\">View cart</a>\n");
      out.write("                    \n");
      out.write("                        <form action=\"mainController\" method=\"post\" class=\"search-bar\">\n");
      out.write("                            <input type=\"text\" name=\"txtsearch\" placeholder=\"Search...\" value=\"");
      out.print( (request.getParameter("txtsearch")==null)?"":request.getParameter("txtsearch") );
      out.write("\">\n");
      out.write("                        <select name=\"searchby\">\n");
      out.write("                            <option value=\"byname\">by name</option>\n");
      out.write("                            <option value=\"bycate\">by category</option>\n");
      out.write("                        </select>\n");
      out.write("                        <input type=\"submit\" value=\"search\" name=\"action\">\n");
      out.write("                    </form>\n");
      out.write("                    \n");
      out.write("                \n");
      out.write("            </nav>\n");
      out.write("        </header>\n");
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
