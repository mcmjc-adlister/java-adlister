package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriesDao implements Categories{
    private Connection connection = null;


    public CategoriesDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch(SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Category> all() {

        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM categories");
            ResultSet rs = stmt.executeQuery();
            return createCategoriesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all categories.", e);
        }


    }

    @Override
    public Category getCategoryByName(String s) {

        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM categories WHERE category_name = ?");
            stmt.setString(1, s);
            ResultSet rs = stmt.executeQuery();

            if (!rs.next()) {
                return null;    
            }
            return new Category(rs.getLong(1), rs.getString(2));
            
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving category:" + s, e);
        }

    }

    @Override
    public void deleteEntries(Long id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("DELETE FROM ad_categories_join_table WHERE ads_id = ?");
            stmt.setLong(1, id);
            stmt.execute();

        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad by ID.", e);
        }
    }

    @Override
    public void setCategories(Ad ad, String[] categories) {

        System.out.println("ad.getId() = " + ad.getId());
        
        for (String category: categories) {
            
            Category cat = getCategoryByName(category);

            try {
                String insertQuery = "INSERT INTO ad_categories_join_table (categories_id, ads_id) VALUES (?, ?)";
                PreparedStatement stmt = connection.prepareStatement(insertQuery);
                stmt.setLong(1, cat.getId());
                stmt.setLong(2, ad.getId());
                stmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException("Error creating a new ad.", e);
            }

            System.out.println("cat.getId() = " + cat.getId());
            System.out.println("cat.getCategory() = " + cat.getCategory());
        }

    }

    private List<Category> createCategoriesFromResults(ResultSet rs) throws SQLException {
        List<Category> categories = new ArrayList<>();
        while (rs.next()) {
            categories.add(new Category(
                    rs.getLong("id"),
                    rs.getString("category_name"))
            );
        }
        return categories;
    }

}
