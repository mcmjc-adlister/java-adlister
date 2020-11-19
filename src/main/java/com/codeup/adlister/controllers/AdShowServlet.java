package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.dao.Users;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AdShowServlet", urlPatterns = "/show")
public class AdShowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Ads ads = DaoFactory.getAdsDao();
        Users users = DaoFactory.getUsersDao();
        String id = request.getParameter("id");
        Ad ad = ads.getAdByID(Long.parseLong(id));

        if (ad == null) {
            // TODO (optional) modify behavior to send user to a specific page if an ad with ID doesn't exist
            request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
            return;
        }
        User user = users.getUserByID(ad.getUserId());

        request.setAttribute("ad", ad);
        request.setAttribute("poster", user);
        request.setAttribute("adCategories", DaoFactory.getCategoriesDao().getCategoriesByAdId(ad.getId()));
        request.setAttribute("categories", DaoFactory.getCategoriesDao().all());

        request.getRequestDispatcher("/WEB-INF/ads/show.jsp").forward(request, response);
    }
}
