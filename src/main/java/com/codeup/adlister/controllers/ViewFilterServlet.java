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

@WebServlet(name = "ViewFilterServlet", urlPatterns = "/view")
public class ViewFilterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //TODO breaks with category names including a '&'
        String categoryName = request.getParameter("category");
        Category cat = DaoFactory.getCategoriesDao().getCategoryByName(categoryName);
        List<Long> idList = DaoFactory.getCategoriesDao().getAdsByCategoryId(cat.getId());
        List<Ad> adList = new ArrayList<>();

        for (Long id: idList) {
            adList.add(DaoFactory.getAdsDao().getAdByID(id));
        }

        request.setAttribute("ads", adList);
        request.setAttribute("cat", categoryName);
        request.getRequestDispatcher("/WEB-INF/view.jsp").forward(request, response);
    }
}
