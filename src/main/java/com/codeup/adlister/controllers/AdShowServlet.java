package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.models.Ad;

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

        String id = request.getParameter("id");
        System.out.println("id = " + id);
        Ad ad = ads.getAdByID(id);

        if (ad == null) {
            // TODO modify behavior to send user to a specific page if an ad with ID doesn't exist
            request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
            return;
        }

        request.setAttribute("ad", ad);
        request.getRequestDispatcher("/WEB-INF/ads/show.jsp").forward(request, response);
    }
}
