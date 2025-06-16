use practice;

CREATE TABLE Unnormalized_Show (
    show_id INT,
    movie_title VARCHAR(255),
    show_timings VARCHAR(255)  
);

select * from Unnormalized_Show;

insert into Unnormalized_Show (show_id, movie_title, show_timings) values
(1, 'Inception', '10:00 AM, 1:00 PM, 4:00 PM'),
(2, 'Interstellar', '9:00 AM, 12:00 PM'),
(3, 'Dune', '11:30 AM, 3:00 PM, 6:00 PM'),
(4, 'Avengers: Endgame', '10:15 AM, 1:45 PM, 5:30 PM');

----- 1 nf by using show_id and show_time as primary key
CREATE TABLE Normalized_Show (
    show_id INT,
    movie_title VARCHAR(100),
    show_time VARCHAR(20),
    PRIMARY KEY (show_id, show_time)
);

insert into Normalized_Show values 
(1, 'Inception', '10:00 AM'),
(1, 'Inception', '1:00 PM'),
(1, 'Inception', '4:00 PM'),
(2, 'Interstellar', '9:00 AM'),
(2, 'Interstellar', '12:00 PM'),
(3,'Dune', '11:30 AM'),
(3,'Dune', '3:00 PM'),
(3,'Dune', '6:00 PM');
select * from Normalized_Show;

