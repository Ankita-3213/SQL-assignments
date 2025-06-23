---- Task 1 - Creating databse
create database PetPals;
use PetPals;

---- Task 2 - Creating Tables
create table Pets(
PetID int identity Primary Key ,
Name varchar(20),
Age int not null,
Breed varchar(30) not null,
Type varchar(20) not null,
AvailableForAdoption bit default 1);

create table  Shelters(
ShelterID int identity Primary Key,
Name varchar(30),
Location varchar(40) not null);

create table  Donations (
DonationID int identity Primary Key,
DonorName varchar(50),
DonationType varchar(20) not null,
DonationAmount decimal(8,2),
DonationItem varchar(40),
DonationDate datetime);

create table AdoptionEvents (
EventID int Primary Key,
EventName varchar(50),
EventDate datetime not null, 
Location varchar(40) not null );

create table Participants(
ParticipantID int Primary Key,
ParticipantName varchar(50) not null,
ParticipantType varchar(20) not null,
EventID int,
FOREIGN KEY (EventID) REFERENCES AdoptionEvents(EventID));

-- inserting data into tables 
insert into Pets (Name, Age, Breed, Type, AvailableForAdoption ) values
('Buddy', 2, 'Beagle', 'Dog', 1),
('Milo', 1, 'Rottweiler', 'Dog', 1),
('Luna', 3, 'Munchkin', 'Cat', 0),
('Julie', 4, 'Labrador', 'Dog', 0),
('Simba', 4, 'Siamese', 'Cat', 1),
('Daisy', 2, 'Stray', 'Cat', 0);

select * from Pets;

insert into Shelters(Name, Location) values
('Happy Tails Shelter', 'Kolhapur, Maharashtra'),
('Paw Haven', 'Pune, Maharashtra'),
('Furry Friends Shelter', 'Mumbai, Maharashtra'),
('Whisker’s Home', 'Raigad, Maharashtra'),
('Hope for Paws', 'Kolhapur, Maharashtra');

select * from Shelters;

insert into Donations(DonorName, DonationType, DonationAmount, DonationItem, DonationDate   ) values
('Raj Malhotra', 'Cash', 1500.00, '', '2025-05-12 11:30:00'),
('Anjali Verma', 'Item', NULL, 'Cat Food Pack', '2025-06-11 14:45:00'),
('Dev ', 'Cash', 750.00, '', '2025-05-15 11:00:00'),
('Aayansh', 'Cash', 2000.00, '', '2025-05-30 18:00:00'),
('Aaradhya', 'Item', NULL, 'Dog Food Pack', '2025-06-06 13:00:00'),
('Sneha Joshi', 'Item', NULL, 'Dog Leash and Toys', '2025-06-15 16:15:00'),
('Kabir Singh', 'Cash', 3000.00, NULL, '2025-06-16 09:20:00');

select * from Donations;

insert into AdoptionEvents(EventID, EventName, EventDate, Location) values
(1,'Love for Paws','2025-06-20 10:00:00', 'Tapovan ground, Kolhapur'),
(2, 'Adopt & Celebrate', '2025-05-05 13:00:00', 'Shivaji Ground, Pune'),
(3, 'Furry Friends Fiesta', '2025-02-14 11:30:00', 'City Hall, Raigad'),
(4, 'Home for Every Paw', '2025-03-01 09:45:00', 'Community Center, Mumbai'),
(5, 'Adoption Carnival', '2025-05-15 16:00:00', 'Kala Academy, Kolhapur');

select * from AdoptionEvents;

insert into Participants(ParticipantID, ParticipantName, ParticipantType, EventID) values
(1, 'Happy Tails Shelter', 'Shelter', 1),
(2, 'Paw Haven', 'Shelter', 2),
(3, 'Tarak Mehta', 'Adopter', 1),
(4, 'Furry Friends Shelter', 'Shelter', 3),
(5, 'Prem Chopra', 'Adopter', 4),
(6, 'Arnav','Adopter',2),
(7, 'Archit', 'Adopter',3),
(8, 'Aaradhya', 'Adopter',4);

select * from Participants;