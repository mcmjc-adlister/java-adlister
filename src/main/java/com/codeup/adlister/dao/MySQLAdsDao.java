package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;
    private PreparedStatement stmt;
    private ResultSet rs;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> searchAds(String keywords) {
        try {
            String sql = "SELECT * FROM ads WHERE ads.title LIKE ?";
            String safeSearch = "%" + keywords + "%";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, safeSearch);

            rs = stmt.executeQuery();
            List<Ad> ads = new ArrayList<>();
            while (rs.next()) {
                ads.add(extractAd(rs));
            }
            return ads;
        } catch (SQLException e) {
            throw new RuntimeException("Error searching for ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {

        //TODO insert categories into join table as well
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description, time_stamp) VALUES (?, ?, ?, ?)";
            stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setTimestamp(4, ad.getTimestamp());
            stmt.executeUpdate();
            rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public boolean deleteByID(Long id) {
        try {
            stmt = connection.prepareStatement("DELETE FROM ads WHERE id = ?");
            stmt.setLong(1, id);
            return stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad by ID.", e);
        }
    }


    public void deleteAllUserAds(Long id) {
        try {
            stmt = connection.prepareStatement("DELETE FROM ads WHERE user_id = ?");
            stmt.setLong(1, id);

            stmt.execute();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting all ads.", e);
        }
    }

    @Override
    public Ad getAdByID(Long id) {
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE id = ?");
            stmt.setLong(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                return extractAd(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ad by ID.", e);
        }
        return null;
    }

    @Override
    public List<Ad> getAdsByUser(User user) {
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE user_id = ?");
            stmt.setLong(1, user.getId());
            rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving user's ads.", e);
        }
    }
          
    public boolean updateAd(Ad ad) {
        //TODO update categories in join table
        try {
            stmt = connection.prepareStatement("UPDATE ads " +
                    "SET title = ?, description = ?" +
                    "WHERE id = ?");
            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setLong(3, ad.getId());
            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException("Error updating ad.", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description"),
            rs.getTimestamp("time_stamp")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
