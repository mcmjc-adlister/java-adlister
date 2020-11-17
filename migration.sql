CREATE DATABASE IF NOT EXISTS adlister_db;
USE adlister_db;

# DROP TABLE IF EXISTS ads;
# DROP TABLE IF EXISTS users;
# DROP TABLE IF EXISTS categories;
# DROP TABLE IF EXISTS ad_categories_join_table;

CREATE TABLE IF NOT EXISTS users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    time_stamp DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS categories (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(45),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS ad_categories_join_table (
    categories_id INT UNSIGNED NOT NULL,
    ads_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (categories_id) REFERENCES categories(id),
    FOREIGN KEY (ads_id) REFERENCES ads(id)
);