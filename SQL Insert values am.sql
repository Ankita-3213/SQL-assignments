INSERT INTO Screen (screen_id, name, class_type, capacity) VALUES
(1, 'Screen 1', 'Gold', 150),
(2, 'Screen 2', 'Silver', 200),
(3, 'Screen 3', 'Platinum', 120),
(4, 'Screen 4', 'Gold', 180);
SELECT * FROM Screen;

insert into Seat(seat_id, seat_number, screen_id) VALUES 
(1, 'A1', 1),(2, 'A2', 1),(3, 'B1', 2),(4, 'B2', 2);
Select * from Seat;

insert into Movie (movie_id, title, genre, rating, status, poster_image_url) VALUES
(1, '  Inception  ', 'Sci-Fi', 8.8, 'Now Showing', 'https://example.com/inception.jpg'),
(2, '  The Notebook   ', 'Romance', 7.8, 'Coming Soon', 'https://example.com/notebook.jpg'),
(3, '  Interstellar  ', 'Adventure', 8.6, 'Now Showing', 'https://example.com/interstellar.jpg'),
(4, '  Coco', 'Animation   ', 8.4, 'Coming Soon', 'https://example.com/coco.jpg'),
(5, '   The Dark Knight  ', 'Action', 9.0, 'Now Showing', 'https://example.com/darkknight.jpg');
SELECT * FROM Movie;

insert into MovieCast (cast_id, person_name, cast_role, movie_id) VALUES
(1, 'Leonardo DiCaprio', 'Dom Cobb', 1),
(2, 'Christian Bale', 'Bruce Wayne / Batman', 5),
(3, 'Rachel McAdams', 'Allie Hamilton', 2),
(4, 'Matthew McConaughey', 'Cooper', 3),
(5, 'Anthony Gonzalez', 'Miguel', 4);
SELECT * FROM MovieCast;

insert into Show (show_id, show_datetime, movie_id, screen_id) VALUES
(1, '2025-06-11 10:30:00', 1, 1),(2, '2025-06-11 14:00:00', 2, 2),(3, '2025-06-12 17:30:00', 4, 3),(4, '2025-06-13 11:00:00', 3, 4);
SELECT * FROM Show;

insert into ShowSeat(show_seat_id, is_available, show_id, seat_id) VALUES 
(1, 1, 1, 1),(2, 0, 1, 2),(3, 1, 2, 3),(4, 1, 2, 4);
SELECT * FROM ShowSeat;

insert into Users(users_id, users_name, email, phone) VALUES
(1, 'John', 'john@gmail.com', 1),(2, 'Mary', 'mary@gmail.com', 2),(3, 'Dev', 'dev@gmail.com', 3),(4, 'Manasi', 'manasi@gmail.com', 4);
SELECT * FROM Users;

insert into Membership(membership_id, current_points, booking_id, users_id) VALUES
(1, 120, 101, 1),(2, 250, 102, 2),(3, 90, 103, 3),(4, 180, 104, 4);
SELECT * FROM Membership;

INSERT INTO Booking (booking_id, booking_datetime, total_cost, users_id, show_id) VALUES 
(101, '2025-06-10 09:15:00', 450.00, 1, 1),
(102, '2025-06-10 13:45:00', 300.00, 2, 2),
(103, '2025-06-11 16:20:00', 600.00, 3, 3),
(104, '2025-06-11 10:30:00', 250.00, 4, 4);
SELECT * FROM Booking;

INSERT INTO Ticket (ticket_id, qr_code, delivery_method, is_downloaded, scanned_at, booking_id, show_seat_id) VALUES 
(1, 'QR123ABC', 'Email', 1, '2025-06-12 10:25:00', 101, 1),
(2, 'QR456DEF', 'SMS', 0, NULL, 101, 2),
(3, 'QR789GHI', 'App Download', 1, '2025-06-12 13:55:00', 102, 3),
(4, 'QR321JKL', 'Email', 1, NULL, 103, 4);
SELECT * FROM Ticket;

INSERT INTO FoodItem (item_name, item_descr, is_combo) VALUES
('Classic Popcorn', 'Salted popcorn in medium bucket', 0),
('Cheese Nachos', 'Nachos with melted cheese dip', 0),
('Combo 1', 'Popcorn + Soft Drink', 1),
('Combo 2', 'Nachos + Coke + Brownie', 1),
('Soft Drink', 'Chilled carbonated drink', 0),
('Brownie', 'Warm chocolate brownie', 0),
('Combo 3', 'Burger + Fries + Drink', 1),
('French Fries', 'Crispy salted fries', 0);
select * from FoodItem;

