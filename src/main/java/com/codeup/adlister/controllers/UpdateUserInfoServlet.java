package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLUsersDao;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Email;
import com.codeup.adlister.util.Password;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet (name = "updateUser", urlPatterns = "/update")
public class UpdateUserInfoServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/editInfo.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User current = (User) request.getSession().getAttribute("user");
        long userId = current.getId();
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = Password.hash(request.getParameter("password"));
        boolean passwordConfirmation = Password.check(request.getParameter("confirm_password"), password);
        boolean passwordRequirements = (Password.isValidPassword(password));
        boolean emailRequirements = (Email.emailMeetsRequirements(email));


        if (!emailRequirements)
            request.setAttribute("error", "Email does not meet requirements");
        request.getRequestDispatcher("/WEB-INF/editInfo.jsp").forward(request, response);
        if (!passwordRequirements)
            request.setAttribute("error", "Password does not meet requirements");
        request.getRequestDispatcher("/WEB-INF/editInfo.jsp").forward(request, response);

        if (passwordConfirmation) {
            User user = new User(userId, username, email, password);
            System.out.println(user.getId());
            try {
                DaoFactory.getUsersDao().updateUser(user);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/profile");
        }
    }
}
