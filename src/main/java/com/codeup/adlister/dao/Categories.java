package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import java.util.List;

public interface Categories {
    List<Category> all();
    void setCategories(Ad ad, String[] categories);
    Category getCategoryByName(String s);
    void deleteEntries(Long id);
    List<String> getCategoriesByAdId(Long id);
    String getCategoryNameById(Long id);
}