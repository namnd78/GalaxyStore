/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package filter;

import dal.auth.AccountDAO;
import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author Duong
 */
@WebFilter(filterName = "AuthorizationFilter", urlPatterns = {"/profile", "/orderhistory"})
public class AuthorizationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // check login
        Account account = (Account) req.getSession().getAttribute("account");
        if (account != null) {
            // pass
            chain.doFilter(request, response);
        } else {
            Cookie[] cookie = req.getCookies();
            String username = null;
            String password = null;
            String remember = null;
            for (Cookie cooky : cookie) {
                if (cooky.getName().equals("username")) {
                    username = cooky.getValue();
                }
                if (cooky.getName().equals("password")) {
                    password = cooky.getValue();
                }
                if (cooky.getName().equals("remember")) {
                    remember = cooky.getValue();
                }
                if (username != null && password != null) {
                    break;
                }
            }
            if (username != null && password != null) {
                if (account != null) {
                    Account accountLogin = new AccountDAO().checkAccount(username, password);
                    if (accountLogin != null) { // valid cookie
                        req.setAttribute("account", accountLogin);
                        chain.doFilter(request, response);
                        return;
                    }
                }
            }
            res.sendRedirect("login");
        }
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {

    }

}
