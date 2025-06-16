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

------------------------------------
---Taking table courses and performing 1 nf(Courses_1NF[atomic]) and 2 nf(Students,admits[no partial dependencies])
create table courses (
c_id int primary key,
student varchar (20),
c_name varchar (50)); 

insert into courses values 
(1, 'Alice','phy, chem, maths'),
(2, 'Kabir','phy, chem,bio'),
(3, 'Radha','phy,maths,geo');

select * from courses;

-- 1 nf
CREATE TABLE Courses_1NF (
    c_id INT,
    student VARCHAR(20),
    c_name VARCHAR(20),
    PRIMARY KEY (c_id, c_name)
);

INSERT INTO Courses_1NF VALUES
(1, 'Alice', 'phy'),
(1, 'Alice', 'chem'),
(1, 'Alice', 'maths'),
(2, 'Kabir', 'phy'),
(2, 'Kabir', 'chem'),
(2, 'Kabir', 'bio'),
(3, 'Radha', 'phy'),
(3, 'Radha', 'maths'),
(3, 'Radha', 'geo');
select * from Courses_1NF;

-- 2 nf
CREATE TABLE Students (
    c_id INT PRIMARY KEY,
    student VARCHAR(20)
);

insert into Students values
(1,'Alice'),(2,'Kabir'),(3,'Radha');
select * from Students;

create table admits (
    c_id INT,
    c_name VARCHAR(20),
    PRIMARY KEY (c_id, c_name),
    FOREIGN KEY (c_id) REFERENCES Students(c_id)
);

insert into admits values
(1, 'phy'),
(1, 'chem'),
(1, 'maths'),
(2, 'phy'),
(2, 'chem'),
(2, 'bio'),
(3, 'phy'),
(3, 'maths'),
(3, 'geo');

select * from admits;

