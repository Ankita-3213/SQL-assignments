create table Screen(
screen_id INT PRIMARY KEY,
name VARCHAR(50),
class_type VARCHAR(10),
capacity INT
);
select * from Screen;

create table Seat(
seat_id INT PRIMARY KEY,
seat_number VARCHAR(10),
screen_id INT,
FOREIGN KEY (screen_id) REFERENCES Screen(screen_id)
);
select * from Seat;

create table Movie(
movie_id INT PRIMARY KEY,
title VARCHAR(255),
genre	VARCHAR	(50),
rating	DECIMAL	(3,1),
status	VARCHAR	(20),
poster_image_url VARCHAR (255)
);
select * from Movie;

create table MovieCast(
cast_id INT PRIMARY KEY,
person_name	VARCHAR	(100),
cast_role VARCHAR	(100),
movie_id INT,
FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
select * from MovieCast;

create table Show(
show_id INT PRIMARY KEY,
show_datetime	DATETIME,
movie_id INT,
screen_id int,
FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
FOREIGN KEY (screen_id) REFERENCES Screen(screen_id)
);
select * from Show;

create table ShowSeat(
show_seat_id INT PRIMARY KEY,
is_available	BIT,
show_id int,
seat_id int,
FOREIGN KEY (show_id) REFERENCES Show(show_id),
FOREIGN KEY (seat_id) REFERENCES Seat(seat_id)
);
select * from ShowSeat;

create table Users(
users_id INT PRIMARY KEY,
users_name VARCHAR	(100),
email	VARCHAR	(150),
phone	VARCHAR	(15)
);
SELECT * FROM Users;

create table Membership(
membership_id int primary key,
current_points int,
booking_id int,
users_id INT,
FOREIGN KEY (users_id) REFERENCES Users(users_id)
);
SELECT * FROM Membership;
DROP table Membership;

create table Booking(
booking_id	INT	PRIMARY KEY,
booking_datetime	DATETIME,	
total_cost	DECIMAL	(10,2),
users_id INT,
show_id int,
FOREIGN KEY (users_id) REFERENCES Users(users_id),
FOREIGN KEY (show_id) REFERENCES Show(show_id)
);
select * from Booking;

create table Ticket(
ticket_id	INT	PRIMARY KEY,
qr_code	VARCHAR	(100),
delivery_method	VARCHAR	(50),
is_downloaded	BIT,	
scanned_at	DATETIME,
booking_id int, 
show_seat_id int,
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
FOREIGN KEY (show_seat_id) REFERENCES ShowSeat(show_seat_id)
);

select * from Ticket;

create table FoodItem(
item_id	INT	IDENTITY PRIMARY KEY,
item_name	VARCHAR	(100),
item_descr	VARCHAR	(100),	
is_combo	BIT
);
select * from FoodItem;
