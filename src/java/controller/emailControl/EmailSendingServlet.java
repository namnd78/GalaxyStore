package controller.emailControl;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import captcha.VerifyRecaptcha;
import dal.auth.AccountDAO;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author NamND
 */
@WebServlet(urlPatterns = {"/EmailSendingServlet"})
public class EmailSendingServlet extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;

    @Override
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String recipient = request.getParameter("recipient");
        String subject = "Request to reset password";
        String newPassword = RandomPassword.getRandomPassWord(6);
        String content = "This message is in response to your request to reset your account password.\n" + "This is your new password: " + newPassword;

        // get reCAPTCHA request param
        String gRecaptchaResponse = request
                .getParameter("g-recaptcha-response");
        boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);

        if (!verify) {
            String alert = "<p class=\"text-danger text-center\">You missed the Captcha</p>";
            request.setAttribute("alert", alert);
            request.setAttribute("path", "login");
            request.setAttribute("value", request.getParameter("recipient"));
            request.getRequestDispatcher("pages/account/forgot.jsp").forward(request, response);
        } else {
            String resultMessage = "";

            try {
                EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
                resultMessage = "The new Password was sent to your email successfully";
                new AccountDAO().updatePassword(recipient, newPassword);
            } catch (Exception ex) {
                ex.printStackTrace();
                resultMessage = "There were an error: " + ex.getMessage();
            } finally {
                request.setAttribute("Message", resultMessage);
                getServletContext().getRequestDispatcher("/login").forward(request, response);
            }
        }
    }
}
