package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\r');
      out.write('\n');


Object data = session.getAttribute("AdminID");
Object typedata = session.getAttribute("type");

int userId = -1;
String type = null;
if (data != null && typedata!=null)
    userId = Integer.parseInt(data.toString());

if(userId==-1)
{
    response.sendRedirect("./login.jsp");
}

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("  <meta charset=\"UTF-8\">\r\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("  <title>Urban Closet Dashboard | Dashboard</title>\r\n");
      out.write("  <!-- Favicon -->\r\n");
      out.write("  <link rel=\"shortcut icon\" href=\"./img/svg/logo.svg\" type=\"image/x-icon\">\r\n");
      out.write("  <!-- Custom styles -->\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"./css/style.min.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"./css/icon.css\">\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"./css/alert.css\">\r\n");
      out.write("\r\n");
      out.write("  <script src=\"js/jquery-3.6.0.min.js \"></script>\r\n");
      out.write("  <!--<link rel=\"stylesheet\" href=\"./css/bootstrap.min.css\">-->\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css\" integrity=\"sha512-xnP2tOaCJnzp2d2IqKFcxuOiVCbuessxM6wuiolT9eeEJCyy0Vhcwa4zQvdrZNVqlqaxXhHqsSV1Ww7T2jSCUQ==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\r\n");
      out.write("  <style>\r\n");
      out.write("    .sidebar\r\n");
      out.write("    {\r\n");
      out.write("      background-color: #5252ed;\r\n");
      out.write("    }\r\n");
      out.write("  </style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body ng-app=\"App\">\r\n");
      out.write("  <div class=\"layer\"></div>\r\n");
      out.write("<!-- ! Body -->\r\n");
      out.write("<a class=\"skip-link sr-only\" href=\"#skip-target\">Skip to content</a>\r\n");
      out.write("<div class=\"page-flex\">\r\n");
      out.write("  <!-- ! Sidebar -->\r\n");
      out.write("  <aside class=\"sidebar\" >\r\n");
      out.write("    <div class=\"sidebar-start\">\r\n");
      out.write("        <div class=\"sidebar-head\">\r\n");
      out.write("            <a href=\"/\" class=\"logo-wrapper\" title=\"Home\">\r\n");
      out.write("                <span class=\"sr-only\">Home</span>\r\n");
      out.write("                <span class=\"icon logo\" aria-hidden=\"true\"></span>\r\n");
      out.write("                <div class=\"logo-text\">\r\n");
      out.write("                    <span class=\"logo-title\">Urban Closet</span>\r\n");
      out.write("                    <span class=\"logo-subtitle\">Admin-Dashboard</span>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("            </a>\r\n");
      out.write("            <button class=\"sidebar-toggle transparent-btn\" title=\"Menu\" type=\"button\">\r\n");
      out.write("                <span class=\"sr-only\">Toggle menu</span>\r\n");
      out.write("                <span class=\"icon menu-toggle\" aria-hidden=\"true\"></span>\r\n");
      out.write("            </button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"sidebar-body\">\r\n");
      out.write("            <ul class=\"sidebar-body-menu\">\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a class=\"active\" href=\"#/\"><span class=\"icon home\" aria-hidden=\"true\"></span>Dashboard</a>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a class=\"show-cat-btn\" href=\"##\">\r\n");
      out.write("                        <span class=\"icon document\" aria-hidden=\"true\"></span>Products\r\n");
      out.write("                        <span class=\"category__btn transparent-btn\" title=\"Open list\">\r\n");
      out.write("                            <span class=\"sr-only\">Open list</span>\r\n");
      out.write("                            <span class=\"icon arrow-down\" aria-hidden=\"true\"></span>\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <ul class=\"cat-sub-menu\">\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"#manageproduct\">Manage All Products</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"#addproduct\" id=\"ap\">Add new Products</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li>\r\n");
      out.write("                    <a class=\"show-cat-btn\" href=\"##\">\r\n");
      out.write("                        <span class=\"icon folder\" aria-hidden=\"true\"></span>Categories\r\n");
      out.write("                        <span class=\"category__btn transparent-btn\" title=\"Open list\">\r\n");
      out.write("                            <span class=\"sr-only\">Open list</span>\r\n");
      out.write("                            <span class=\"icon arrow-down\" aria-hidden=\"true\"></span>\r\n");
      out.write("                        </span>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <ul class=\"cat-sub-menu\">\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"#managecategories\"> Manage All categories</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                          <a href=\"#addcategory\" id=\"ac\">Add categories</a>\r\n");
      out.write("                      </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                          <a href=\"#manageorders\" id=\"ac\">Order</a>\r\n");
      out.write("                    \r\n");
      out.write("  \r\n");
      out.write("    \r\n");
      out.write("</aside>\r\n");
      out.write("  <div class=\"main-wrapper\">\r\n");
      out.write("    <!-- ! Main nav -->\r\n");
      out.write("    <nav class=\"main-nav--bg\">\r\n");
      out.write("  <div class=\"container main-nav\">\r\n");
      out.write("    <div class=\"main-nav-start\">\r\n");
      out.write("      \r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"main-nav-end\">\r\n");
      out.write("      <button class=\"sidebar-toggle transparent-btn\" title=\"Menu\" type=\"button\">\r\n");
      out.write("        <span class=\"sr-only\">Toggle menu</span>\r\n");
      out.write("        <span class=\"icon menu-toggle--gray\" aria-hidden=\"true\"></span>\r\n");
      out.write("      </button>\r\n");
      out.write("      \r\n");
      out.write("      <button class=\"theme-switcher gray-circle-btn\" type=\"button\" title=\"Switch theme\">\r\n");
      out.write("        <span class=\"sr-only\">Switch theme</span>\r\n");
      out.write("        <i class=\"sun-icon\" data-feather=\"sun\" aria-hidden=\"true\"></i>\r\n");
      out.write("        <i class=\"moon-icon\" data-feather=\"moon\" aria-hidden=\"true\"></i>\r\n");
      out.write("      </button>\r\n");
      out.write("    \r\n");
      out.write("      <div class=\"nav-user-wrapper\">\r\n");
      out.write("        <button href=\"##\" class=\"nav-user-btn dropdown-btn\" title=\"My profile\" type=\"button\">\r\n");
      out.write("          <span class=\"sr-only\">My profile</span>\r\n");
      out.write("          <span class=\"nav-user-img\">\r\n");
      out.write("            <picture><source srcset=\"./img/avatar/avatar-illustrated-02.webp\" type=\"image/webp\"><img src=\"./img/avatar/avatar-illustrated-02.png\" alt=\"User name\"></picture>\r\n");
      out.write("          </span>\r\n");
      out.write("        </button>\r\n");
      out.write("        <ul class=\"users-item-dropdown nav-user-dropdown dropdown\">\r\n");
      out.write("          <li><a class=\"danger\">\r\n");
      out.write("                  <i data-feather=\"log-out\" aria-hidden=\"true\" onclick=\"logOut();\"></i>\r\n");
      out.write("              <span>Log out</span>\r\n");
      out.write("            </a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</nav>\r\n");
      out.write(" \r\n");
      out.write("    <div ng-view></div>\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("    <!-- ! Footer -->\r\n");
      out.write("    <footer class=\"footer\">\r\n");
      out.write("  <div class=\"container footer--flex\">\r\n");
      out.write("    <div class=\"footer-start\">\r\n");
      out.write("      <p>2021 © Urban Closet Dashboard - <a href=\"/\" target=\"_blank\"\r\n");
      out.write("          rel=\"noopener noreferrer\">Urban Closet-dashboard.com</a></p>\r\n");
      out.write("    </div>\r\n");
      out.write("    <ul class=\"footer-end\">\r\n");
      out.write("      <li><a href=\"##\">About</a></li>\r\n");
      out.write("      <li><a href=\"##\">Support</a></li>\r\n");
      out.write("      <li><a href=\"##\">Puchase</a></li>\r\n");
      out.write("    </ul>\r\n");
      out.write("  </div>\r\n");
      out.write("</footer>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("<!-- Chart library -->\r\n");
      out.write("<script src=\"./plugins/chart.min.js\"></script>\r\n");
      out.write("<!-- Icons library -->\r\n");
      out.write("<script src=\"plugins/feather.min.js\"></script>\r\n");
      out.write("<!-- Custom scripts -->\r\n");
      out.write("<script src=\"js/script.js\"></script>\r\n");
      out.write("<script src=\"./js/angular.min.js\"></script>\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular-route.min.js\"></script>\r\n");
      out.write("<!-- Compiled and minified JavaScript -->\r\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js\"></script>\r\n");
      out.write("            \r\n");
      out.write("<script src=\"./js/app.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
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
