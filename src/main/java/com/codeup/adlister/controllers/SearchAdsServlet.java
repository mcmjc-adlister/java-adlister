package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.SearchAdsServlet", urlPatterns = "/search")
public class SearchAdsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keywords = request.getParameter("searchAds");
        System.out.println(keywords);
        request.setAttribute("keywords", keywords);
        request.setAttribute("ads", DaoFactory.getAdsDao().searchAds(keywords));
        request.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(request, response);
    }
}
