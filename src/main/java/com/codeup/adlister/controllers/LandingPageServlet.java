package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LandingPageServlet", urlPatterns = "")
public class LandingPageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            List<Ad> allAds = DaoFactory.getAdsDao().all();
            List<Ad> randomAds = new ArrayList<>();

            int randomNum1 = (int) (Math.random() * allAds.size());
            int randomNum2 = (int) (Math.random() * allAds.size());
            while (randomNum2 == randomNum1) {
                randomNum2 = (int) (Math.random() * allAds.size());
            }

            randomAds.add(allAds.get(randomNum1));
            randomAds.add(allAds.get(randomNum2));

            request.setAttribute("ads", randomAds);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
