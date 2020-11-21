package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        List<Ad> ads = DaoFactory.getAdsDao().getAdsByUser(user);
        HashMap<Long, List<String>> data = new HashMap<>();

        for (Ad ad: ads) {
            data.put(ad.getId(), DaoFactory.getCategoriesDao().getCategoriesByAdId(ad.getId()));
        }

        if (request.getAttribute("categoryNames") == null) {
            List<String> list = new ArrayList<>();
            for (Category cat: DaoFactory.getCategoriesDao().all()) {
                    list.add(cat.getCategory());
            }
            request.getSession().setAttribute("categoryNames", list);
        }

        request.setAttribute("usersAds", ads);
        request.setAttribute("adCategories", data);
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }
}
