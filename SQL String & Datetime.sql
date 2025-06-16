----- String functions, aggregate functions
select * from Movie;

----upper()
select movie_id, title, upper(title) as Cap from Movie;
select movie_id, title, upper(title), genre, reverse(genre) as gen from Movie;

----lower()
select movie_id, title, upper(title), LOWER(title) from Movie;

----replace()
SELECT title, genre, REPLACE(genre, 'Adventure', '    Sci-Fi') AS new_genre from Movie;

SELECT AVG(current_points) AS avg_points FROM Membership;

--- wrong ----SELECT title, genre, REPLACE(genre, 'Adventure', '    Sci-Fi') AS new_genre ltrim(new_genre) from Movie;
insert into Movie(movie_id,title,genre,rating,status,poster_image_url) values
(6, 'Dune', 'Sci-Fi', 8.2, 'Now Showing', 'https://example.com/dune.jpg'),
(7, 'La La Land', 'Musical', 8.0, 'Coming Soon', 'https://example.com/lalaland.jpg');

delete from Movie
where movie_id = 7;

insert into Movie(movie_id,title,genre,rating,status,poster_image_url) values
(7, '    La La Land ', 'Musical     ', 8.0, 'Coming Soon','' );

----perform ltrim
select title, ltrim(title) as Trimmed_Title from Movie;

---- permanent ltrim, reverse
ALTER TABLE Movie ADD Trimmed_Title VARCHAR(255);
ALTER TABLE Movie ADD Revesed_genre VARCHAR(255);

update Movie
set Trimmed_Title = ltrim(title);

update Movie
set Revesed_genre = ltrim(REVERSE(genre)) ;

----perform rtrim
select ltrim(title), genre ,rtrim(genre) as trim_genre from Movie;

----perform instring :- instring function is not available in MS Sql
------ perform substring
s

----DATE TIME FUNCTIONS
select * from Booking;
select* from Ticket;

-- sysdatetime() function
select sysdatetime() as TodayDate;

-- getdate(), current_timestamp(), SYSDATETIMEOFFSET() functions
select GETDATE() as Today_Date;
select CURRENT_TIMESTAMP;
SELECT SYSDATETIMEOFFSET() AS CurrentDateTimeWithOffset;

---------------
SELECT show_id, MIN(booking_datetime) AS First_BookingTime
FROM Booking
GROUP BY show_id
ORDER BY First_BookingTime;
----------------
--only date
select booking_id, cast(booking_datetime as date) as Booking_Date from Booking;

 -- only time
 select booking_id, cast(booking_datetime as time) as Booking_time from Booking;

 -- year, month, day, hour and minute
 SELECT booking_id,
 YEAR(booking_datetime) AS Year,
 MONTH(booking_datetime) AS Month,
 DAY(booking_datetime) AS Day,
 DATEPART(HOUR, booking_datetime) AS Hour,
 DATEPART(MINUTE, booking_datetime) AS Minute
FROM Booking;
