INSERT INTO country (
    name, 
    main_link, 
    description, 
    title, 
    area, 
    language, 
    capital, 
    currency, 
    population, 
    picture_name, 
    picture_path, 
) 
VALUES (
    'Germany', 
    '../countries/germany.html', 
    'Germany, known for its rich cultural heritage, is a country located in Central Europe, famous for its historic landmarks, beautiful landscapes, and vibrant cities.', 
    'Germany', 
    '357,022', 
    'Germany', 
    'Berlin', 
    'Euro', 
    '83 Million', 
    'gerwallpaper.jpg', 
    '../assets/gerwallpaper.jpg', 
);
INSERT INTO country (
    name, 
    main_link, 
    description, 
    title, 
    area, 
    language, 
    capital, 
    currency, 
    population, 
    picture_name, 
    picture_path
) 
VALUES  (
    'Germany', 
    '../countries/germany.html', 
    'Germany, known for its rich cultural heritage, is a country located in Central Europe, famous for its historic landmarks, beautiful landscapes, and vibrant cities.', 
    'Germany', 
    '357,022', 
    'Germany', 
    'Berlin', 
    'Euro', 
    '83 Million', 
    'gerwallpaper.jpg', 
    '../assets/gerwallpaper.jpg', 
),


('Turkey', 
'../countries/turkey.html', 
'The beautiful nation between Europe and Asia, known for warm hospitality, ancient history, stunning beaches, and vibrant culture.', 
'Turkey', 
'783,356', 
'Turkish', 
'Ankara', 
'Turkish Lira', 
'84 Million', 
'turkeywallpaper.jpeg', 
'../assets/turkeywallpaper.jpeg'),


('Ukraine', 
'../countries/ukraine.html', 
'Ukraine, the biggest country of Europe, is located in east of the continent. With a rich history as part of the Russian Empire, then as part of the Soviet Union and now as independent state, Ukraine has much to offer, from the mountains in Carpathia to the sea in Odesa with big cities waiting for you.', 
'Ukraine', 
'603,550', 
'Ukrainian', 
'Kyiv', 
'Hryvnia', 
'41 Million', 
'ukrainewallpaper.png', 
'../assets/ukrainewallpaper.png'),


('Romania', 
'../countries/romania.html', 
'Romania is a country in Eastern Europe, known for its dramatic Carpathian Mountains, medieval towns, vibrant cities like Bucharest, and the legendary region of Transylvania. It combines rich history, diverse landscapes, and warm hospitality.', 
'Romania', 
'238,397', 
'Romanian', 
'Bucharest', 
'Leu', 
'19 Million', 
'romaniawallpaper.jpeg', 
'../assets/romaniawallpaper.jpeg'),


('Croatia', 
'../countries/croatia.html', 
'Croatia, located along the Adriatic Sea, is known for its stunning coastline, medieval towns, and beautiful beaches. The countrys natural beauty, rich history, and vibrant culture make it a must-visit destination in Europe.', 
'Croatia', 
'56,594', 
'Croatian', 
'Zagreb', 
'Kuna', 
'4 Million', 
'croatiawallpaper.jpeg', 
'../assets/croatiawallpaper.jpeg');


INSERT INTO country_highlights (
    name, 
    country_id, 
    description, 
    link, 
    picture_name, 
    picture_path, 
    modified_by_user
) 
VALUES 
-- Highlight for Germany
('Brandenburg Gate', 
1, 
'The Brandenburg Gate is a neoclassical monument in Berlin, one of Germany’s most famous landmarks.', 
'../countries/germany.html', 
'brandenburggate.png', 
'../assets/brandenburggate.png', 
'null'),

-- Highlight for Turkey
('Hagia Sophia', 
2, 
'Hagia Sophia is a historic architectural wonder in Istanbul, showcasing a blend of Christian and Islamic influences.', 
'../countries/turkey.html', 
'turkey-highlight1.jpg', 
'../assets/turkeyhighlight.jpg', 
'null'),

-- Highlight for Ukraine
('Kyiv Pechersk Lavra', 
3, 
'Kyiv Pechersk Lavra is a historic Orthodox Christian monastery in Kyiv, a UNESCO World Heritage Site.', 
'../countries/ukraine.html', 
'kiewkloster.jpg', 
'../assets/kiewkloster.jpg', 
'null'),

-- Highlight for Romania
('Bran Castle', 
4, 
'Bran Castle, often associated with the Dracula legend, is a popular tourist attraction in Romania.', 
'../countries/romania.html', 
'romania-highlight1.jpeg', 
'../assets/romania-highlight1.jpeg', 
'null'),

-- Highlight for Croatia
('Plitvice Lakes National Park', 
5, 
'Plitvice Lakes National Park is a UNESCO World Heritage site known for its cascading lakes and waterfalls.', 
'../countries/croatia.html', 
'croatia-highlight2.png', 
'../assets/croatia-highlight2.png', 
'null');
