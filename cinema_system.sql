create database CinemaSystem;
use CinemaSystem;
show databases;

create table Movie(
 Movie_ID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    Duration_Minutes INT NOT NULL CHECK (Duration_Minutes > 0),
     Age_Rating VARCHAR(10) NOT NULL
    );
    
    INSERT INTO Movie VALUES
(1, 'Avatar', 'Action', 162, 'PG-13'),
(2, 'Frozen', 'Animation', 102, 'PG'),
(3, 'Titanic', 'Romance', 195, 'PG-13'),
(4, 'Joker', 'Drama', 122, 'R'),
(5, 'Inception', 'Sci-Fi', 148, 'PG-13');

SELECT * FROM Movie;
describe Movie;
CREATE TABLE Customer(
    Customer_ID INT PRIMARY KEY,
    Fname VARCHAR(100) NOT NULL,
    Lname VARCHAR(100) NOT NULL,
    Phone_Number VARCHAR(15) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE
);

INSERT INTO Customer (Customer_ID, Fname, Lname, Phone_Number, Email) VALUES
(1,'Sara','Alharbi','0500000001','customer1@example.com'),
(2,'Lama','Alotaibi','0500000002','customer2@example.com'),
(3,'Noor','Alqahtani','0500000003','customer3@example.com'),
(4,'Reem','Alghamdi','0500000004','customer4@example.com'),
(5,'Dana','Alshehri','0500000005','customer5@example.com');

SELECT * FROM Customer;
describe Customer;

CREATE TABLE Theater (
    Theater_ID INT PRIMARY KEY,
    Hall_Name VARCHAR(50) NOT NULL,
    Screen_Type VARCHAR(50) NOT NULL
);
INSERT INTO Theater (Theater_ID, Hall_Name, Screen_Type) VALUES
(1, 'Hall 1', 'Standard'),
(2, 'Hall 2', '2D'),
(3, 'Hall 3', '3D'),
(4, 'Hall 4', 'IMAX'),
(5, 'VIP Hall', '4DX');
SELECT * FROM Theater;
describe Theater;

CREATE TABLE Ticket (
    Ticket_ID INT PRIMARY KEY,
    Seat_Number VARCHAR(10) NOT NULL,
    Price DECIMAL(5,2) CHECK (Price > 0),
    Booking_Date DATE NOT NULL,
    Theater_ID INT,
    Customer_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Theater_ID) REFERENCES Theater(Theater_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Movie_ID) REFERENCES Movie(Movie_ID)
);

INSERT INTO Ticket VALUES
(1, 'A1', 50.00, '2026-04-01', 1, 1, 1),
(2, 'A2', 50.00, '2026-04-01', 2, 2, 2),
(3, 'B1', 60.00, '2026-04-02', 3, 3, 3),
(4, 'B2', 60.00, '2026-04-02', 4, 4, 4),
(5, 'C1', 70.00, '2026-04-03', 5, 5, 5);
SELECT * FROM Ticket;
describe Ticket;

show tables;

SELECT Title, Genre 
FROM Movie 
WHERE Duration_Minutes > 140;

SELECT SUM(Price) AS Total_Revenue 
FROM Ticket;

SELECT Seat_Number, Booking_Date
FROM Ticket
WHERE Booking_Date = '2026-04-01';

SELECT AVG(Duration_Minutes) AS Avg_Duration
FROM Movie;


SELECT Customer.Fname, Ticket.Seat_Number
FROM Customer
JOIN Ticket ON Customer.Customer_ID = Ticket.Customer_ID;


SELECT Ticket_ID, Seat_Number
FROM Ticket
WHERE Movie_ID = (
    SELECT Movie_ID 
    FROM Movie 
    WHERE Title = 'Avatar'
);


CREATE VIEW Customer_Tickets_View AS
SELECT 
    c.Fname,
    c.Lname,
    m.Title,
    t.Seat_Number,
    t.Price
FROM Ticket t
JOIN Customer c ON t.Customer_ID = c.Customer_ID
JOIN Movie m ON t.Movie_ID = m.Movie_ID;


SELECT * FROM Customer_Tickets_View;