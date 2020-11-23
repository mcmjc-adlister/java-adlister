USE adlister_db;

TRUNCATE ads;
TRUNCATE users;

INSERT INTO users(id, username, email, password)
    (1, 'truckdriver23', 'turckdriver23@gmail.com', 'Ilovetrucks1!') ,
    (2, 'computerperson', 'computerperson@gmail.com', 'Ilovecomputers1!'),
    (3, 'ironchef', 'ironchef@gmail.com', 'IloveCooking1!'),
    (4, 'Hulk', 'hulk@strong.com', 'Hulksmash@123');

INSERT INTO ads(id, user_id, title, description, time_stamp)
VALUES (2, 3, 'Honda Civic: 2 door', 'car', 1998, CURRENT_TIMESTAMP),
       (3, 2, 'Disney on Ice', '2 tickets for sale, section 2, row 3', CURRENT_TIMESTAMP),
       (4, 4, 'Sitter wanted', '5 kids need watching this Friday @5. $50 for 10 hours', CURRENT_TIMESTAMP),
       (1, 1, 'truck for sale', 'I''m selling my used truck, $5000 OBO', CURRENT_TIMESTAMP),
       (2, 2, 'Selling used GPU', 'Used GPU for sale, light bitcoin mining usage', CURRENT_TIMESTAMP),
       (3, 2, 'Looking for GPU', 'Looking for GPU, high-end preferred for bitcoin mining', CURRENT_TIMESTAMP),
       (4, 3, 'Personal Chef for a Day','Ever wanted a personal chef for a special event? Well look no further! My rates are fair and my cooking is world-class. Email me at ironchef@gmail.com for more info.', current_timestamp);
