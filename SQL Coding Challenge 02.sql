use PetPals;

--- Task 5 pets available for adoption
select Name, Age, Breed, Type from Pets
where AvailableForAdoption = 1;

-- Task 6  names of participants
select p.ParticipantName, p.ParticipantType from Participants p
join AdoptionEvents a 
on p.EventID = a.EventID
where p.EventID in (1,2,3) ;

--Task 7 stored procedure 
create procedure UpdateShelInfo
 @ShelterID int, @NewName varchar(30), @NewLocation varchar(40)
 as 
 begin
	IF EXISTS (SELECT 1 FROM Shelters WHERE ShelterID = @ShelterID)
	begin	
		Update Shelters
        set Name = @NewName,
            Location = @NewLocation
        where ShelterID = @ShelterID;
		PRINT 'Shelter information updated successfully.';
	end		
	else
	begin
		PRINT' invalid shelter ID ';
	end
end;

EXEC UpdateShelInfo 
    @ShelterID = 5, 
    @NewName = 'Hope for Paws', 
    @NewLocation = 'Nehru Nagar, Pune';

select* from Shelters;

-- Task 8  total donation amount for each shelter
select * from Donations;
alter table Donations
add ShelterID int;

update Donations
set ShelterID = 1
where DonationID = 1;
update Donations
set ShelterID = 2
where DonationID = 3;
update Donations
set ShelterID = 3
where DonationID = 4;
update Donations
set ShelterID = 4
where DonationID = 7;

alter table Donations
add constraint Donation_ShelterID
foreign key (ShelterID) references Shelters(ShelterID);

select s.Name, sum(d.DonationAmount) as Total_Donation from Shelters s
left join Donations d on s.ShelterID = d.ShelterID
group by s.Name;

-- Task 9 Pets without owners
select * from Pets;

alter table Pets
add OwnerID int;

update Pets
set OwnerID = 1
where PetID = 1;
update Pets
set OwnerID = 3
where PetID = 2;
update Pets
set OwnerID = 3
where PetID = 5;

select Name, Age, Breed, Type from Pets
where OwnerId is null;

-- Task 10 Total Donation amount according to month and year 
select datename(Month,DonationDate) as Don_Month,year(DonationDate)as Don_Year, sum(DonationAmount) from Donations
group by datename(Month,DonationDate), year(DonationDate)
order by Don_Month,Don_Year;

-- Task 11 Distinct breeds
select distinct Breed from Pets
where (Age between 1 and 3) or(Age >5); 

-- Task 12 Pets and Their shelters
alter table Pets
add Shelter_ID int;
select * from Pets;

update Pets
set Shelter_ID = 2
where PetID = 1;
update Pets
set Shelter_ID = 3
where PetID = 2;
update Pets
set Shelter_ID = 4
where PetID = 3;
update Pets
set Shelter_ID = 5
where PetID = 4;
update Pets
set Shelter_ID = 1
where PetID = 5;
update Pets
set Shelter_ID = 2
where PetID = 6;

select p.Name, p.Type, s.Name as Shelter, s.Location
from Pets p
join Shelters s
on p.Shelter_ID = s.ShelterID;

-- Task 13 total number of participants in events  organized by shelters located in specific city. 
select * from AdoptionEvents; select * from Shelters; select * from Participants;
alter table AdoptionEvents
add Shel_ID int;

update AdoptionEvents
set Shel_ID = 1
where EventID =1 ;
update AdoptionEvents
set Shel_ID = 2
where EventID =2 ;
update AdoptionEvents
set Shel_ID = 3
where EventID =3 ;
update AdoptionEvents
set Shel_ID = 4
where EventID =4 ;
update AdoptionEvents
set Shel_ID = 5
where EventID =5 ;

SELECT COUNT(p.ParticipantID) AS TotalParticipants
FROM Participants p
JOIN AdoptionEvents ae ON p.EventID = ae.EventID
JOIN Shelters s ON ae.Shel_ID = s.ShelterID
WHERE s.Location like '%Kolhapur%';  

-- Task 14 Unique breeds age between 1 and 5 years
select distinct Breed from Pets
where Age  between 1 and 5;

-- Task 15 Not adopted pets
select Name ,Type from Pets
where AvailableForAdoption = 1;

-- Task 16  
create table Users (
    OwnerID int Primary Key,
    UserName varchar(50) NOT NULL
);
insert into Users values
(1, 'Tarak Mehta'),
(2, 'Prem Chopra'),
(3, 'Arnav'),
(4, 'Archit'),
(5, 'Aaradhya');

create table Adoption(
AdoptionID int identity primary key,
PetID int,
OwnerID int,
foreign key (PetID) references Pets(PetID),
foreign key (OwnerID) references Users(OwnerID),
);

insert into Adoption(PetID,OwnerID) values 
(1,1);
insert into Adoption(PetID,OwnerID) values 
(2,3),(5,3);

select * from Pets; select * from Adoption;

select p.Name AS PetName, u.UserName AS AdopterName
from  Adoption a
join Pets p ON a.PetID = p.PetID
join Users u ON a.OwnerID = u.OwnerID; 

-- Task 17 No of pets in shelters available for adoption
update Pets
set AvailableForAdoption = 0
where PetID in (Select PetID from Adoption);

insert into Pets(Name, Age, Breed, Type, AvailableForAdoption,Shelter_ID) values
('Rocky', 2, 'German Shepherd', 'Dog', 1, 1),
('Snowy', 1, 'Persian', 'Cat', 1, 2),
('Tommy', 3, 'Golden Retriever', 'Dog', 0, 3),
('Chloe', 2, 'Himalayan', 'Cat', 1, 4),
('Bruno', 5, 'Stray', 'Dog', 0, 2);

select s.Name, count(p.PetID) from Shelters s
join Pets p
on s.ShelterID = p.Shelter_ID
where p.AvailableForAdoption = 1
group by s.Name;

-- Task 18 
select p1.PetID as Pet1_id, p1.Name as Pet1_Name, p2.PetID as Pet2_Id, p2.Name as Pet2_Name, p1.Shelter_ID, p1.Breed
from Pets p1, Pets p2
where p1.PetID < p2.PetID and p1.Shelter_ID = p2.Shelter_ID and p1.Breed = p2.Breed;

-- Task 19
select s.Name as ShelterName, a.EventName as EventName, a.EventDate
FROM Shelters s, AdoptionEvents a;

-- Task 20
select top 1 s.Name , count(a.PetID) 
from Shelters s, Pets p, Adoption a
where s.ShelterID = p.Shelter_ID and p.PetID = a.PetID
group by s.Name
order by count(a.PetID) desc;
