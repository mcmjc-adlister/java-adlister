package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLUsersDao;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Email;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "updateUser", urlPatterns = "/update")
public class UpdateUserInfoServlet extends HttpServlet {


    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

        //TODO page is directly accessible without being logged in; change
        request.getRequestDispatcher("/WEB-INF/editInfo.jsp").forward(request, resp);

        HttpSession session = request.getSession();
        String errorMessage = (String) session.getAttribute("error");
        if (errorMessage != null) {
            request.setAttribute("error", errorMessage);
            session.removeAttribute("error");//removes error message after session
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        //TODO the current logic forces the user to type in a password whether they want to change it or not
        // keep logic the same? separate change password functionality?

        User current = (User) request.getSession().getAttribute("user");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        boolean passwordRequirements = (Password.isValidPassword(password));
        boolean emailRequirements = (Email.emailMeetsRequirements(email));

        // validate input
        boolean inputHasErrors = email.isEmpty()
                || password.isEmpty()
                || (!password.equals(passwordConfirmation))
                || (!passwordRequirements)
                || (!emailRequirements);

        if (inputHasErrors) {
            request.getSession().setAttribute("enteredUsername", username);
            request.getSession().setAttribute("enteredEmail", email);
            if (password.isEmpty()) {
                request.setAttribute("error", "Enter password to confirm change");
                request.getRequestDispatcher("/WEB-INF/editInfo.jsp").forward(request, response);
            } else if (!password.equals(passwordConfirmation)) {
                request.setAttribute("error", "Passwords do not match");
                request.getRequestDispatcher("/WEB-INF/editInfo.jsp").forward(request, response);
            } else if (!passwordRequirements) {
                request.setAttribute("error", "Password does not meet requirements");
                request.getRequestDispatcher("/WEB-INF/editInfo.jsp").forward(request, response);
            } else if (!emailRequirements) {
                request.setAttribute("error", "Invalid email");
                request.getRequestDispatcher("/WEB-INF/editInfo.jsp").forward(request, response);
            }
            response.sendRedirect("/update");
            return;
        }

        current.setUsername(username);
        current.setEmail(email);
        current.setPassword(password);

        try {
            DaoFactory.getUsersDao().updateUser(current);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/profile");
    }
}

//            long userId = current.getId();
//            String username = req.getParameter("username");
//            String email = req.getParameter("email");
//            String password = Password.hash(req.getParameter("password"));
//            boolean passwordConfirmation = Password.check(req.getParameter("confirm_password"), password);
//
//
//            if (passwordConfirmation) {
//                User user = new User(userId, username, email, password);
//                System.out.println(user.getId());
//                try {
//                    DaoFactory.getUsersDao().updateUser(user);
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//                resp.sendRedirect("/profile");
//}




