package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class MySQLUsersDao implements Users {
    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id = ?";
    private Connection connection;
    private PreparedStatement stmt;
    private ResultSet rs;

    public MySQLUsersDao(Config config) {
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
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
        try {
            stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
            rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    @Override
    public User getUserByID(Long id) {
        try {
            stmt = connection.prepareStatement("SELECT * FROM users WHERE id = ?");
            stmt.setLong(1, id);
            rs = stmt.executeQuery();
            return extractUser(rs);

        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ad by ID.", e);
        }

    }

//    update user information
    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean updated;
        String updateInfo = "update users set username = ?, email = ?, password = ? where id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(updateInfo, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setLong(4, user.getId());
            stmt.executeUpdate();
            updated = true;
        } catch (SQLException e) {
            throw new RuntimeException("error", e);
        }
        return true;
    }

//delete user
    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        //TODO code is formatted awkwardly due to a (probably?) misplaced statement;
        // from testing delete, it currently seems to not delete the user
        try {
            stmt = connection.prepareStatement(DELETE_USERS_SQL);
            stmt.setInt(1, id);
            rowDeleted = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new SQLException("Error deleting user", e);
        }
        return rowDeleted;
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new User(
                rs.getLong("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("password")
        );
    }
}

