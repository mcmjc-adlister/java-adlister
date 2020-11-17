package com.codeup.adlister.dao;

import com.codeup.adlister.models.Category;

import java.util.List;

public interface Categories {
    public List<Category> all();
    List<Category> allOfCategory();
}