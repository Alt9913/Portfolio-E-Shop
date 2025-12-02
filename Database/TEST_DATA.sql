INSERT INTO country (id, name, main_link, description, title, area, language, capital, currency, population, picture_name, picture_path, available) 
VALUES 
(1, 'Germany', '../countries/germany.html', 'Germany, known for its rich cultural heritage, is a country located in Central Europe, famous for its historic landmarks, beautiful landscapes, and vibrant cities.', 'Germany', '357,022', 'Germany', 'Berlin', 'Euro', '83 Million', 'gerwallpaper.jpg', '../assets/gerwallpaper.jpg', 1)
,(2, 'Turkey', '../countries/turkey.html', 'The beautiful nation between Europe and Asia, known for warm hospitality, ancient history, stunning beaches, and vibrant culture.', 'Turkey', '783,356', 'Turkish', 'Ankara', 'Turkish Lira', '84 Million', 'turkeywallpaper.jpeg', '../assets/turkeywallpaper.jpeg', 1)
,(3, 'Ukraine', '../countries/ukraine.html', 'Ukraine, the biggest country of Europe, is located in east of the continent. With a rich history as part of the Russian Empire, then as part of the Soviet Union and now as independent state, Ukraine has much to offer, from the mountains in Carpathia to the sea in Odesa with big cities waiting for you.', 'Ukraine', '603,550', 'Ukrainian', 'Kyiv', 'Hryvnia', '41 Million', 'ukrainewallpaper.png', '../assets/ukrainewallpaper.png', 1)
,(4, 'Romania', '../countries/romania.html', 'Romania is a country in Eastern Europe, known for its dramatic Carpathian Mountains, medieval towns, vibrant cities like Bucharest, and the legendary region of Transylvania. It combines rich history, diverse landscapes, and warm hospitality.', 'Romania', '238,397', 'Romanian', 'Bucharest', 'Leu', '19 Million', 'romaniawallpaper.jpeg', '../assets/romaniawallpaper.jpeg', 1)
,(5, 'Croatia', '../countries/croatia.html', 'Croatia, located along the Adriatic Sea, is known for its stunning coastline, medieval towns, and beautiful beaches. The countrys natural beauty, rich history, and vibrant culture make it a must-visit destination in Europe.', 'Croatia', '56,594', 'Croatian', 'Zagreb', 'Kuna', '4 Million', 'croatiawallpaper.jpeg', '../assets/croatiawallpaper.jpeg', 1)
,(6, 'USA', '../countries/usa.html', 'The United States, a diverse country in North America, is known for its vast landscapes, cultural diversity, and iconic landmarks such as the Statue of Liberty and the Grand Canyon.', 'USA', '9,826,675', 'English', 'Washington, D.C.', 'USD', '331 Million', 'usawallpaper.jpg', '../assets/usawallpaper.jpg', 0)
,(7, 'Japan', '../countries/japan.html', 'Japan, an island nation in East Asia, is famous for its unique blend of ancient traditions, modern technology, beautiful landscapes, and rich cultural heritage.', 'Japan', '377,975', 'Japanese', 'Tokyo', 'Yen', '126 Million', 'japanwallpaper.jpg', '../assets/japanwallpaper.jpg', 0)
,(8, 'Australia', '../countries/australia.html', 'Australia, located in Oceania, is renowned for its stunning natural wonders, including the Great Barrier Reef, its vibrant cities, and unique wildlife.', 'Australia', '7,692,024', 'English', 'Canberra', 'Australian Dollar', '25 Million', 'australiawallpaper.jpg', '../assets/australiawallpaper.jpg', 0)
,(9, 'Italy', '../countries/italy.html', 'Italy, a country in Southern Europe, is known for its rich history, art, and architecture, as well as beautiful landscapes such as the Amalfi Coast and Tuscany.', 'Italy', '301,340', 'Italian', 'Rome', 'Euro', '60 Million', 'italywallpaper.jpg', '../assets/italywallpaper.jpg', 0)
,(10, 'Maldives', '../countries/maldives.html', 'The Maldives, a tropical paradise in the Indian Ocean, is famous for its stunning overwater bungalows, crystal-clear waters, and vibrant marine life.', 'Maldives', '298', 'Dhivehi', 'Malé', 'Maldivian Rufiyaa', '530,000', 'maldiveswallpaper.jpg', '../assets/maldiveswallpaper.jpg', 0)
,(11, 'Caribbean', '../countries/caribbean.html', 'The Caribbean consists of many islands and countries in the Caribbean Sea, known for its pristine beaches, vibrant culture, and tropical climate.', 'Caribbean', '2,754,000', 'Various', 'Various', 'East Caribbean Dollar', '42 Million', 'caribbeanwallpaper.jpg', '../assets/caribbeanwallpaper.jpg', 0)
,(12, 'South Africa', '../countries/southafrica.html', 'South Africa, located at the southern tip of Africa, offers diverse landscapes, rich history, wildlife safaris, and vibrant cities like Cape Town and Johannesburg.', 'South Africa', '1,221,037', 'Afrikaans, English, Zulu, Xhosa', 'Pretoria', 'Rand', '59 Million', 'southafricawallpaper.jpg', '../assets/southafricawallpaper.jpg', 0);



