package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet(name = "LandingPageServlet", urlPatterns = "")
public class LandingPageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Ad> allAds = DaoFactory.getAdsDao().all();
        List<Ad> randomAds = new ArrayList<>();

        while (allAds.size() > 0) {
            Random rand = new Random(); //instance of random class
            int upperbound = allAds.size();
            int index = rand.nextInt(upperbound);
            randomAds.add(allAds.get(index));
            allAds.remove(index);
        }

        request.setAttribute("ads", randomAds);

        if (request.getAttribute("categoryNames") == null) {
            List<String> list = new ArrayList<>();
            for (Category cat : DaoFactory.getCategoriesDao().all()) {
                list.add(cat.getCategory());
            }
            request.getSession().setAttribute("categoryNames", list);
        }

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
