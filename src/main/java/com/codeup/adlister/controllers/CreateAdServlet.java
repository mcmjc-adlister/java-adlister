package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);

        HttpSession session = request.getSession();
        String errorMessage = (String) session.getAttribute("error");
        if(errorMessage != null) {
            request.setAttribute("error", errorMessage);
            session.removeAttribute("error");//removes error message after session
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("user");
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        //validate input
        boolean inputHasErrors = title.isEmpty() || description.isEmpty();

        if (inputHasErrors) {
            if (title.isEmpty()) {
                request.setAttribute("enteredDescription", description);
                request.setAttribute("error", "Ad must have a title.");
                request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
            } else if (description.isEmpty()) {
                request.setAttribute("enteredTitle", title);
                request.setAttribute("error", "Ad must have a description.");
                request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
            }
        } else {
            //Create and save a new ad
            //TODO also insert category data into join table
            Ad ad = new Ad(
                    user.getId(),
                    title,
                    description,
                    new Timestamp(new Date().getTime())
            );
            DaoFactory.getAdsDao().insert(ad);
            response.sendRedirect("/ads");
        }
    }
}
