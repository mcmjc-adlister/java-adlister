package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLUsersDao;
import com.codeup.adlister.models.User;
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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/editInfo.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User current = (User) req.getSession().getAttribute("user");
        long userId = current.getId();
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = Password.hash(req.getParameter("password"));
        boolean passwordConfirmation = Password.check(req.getParameter("confirm_password"), password);

        if (passwordConfirmation) {
            User user = new User(userId, username, email, password);
            System.out.println(user.getId());
            try {
                DaoFactory.getUsersDao().updateUser(user);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            resp.sendRedirect("/ads");
        }
    }
}
