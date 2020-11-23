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
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "EditAdServlet", urlPatterns="/ads/edit")
public class EditAdServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println(request.getParameter("id"));

        HttpSession session = request.getSession();
        Long id = Long.parseLong(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        System.out.println("id = " + id);
        System.out.println("title = " + title);
        System.out.println("description = " + description);
        System.out.println("request.getParameterValues(\"newCategories\") = " + Arrays.toString(request.getParameterValues("newCategories")));
        
        Ads ads = DaoFactory.getAdsDao();
        Ad ad = ads.getAdByID(id);
        User user = (User) session.getAttribute("user");

        if (ad == null || user == null || ad.getUserId() != user.getId()) {
            // TODO send user to a page indicating there's an error
            return;
        }

        DaoFactory.getCategoriesDao().deleteEntries(id);
        ads.updateAd(new Ad(ad.getId(), ad.getUserId(), title, description));
        DaoFactory.getCategoriesDao().setCategories(ad, request.getParameterValues("newCategories"));

        response.sendRedirect("/show?id=" + ad.getId());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        long id = Long.parseLong(request.getParameter("id"));
//        Ad ad = DaoFactory.getAdsDao().getAdByID(id);
//
//        List<String> adCategories = DaoFactory.getCategoriesDao().getCategoriesByAdId(id);
//
//        request.setAttribute("title", ad.getTitle());
//        request.setAttribute("description", ad.getDescription());
//        request.setAttribute("adCategories", adCategories);
//
//        System.out.println("ad.getTitle() = " + ad.getTitle());
//        System.out.println("ad.getDescription() = " + ad.getDescription());
//        System.out.println("adCategories = " + adCategories.toString());
    }

}
