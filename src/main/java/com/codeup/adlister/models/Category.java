package com.codeup.adlister.models;

import java.util.List;

public class Category {
    private long id;
    private String category;


    public Category(long id, String category){
        this.id = id;
        this.category = category;
    }

    public Category(String category_name) {
        this.category = category_name;
    }

    public long getId(){
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public String getCategory(){
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
