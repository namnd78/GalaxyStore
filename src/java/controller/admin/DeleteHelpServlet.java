/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.help.HelpDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Help;

/**
 *
 * @author Duong
 */
public class DeleteHelpServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteHelpServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>" + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //delete
        int id = Integer.parseInt(request.getParameter("helpId"));
        new HelpDAO().deleteHelpById(id);
        request.setAttribute("path", "help");
        HelpDAO helpDAO = new HelpDAO();
        List<Help> listHelp = helpDAO.getAllHelps();
        String html = "<ul class=\"nav nav-tabs col-2\" id=\"myTab\" role=\"tablist\">";
        if (listHelp != null) {
            for (Help help : listHelp) {
                html += "<li class=\"nav-item\" id=\"" + help.id + "\" role=\"presentation\">\n"
                        + "                                            <div class=\"nav-link " + help.state + "\" id=\"" + help.tab + "\" data-bs-toggle=\"tab\" data-bs-target=\"" + help.target + "\" type=\"button\" role=\"tab\">" + help.title + "\n"
                        + "                                                <span class=\"help-fade\"></span>\n"
                        + "                                                <span data-bs-toggle=\"modal\" data-bs-target=\"#delete\">\n"
                        + "                                                    <button type=\"button\" onclick=\"DeleteHelpItem(" + help.id + ", '" + help.title + "')\" class=\"delete-item\" data-bs-toggle=\"tooltip\" data-bs-placement=\"right\" title=\"Delete\">\n"
                        + "                                                         <i class=\"fa-regular fa-trash\"></i>\n"
                        + "                                                    </button>\n"
                        + "                                                </span>\n"
                        + "                                            </div>\n"
                        + "                                        </li>";
            }
            html += "</ul><div class=\"tab-content col-9\" id=\"myTabContent\" style=\"padding-top: 0\">\n";
            for (Help help : listHelp) {
                String show = "active".equals(help.state.trim()) ? "show active" : "";
                html += "<div class=\"tab-pane fade " + show + "\" id=\"" + help.target.substring(1, help.target.length()) + "\" role=\"tabpanel\">\n"
                        + "                                                " + help.content + "\n"
                        + "                                        </div>";
            }
            html += "</div>";
            response.getWriter().print(html);
        } else {
            response.getWriter().print("list empty");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
