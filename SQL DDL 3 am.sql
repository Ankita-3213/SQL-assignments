--alter add columns
alter table Screen add 
screen_type varchar(10);
alter table Screen add movie_status varchar(20);
SELECT * FROM Screen;
alter table FoodItem add 
price int ;

--alter drop columns
alter table Screen drop column screen_type, movie_status;
SELECT * FROM Screen;
 
--update
SELECT * From Seat;
update Seat
SET seat_number = 'A3'
WHERE seat_id = 2;

--select
Select seat_number from Seat
Where screen_id = 1;

--order by
Select * from Booking
order by booking_datetime ;

-- Get the top 2 cost
SELECT TOP 3 * FROM Booking ORDER BY total_cost DESC;

select * from ShowSeat;
--where
select show_seat_id ,seat_id from ShowSeat
Where is_available = 1;

select* from Users;
--change values in table using update
--(1, 'John', 'john@gmail.com', 1),(2, 'Mary', 'mary@gmail.com', 2),(3, 'Dev', 'dev@gmail.com', 3),(4, 'Manasi', 'manasi@gmail.com', 4);
update Users 
set users_name = 'John', email = 'john@gmail.com'
where users_id = 1;
update Users
set users_name = 'Mary', email = 'mary@gmail.com'
where users_id = 2;
update Users
set users_name = 'Dev', email = 'dev@gmail.com'
where users_id = 3;
update Users
set users_name = 'Manasi', email = 'manasi@gmail.com'
where users_id = 4;

--check like operator
SELECT users_name,email FROM Users
WHERE email LIKE '%@gmail.com';

-- ascending order of names
SELECT * FROM Users
ORDER BY users_name ASC;

--count()function
SELECT COUNT(*) FROM Users;

-- order by one cloumn in ascending and other in descending
select * from Users
order by  phone desc,users_name asc;

select * from Ticket;

select ticket_id, delivery_method, is_downloaded, booking_id 
from Ticket
where scanned_at IS NULL;

select * from Screen
WHERE capacity >= 150;

select * from Movie;
select * from Movie
where rating < 8.5;

-- groupby 
SELECT genre, COUNT(*) AS total_now_showing
FROM Movie
GROUP BY genre;

SELECT genre, AVG(rating) AS avg_rating
FROM Movie
GROUP BY genre;

SELECT top 3 users_id, SUM(total_cost) as total
FROM Booking GROUP BY users_id;

SELECT top 3 genre, SUM(rating) 
FROM Movie GROUP BY genre;

-------- functions
select * from FoodItem;
update FoodItem 
set price = 150
where item_name = 'Classic Popcorn';

update FoodItem 
set price = 200
where item_name = 'Cheese Nachos';

update FoodItem 
set price = 100
where item_id = 5;

update FoodItem 
set price = 250
where item_id = 3;

select item_name from FoodItem
 where price is null;

 select item_name, price from FoodItem
 where (price between 100 and 300) or price is null;

 SELECT item_name, LEN(item_name) AS length FROM FoodItem;

 select * from FoodItem;
 order by is_combo desc;

 -- offset and fetch 1) top 3 
 --------------------2) 2nd costly item
 SELECT * FROM FoodItem
ORDER BY price DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

select item_name, price from FoodItem 
order by price desc
offset 1 rows fetch next 1 row only;

update FoodItem
set price = 350 where item_id = 6;

----- top 4 using top 
select top 4 * from FoodItem 
order by price desc;

 