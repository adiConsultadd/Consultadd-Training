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