INSERT INTO country_highlights (name, country_id, description, link, picture_name, picture_path, modified_by_user) 
VALUES 
('Brandenburg Gate', 1, 'The Brandenburg Gate is a neoclassical monument in Berlin, one of Germany’s most famous landmarks.', '../countries/germany.html', 'brandenburggate.png', '../assets/brandenburggate.png', 'null')
,('Hagia Sophia', 2, 'Hagia Sophia is a historic architectural wonder in Istanbul, showcasing a blend of Christian and Islamic influences.', '../countries/turkey.html','turkey-highlight1.jpg', '../assets/turkeyhighlight.jpg', 'null')
,('Kyiv Pechersk Lavra', 3, 'Kyiv Pechersk Lavra is a historic Orthodox Christian monastery in Kyiv, a UNESCO World Heritage Site.', '../countries/ukraine.html', 'kiewkloster.jpg', '../assets/kiewkloster.jpg','null')
,('Bran Castle', 4, 'Bran Castle, often associated with the Dracula legend, is a popular tourist attraction in Romania.', '../countries/romania.html','romania-highlight1.jpeg', '../assets/romania-highlight1.jpeg', 'null')
,('Plitvice Lakes National Park', 5, 'Plitvice Lakes National Park is a UNESCO World Heritage site known for its cascading lakes and waterfalls.', '../countries/croatia.html','croatia-highlight2.png', '../assets/croatia-highlight2.png', 'null');

INSERT INTO products (name, country_id, description, price, city, picture_name, picture_path, link, modified_by_user)
VALUES 
('Villa in Odesa', 3, 'A beautiful villa in Odesa, Ukraine, offering modern amenities and a relaxing stay in a vibrant city on the Black Sea.', 61.00, 'Odesa', 'hotoffer1.jpg', 'assets/hotoffer1.jpg', 'https://www.tripadvisor.de/Hotel_Review-g295368-d2619797-Reviews-Villa_Le_Premier-Odesa_Odesa_Oblast.html', 'admin')
,('Beach House in Izmir', 2, 'An exclusive beach house in Izmir, Turkey, providing a luxurious retreat with stunning views of the Aegean Sea.', 413.00, 'Izmir', 'hotoffer2.jpg', 'assets/hotoffer2.jpg', 'https://www.hellovillam.com/en/villa-kasovari', 'admin')
,('Berlin Weekend Getaway', 1, 'Enjoy a relaxing weekend in Berlin, a city rich in history and culture, offering famous landmarks and vibrant street life.', 250.00, 'Berlin', 'berlinoffer.jpg', 'assets/berlinoffer.jpg', NULL, 'admin')
,('All-Inclusive Beach Holiday', 5, 'Escape to sunny Spain with an all-inclusive beach holiday that includes meals, drinks, and activities for a stress-free getaway.', 700.00, 'N/A', 'spainoffer.jpg', 'assets/spainoffer.jpg', NULL, 'admin')
,('Paris City Experience', 9, 'Explore Paris with a 3-day city pass, including access to the Louvre, Eiffel Tower, and a Seine River cruise for an unforgettable experience.', 350.00, 'Paris', 'parisoffer.jpeg', 'assets/parisoffer.jpeg', NULL, 'admin')
,('Luxury Resort in Mallorca', 5, 'Stay at a luxury resort in Mallorca, Spain, with exclusive spa treatments, private beach access, and gourmet dining experiences.', 1200.00, 'Mallorca', 'mallorcaoffer.jpg', 'assets/mallorcaoffer.jpg', NULL, 'admin')
,('New York', 6, 'Explore the iconic sights of New York, from Times Square to Central Park, in this vibrant and bustling metropolis.', 400.00, 'New York', 'newyorkoffer.jpeg', 'assets/newyorkoffer.jpeg', 'https://www.nyctourism.com', 'admin')
,('Tokyo', 7, 'Immerse yourself in Tokyo, a city where ancient traditions meet cutting-edge technology and vibrant street life.', 250.00, 'Tokyo', 'tokiooffer.jpeg', 'assets/tokiooffer.jpeg', 'https://www.gotokyo.org/en/index.html', 'admin')
,('Sydney', 8, 'Relax in Sydney, Australia, with its stunning beaches, iconic harbor, and vibrant cultural scene.', 600.00, 'Sydney', 'sydneyoffer.jpg', 'assets/sydneyoffer.jpg', 'https://www.sydney.com', 'admin')
,('Rome', 9, 'Walk through the historic streets of Rome, with its ancient monuments, the Vatican, and world-class art and architecture.', 750.00, 'Rome', 'romeoffer.jpg', 'assets/romeoffer.jpg', 'https://www.turismoroma.it/en', 'admin')
,('Beach Resort in Maldives', 10, 'A luxurious all-inclusive beach resort in the Maldives, offering crystal-clear waters, white sandy beaches, and unforgettable service.', 2500.00, 'N/A', 'allinclusivemaledives.jpg', 'assets/allinclusivemaledives.jpg', NULL, 'admin')
,('Caribbean Cruise', 11, 'Set sail on a Caribbean cruise, with all meals, drinks, and excursions included for an unforgettable experience at sea.', 3000.00, 'N/A', 'carribeanoffer.jpeg', 'assets/carribeanoffer.jpeg', NULL, 'admin')
,('Luxury Safari in South Africa', 12, 'Experience the thrill of a luxury safari in South Africa, with guided tours, wildlife sightings, and all-inclusive meals and drinks.', 4000.00, 'N/A', 'safarioffer.jpeg', 'assets/safarioffer.jpeg', NULL, 'admin')
,('Luxury Apartment in Paris', 9, 'Stay in a luxury apartment in Paris, offering sophisticated style and proximity to the city’s best shops, cafes, and cultural landmarks.', 250.00, 'Paris', 'parisapartment.jpg', 'assets/parisapartment.jpg', NULL, 'admin')
,('Beachfront Condo in Miami', 6, 'Enjoy a luxurious beachfront condo in Miami, Florida, with panoramic ocean views and exclusive amenities.', 350.00, 'Miami', 'miamiapartment.jpeg', 'assets/miamiapartment.jpeg', NULL, 'admin')
,('Modern Apartment in New York', 6, 'Stay in a modern apartment near Central Park, offering a chic urban experience in the heart of New York City.', 400.00, 'New York', 'newyorkapartment.jpeg', 'assets/newyorkapartment.jpeg', NULL, 'admin');


