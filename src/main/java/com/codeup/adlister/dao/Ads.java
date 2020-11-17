package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    Ad getAdByID(Long id);
    List<Ad> getAdsByUser(User user);
    boolean deleteByID(Long id);
    boolean updateAd(Ad ad);

}
