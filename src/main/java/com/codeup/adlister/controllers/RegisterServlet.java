package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Email;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

        HttpSession session = request.getSession();
        String errorMessage = (String) session.getAttribute("error");
        if (errorMessage != null) {
            request.setAttribute("error", errorMessage);
            session.removeAttribute("error");//removes error message after session
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        boolean passwordRequirements = (Password.isValidPassword(password));
        boolean emailRequirements = (Email.emailMeetsRequirements(email));

        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || (!password.equals(passwordConfirmation))
                || (!passwordRequirements)
                || (!emailRequirements);


        System.out.println(passwordRequirements);

        if (inputHasErrors) {
            if (username.isEmpty()) {
                request.setAttribute("error", "Enter a username!");
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            } else if (email.isEmpty()) {
                request.setAttribute("error", "Enter email!");
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            } else if (password.isEmpty()) {
                request.setAttribute("error", "Enter password!");
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            } else if (!password.equals(passwordConfirmation)) {
                request.setAttribute("error", "Passwords do not match");
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            } else if (!passwordRequirements) {
                request.setAttribute("error", "Password does not meet requirements");
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            } else if (!emailRequirements) {
                request.setAttribute("error", "Invalid email");
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            }
        }
            // create and save a new user
            User user = new User(username, email, password);
            try {
                DaoFactory.getUsersDao().insert(user);
                response.sendRedirect("/login");
            } catch (RuntimeException e) {
                e.printStackTrace();
                request.setAttribute("error", "Username not available!");
                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            }
        }
    }