--('Villa in Odesa',,, 61.00,                     'Ukraine', 'Odesa', 'hotoffer1.jpg', 'assets/hotoffer1.jpg', 'https://www.tripadvisor.de/Hotel_Review-g295368-d2619797-Reviews-Villa_Le_Premier-Odesa_Odesa_Oblast.html', 'admin')
--,('Beach House in Izmir',,, 413.00,             'Türkei', 'Izmir', 'hotoffer2.jpg', 'assets/hotoffer2.jpg', 'https://www.hellovillam.com/en/villa-kasovari', 'admin')
--,('Berlin Weekend Getaway',,, 250.00,           'Deutschland', 'Berlin', 'berlinoffer.jpg', 'assets/berlinoffer.jpg', NULL, 'admin')
--,('All-Inclusive Beach Holiday',,, 700.00,      'Spanien', 'N/A', 'spainoffer.jpg', 'assets/spainoffer.jpg', NULL, 'admin')
--,('Paris City Experience',,, 350.00,            'Frankreich', 'Paris', 'parisoffer.jpeg', 'assets/parisoffer.jpeg', NULL, 'admin')
--,('Luxury Resort in Mallorca',,, 1200.00,       'Spanien', 'Mallorca', 'mallorcaoffer.jpg', 'assets/mallorcaoffer.jpg', NULL, 'admin')
--,('New York',,, 400.00,                         'USA', 'New York', 'newyorkoffer.jpeg', 'assets/newyorkoffer.jpeg', 'https://www.nyctourism.com', 'admin')
--,('Tokyo',,, 250.00,                            'Japan', 'Tokio', 'tokiooffer.jpeg', 'assets/tokiooffer.jpeg', 'https://www.gotokyo.org/en/index.html', 'admin')
--,('Sydney',,, 600.00,                           'Australien', 'Sydney', 'sydneyoffer.jpg', 'assets/sydneyoffer.jpg', 'https://www.sydney.com', 'admin')
--,('Rome',,, 750.00,                             'Italien', 'Rom', 'romeoffer.jpg', 'assets/romeoffer.jpg', 'https://www.turismoroma.it/en', 'admin')
--,('Beach Resort in Maldives',,, 2500.00,        'Maldiven', 'N/A', 'allinclusivemaledives.jpg', 'assets/allinclusivemaledives.jpg', NULL, 'admin')
--,('Caribbean Cruise',,, 3000.00,                'Karibik', 'N/A', 'carribeanoffer.jpeg', 'assets/carribeanoffer.jpeg', NULL, 'admin')
--,('Luxury Safari in South Africa',,, 4000.00,   'Südafrika', 'N/A', 'safarioffer.jpeg', 'assets/safarioffer.jpeg', NULL, 'admin')
--,('Luxury Apartment in Paris',,, 250.00,        'Frankreich', 'Paris', 'parisapartment.jpg', 'assets/parisapartment.jpg', NULL, 'admin')
--,('Beachfront Condo in Miami',,, 350.00,         'USA', 'Miami', 'miamiapartment.jpeg', 'assets/miamiapartment.jpeg', NULL, 'admin')
--,('Modern Apartment in New York',,, 400.00,      'USA', 'New York', 'newyorkapartment.jpeg', 'assets/newyorkapartment.jpeg', NULL, 'admin');

