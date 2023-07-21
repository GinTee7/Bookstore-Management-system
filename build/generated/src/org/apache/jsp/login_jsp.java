package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

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
      out.write("        <title>Index</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"mystyle.css\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <header>\n");
      out.write("            ");
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
      out.write("\n");
      out.write("                <a href=\"\"><img src=\"images/logo.png\" id=\"logo\"></a>\n");
      out.write("                <a href=\"mainController?action=\">Home</a>  \n");
      out.write("<!--                <a href=\"registration.jsp\">Register</a>-->\n");
      out.write("                <a href=\"login.jsp\">Login</a>\n");
      out.write("                <a href=\"mainController?action=viewcart\">View cart</a>\n");
      out.write("\n");
      out.write("                <form action=\"mainController\" method=\"post\" class=\"search-bar\">\n");
      out.write("                    <input type=\"text\" name=\"txtsearch\" placeholder=\"Search Book\" value=\"");
      out.print( (request.getParameter("txtsearch") == null) ? "" : request.getParameter("txtsearch"));
      out.write("\">\n");
      out.write("                    <select name=\"searchby\" class=\"selection\">\n");
      out.write("                        <option value=\"byname\">by name</option>\n");
      out.write("                        <option value=\"bycate\">by category</option>\n");
      out.write("                    </select>\n");
      out.write("                    <button><i class='bx bx-search' value=\"search\" name=\"action\"></i></button>\n");
      out.write("                    \n");
      out.write("                </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </nav>\n");
      out.write("        </header>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        </header>   \n");
      out.write("        <section>\n");
      out.write("            <div class=\"background\"></div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"item\">\n");
      out.write("                    \n");
      out.write("                    <div class=\"text-item\">\n");
      out.write("                        <h2>Welcome! <br><span>\n");
      out.write("                                To Book Store <3\n");
      out.write("                            </span></h2>\n");
      out.write("                        <p>Helpful Books In the World</p>\n");
      out.write("                        <div class=\"social-icon\">\n");
      out.write("                            <a href=\"#\"><i class='bx bxl-facebook'></i></a>\n");
      out.write("                            <a href=\"#\"><i class='bx bxl-twitter'></i></a>\n");
      out.write("                            <a href=\"#\"><i class='bx bxl-youtube'></i></a>\n");
      out.write("                            <a href=\"#\"><i class='bx bxl-instagram'></i></a>\n");
      out.write("                            <a href=\"#\"><i class='bx bxl-linkedin'></i></a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"login-section\">\n");
      out.write("                        <div class=\"form-box login\">\n");
      out.write("                            <form action=\"mainController\" method=\"post\" >\n");
      out.write("                                <font style='color:red'>");
      out.print( (request.getAttribute("WARNING") == null) ? "" : (String) request.getAttribute("WARNING"));
      out.write("</font>\n");
      out.write("                                <h2>Sign In</h2>\n");
      out.write("                                <div class=\"input-box\">\n");
      out.write("                                    <span class=\"icon\"><i class='bx bxs-envelope'></i></span>\n");
      out.write("                                    <input type=\"text\" name=\"txtemail\" required>\n");
      out.write("                                        <label >Email</label>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"input-box\">\n");
      out.write("                                    <span class=\"icon\"><i class='bx bxs-lock-alt' ></i></span>\n");
      out.write("                                    <input type=\"password\" name=\"txtpassword\" required>\n");
      out.write("                                    <label>Password</label>\n");
      out.write("                                </div>\n");
      out.write("                                <button type=\"submit\" value=\"login\" name=\"action\" class=\"btn\">Login in</button>\n");
      out.write("                                <input type=\"checkbox\" value=\"savelogin\" name=\"savelogin\">Stayed signed in\n");
      out.write("                                <div class=\"create-account\">\n");
      out.write("                                    <p> <a href=\"registration.jsp\" class=\"register-link\">Create A New Account?</a></p>\n");
      out.write("                                </div>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("        </section>\n");
      out.write("        <footer>\n");
      out.write("            ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Footer Page</title>\n");
      out.write("<!--        <link rel=\"stylesheet\" href=\"mycss.css\" type=\"text/css\"/>-->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <p>Copyright &copy; 2023</p>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        </footer>\n");
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
