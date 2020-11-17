package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
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

@WebServlet(name = "EditAdServlet", urlPatterns="/ads/edit")
public class EditAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Long id = Long.parseLong(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Ads ads = DaoFactory.getAdsDao();
        Ad ad = ads.getAdByID(id);
        User user = (User) session.getAttribute("user");

        if (ad == null || user == null || ad.getUserId() != user.getId()) {
            // TODO send user to a page indicating there's an error
            return;
        }

        ads.updateAd(new Ad(ad.getId(), ad.getUserId(), title, description));
        response.sendRedirect("/ads/show?id=" + ad.getId());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO may need to make servlet code work in post instead of get
    }

}
