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


// going to /ads/delete?id=1 (or any id) will delete from database only if user is logged in and owner of ad

@WebServlet(name = "DeleteAdServlet", urlPatterns = "/ads/delete")
public class DeleteAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Long id = Long.parseLong(request.getParameter("id"));
        Ad ad = DaoFactory.getAdsDao().getAdByID(id);
        User user = (User) session.getAttribute("user");

        if (ad == null || user == null || ad.getUserId() != user.getId()) {
            // TODO send user to a page indicating there's an error
            return;
        }

        DaoFactory.getCategoriesDao().deleteEntries(id);
        DaoFactory.getAdsDao().deleteByID(id);
        response.sendRedirect("/profile");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //TODO may need to move code into doPost instead
    }

}
