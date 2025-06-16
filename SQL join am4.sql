select * from Users;
select * from Membership;
--joins on users and members
select u.users_id, u.users_name
from Users u
inner join Membership m on u.users_id = m.users_id;

SELECT u.users_id,u.users_name, m.current_points
FROM Users u
LEFT JOIN Membership m ON u.users_id = m.users_id;

select * from Users u
full join Membership m
on u.users_id = m.users_id;

select* from Users;

insert into Users(users_id,users_name,email,phone) values
(5,'Mahesh','',23),
(6,'Suresh','',321);

insert into Membership(membership_id,current_points,booking_id,users_id) values 
(5,50,107,5);
insert into Membership(membership_id,current_points,booking_id,users_id) values 
(6,300,100,6);

select * from Booking;
insert into Booking(booking_id,booking_datetime,total_cost,users_id,show_id) values 
(105,'2025-06-12 09:15:00.000',180,5,2),
(106,'2025-06-12 03:15:00.000',390,6,1);

-- join movie table with cast :- for more information about movie
select m.movie_id, m.title, c.person_name,c.cast_role from Movie m
inner join MovieCast c
on m.movie_id = c.movie_id;

select * from Show;
alter table Show drop column show_seat_id;
select *from Booking;

-- left join on show and booking
select s.show_id, s.show_datetime, b.booking_id, b.booking_datetime, b.total_cost
from Show s
left join  Booking b
on s.show_id = b.show_id
order by show_datetime;

---- joining 3 tables  Users , Booking , Ticket
select u.users_name, b.booking_id, t.ticket_id, t.delivery_method
FROM Users u
LEFT JOIN Booking b ON u.users_id = b.users_id
LEFT JOIN Ticket t ON b.booking_id = t.booking_id;

------full join user ,booking, show  on user id (wrong)
select * from Users;
select * from Booking;
select * from Show;

select * from Show;select u.users_name, u.phone , b.booking_id,b.booking_datetime, b.total_cost, s.show_id
from Users u
full join Booking b on u.users_id = b.users_id
full join Show s on b.show_id = s.show_id;

------ join show, seat, showseat
SELECT 
    sh.show_id, sh.show_datetime, se.seat_number, ss.is_available
FROM Show sh
JOIN ShowSeat ss ON ss.show_id = sh.show_id
JOIN Seat se ON ss.seat_id = se.seat_id;

