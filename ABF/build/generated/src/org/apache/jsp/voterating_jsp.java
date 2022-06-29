package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class voterating_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("  <title>RuangAdmin - DataTables</title>\n");
      out.write("  <link href=\"vendor/fontawesome-free/css/all.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("  <link href=\"vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("  <link href=\"vendor/datatables/dataTables.bootstrap4.min.css\" rel=\"stylesheet\">\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body id=\"page-top\">\n");
      out.write("  <div id=\"wrapper\">\n");
      out.write("    \n");
      out.write("    <!-- Sidebar -->\n");
      out.write("    <div id=\"content-wrapper\" class=\"d-flex flex-column\">\n");
      out.write("      <div id=\"content\">\n");
      out.write("        <div class=\"container-fluid\" id=\"container-wrapper\">\n");
      out.write("          <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-12\">\n");
      out.write("              <div class=\"card mb-4\">\n");
      out.write("                <div class=\"card-header py-3 d-flex flex-row align-items-center justify-content-between\">\n");
      out.write("                  <h6 class=\"m-0 font-weight-bold text-primary\">DataTables</h6>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"table-responsive p-3\">\n");
      out.write("                  <table class=\"table align-items-center table-flush\" id=\"dataTable\">\n");
      out.write("                    <thead class=\"thead-light\">\n");
      out.write("                      <tr>\n");
      out.write("                        <th>Name</th>\n");
      out.write("                        <th>Position</th>\n");
      out.write("                        <th>Office</th>\n");
      out.write("                        <th>Age</th>\n");
      out.write("                        <th>Start date</th>\n");
      out.write("                        <th>Salary</th>\n");
      out.write("                      </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tfoot>\n");
      out.write("                      <tr>\n");
      out.write("                        <th>Name</th>\n");
      out.write("                        <th>Position</th>\n");
      out.write("                        <th>Office</th>\n");
      out.write("                        <th>Age</th>\n");
      out.write("                        <th>Start date</th>\n");
      out.write("                        <th>Salary</th>\n");
      out.write("                      </tr>\n");
      out.write("                    </tfoot>\n");
      out.write("                    <tbody>\n");
      out.write("                      <tr>\n");
      out.write("                        <td>Tiger Nixon</td>\n");
      out.write("                        <td>System Architect</td>\n");
      out.write("                        <td>Edinburgh</td>\n");
      out.write("                        <td>61</td>\n");
      out.write("                        <td>2011/04/25</td>\n");
      out.write("                        <td>$320,800</td>\n");
      out.write("                      </tr>\n");
      out.write("                      <tr>\n");
      out.write("                        <td>Tiger Nixon</td>\n");
      out.write("                        <td>System Architect</td>\n");
      out.write("                        <td>Edinburgh</td>\n");
      out.write("                        <td>61</td>\n");
      out.write("                        <td>2011/04/5</td>\n");
      out.write("                        <td>$30,800</td>\n");
      out.write("                      </tr>\n");
      out.write("                    </tbody>\n");
      out.write("                  </table>\n");
      out.write("                </div>\n");
      out.write("              </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div> \n");
      out.write("\n");
      out.write("  <script src=\"vendor/jquery/jquery.min.js\"></script>\n");
      out.write("  <script src=\"vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("  <script src=\"vendor/jquery-easing/jquery.easing.min.js\"></script>\n");
      out.write("  <script src=\"vendor/datatables/jquery.dataTables.min.js\"></script>\n");
      out.write("  <script src=\"vendor/datatables/dataTables.bootstrap4.min.js\"></script>\n");
      out.write("\n");
      out.write("  <script>\n");
      out.write("    $(document).ready(function () {\n");
      out.write("      $('#dataTable').DataTable(); // ID From dataTable \n");
      out.write("      $('#dataTableHover').DataTable(); // ID From dataTable with Hover\n");
      out.write("    });\n");
      out.write("  </script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
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
