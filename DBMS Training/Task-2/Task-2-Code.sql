CREATE DATABASE event_management;
USE event_management;

CREATE TABLE Venue (
    VenueId INT PRIMARY KEY AUTO_INCREMENT,
    VenueName VARCHAR(255) NOT NULL UNIQUE,
    Location VARCHAR(255) NOT NULL,
    Capacity VARCHAR(255) NOT NULL 
);

CREATE TABLE Organizer (
    OrganizerId INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(10) NOT NULL 
    CHECK(ContactInfo REGEXP '^[0-9]{10}$')
);

CREATE TABLE Event (
    EventId INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(255) NOT NULL,
    EventDate DATE NOT NULL,
    VenueId INT NOT NULL,
    OrganizerId INT NOT NULL,
    FOREIGN KEY (VenueId) REFERENCES Venue(VenueId),
    FOREIGN KEY (OrganizerId) REFERENCES Organizer(OrganizerId)
);

CREATE TABLE Attendee (
    AttendeeId INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Phone VARCHAR(10) NOT NULL UNIQUE
    CHECK(Phone REGEXP '^[0-9]{10}$')
);

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    BookingDate DATE NOT NULL,
    EventID INT NOT NULL,
    AttendeeID INT NOT NULL,
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (AttendeeID) REFERENCES Attendee(AttendeeID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentStatus VARCHAR(50) NOT NULL,
    BookingID INT NOT NULL UNIQUE,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingId)
);

CREATE TABLE Feedback (
    FeedbackId INT PRIMARY KEY AUTO_INCREMENT,
    Comments VARCHAR(500),
    Rating INT NOT NULL CHECK(Rating BETWEEN 1 AND 5),
    EventId INT NOT NULL,
    FOREIGN KEY (EventId) REFERENCES Event(EventId)
);


INSERT INTO Venue (VenueName, Location, Capacity) VALUES
('Taj Palace', 'New Delhi', '500'),
('Nehru Stadium', 'Mumbai', '1000'),
('Bangalore Convention Center', 'Bangalore', '750'),
('Chennai Trade Centre', 'Chennai', '600'),
('Hyderabad Expo Hall', 'Hyderabad', '800');

INSERT INTO Organizer (Name, ContactInfo) VALUES
('Amit Sharma', '9876543210'),
('Rohini Verma', '9823456789'),
('Karan Mehta', '9765432109'),
('Sakshi Iyer', '9912345678'),
('Vikram Singh', '9854321098');

INSERT INTO Event (EventName, EventDate, VenueId, OrganizerId) VALUES
('Tech Summit India', '2025-03-15', 1, 1),
('Startup Expo', '2025-04-10', 2, 2),
('AI Conference', '2025-05-05', 3, 3),
('Healthcare Innovation Meet', '2025-06-20', 4, 4),
('E-commerce Growth Hack', '2025-07-25', 5, 5);

INSERT INTO Attendee (Name, Email, Phone) VALUES
('Rahul Gupta', 'rahul.gupta@example.com', '9998887776'),
('Pooja Reddy', 'pooja.reddy@example.com', '9876543211'),
('Ankit Verma', 'ankit.verma@example.com', '9765432198'),
('Neha Sharma', 'neha.sharma@example.com', '9654321987'),
('Arjun Nair', 'arjun.nair@example.com', '9543219876');

INSERT INTO Booking (BookingDate, EventID, AttendeeID) VALUES
('2025-03-01', 1, 1),
('2025-04-01', 2, 2),
('2025-05-01', 3, 3),
('2025-06-01', 4, 4),
('2025-07-01', 5, 5);

INSERT INTO Payment (Amount, PaymentDate, PaymentStatus, BookingID) VALUES
(5000.00, '2025-03-02', 'Completed', 1),
(7000.00, '2025-04-02', 'Completed', 2),
(4500.00, '2025-05-02', 'Pending', 3),
(6000.00, '2025-06-02', 'Completed', 4),
(8000.00, '2025-07-02', 'Failed', 5);

INSERT INTO Feedback (Comments, Rating, EventId) VALUES
('Great networking event!', 5, 1),
('Very insightful sessions', 4, 2),
('Could have been better organized', 3, 3),
('Loved the speaker lineup!', 5, 4),
('Good event but too crowded', 4, 5);