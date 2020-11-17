package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.sql.SQLException;
import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
    User getUserByID(Long id);
    boolean updateUser(User user) throws SQLException;
    boolean deleteUser(int id) throws SQLException;
}
