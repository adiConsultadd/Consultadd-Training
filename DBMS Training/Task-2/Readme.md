# Task :
#### In the second task we had to do the following things for an Event Management System : 
- Make Entity Relationship Diagram - ER Diagram
- Make Class Diagram 
- Give Working Queries

# Approach : 
#### Firstly for an Event Management System we need to make the following Tables : 
#### Event Table : 
- EventId : A unique numeric value for each event
- EventName : Name of the Event
- EventDate : Date of the Event 
- VenueId : Id of the venue at which event will take place
- OrganizerId : Id of the organizer

#### Venue Table : 
- VenueId : A unique numeric value for each venue
- VenueName : Name of the Venue
- Location : Location of the venue
- Capacity : The total capacity of this Venue

#### Attendee Table : 
- AttendeeId : A unique numeric value for each person
- Name : Name of the person
- Email : Email of the person
- Phone : Phone Number of the person

#### Organizer Table : 
- OrganizerId : A unique numeric value for each organizer
- OrganizerName : Name of the organizer
- ContactInfo : Phone Number of the organizer

#### Booking Table : 
- BookingId : A unique numeric value for each booking done
- BookingDate : Date of the booking
- EventId : Id of the event for which this booking is done
- AttendeeId : Id of the person who has made this booking 

#### Payment Table : 
- PaymentId : A unique numeric value for each Payment
- Amount : Amount of this Payment
- PaymentDate : Date on which this payment was made
- PaymentStatus : Status of this payment, completed or not?
- BookingId : Id of the booking for which this payment was made

#### Feedback Table : 
- FeedbackId : A unique numeric value for each FeedbackId
- Comments : Content of the feedback is stored here
- Ratings : A rating is given 1 - 5
- EventId : Id of the event of which this feedback


# Code 
### Create A New Databasae And Use It 
```sql 
Create Database event_management;
Use event_management;
```
### Create Venue Table
```sql
CREATE TABLE Venue (
	VenueId INT PRIMARY KEY AUTO_INCREMENT,
    VenueName VARCHAR(255) NOT NULL UNIQUE,
    Location VARCHAR(255) NOT NULL,
    Capacity VARCHAR(255) NOT NULL 
);
```
### Create Organizer Table
```sql
CREATE TABLE Organizer (
	OrganizerId INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(10) NOT NULL
    CHECK(ContactInfo REGEXP '^[0-9]{10}$')
); 
```
### Create Event Table
```sql
CREATE TABLE Event (
	EventId INT PRIMARY KEY AUTO_INCREMENT,
    EventName VARCHAR(255) NOT NULL,
    EventDate DATE NOT NULL,
    VenueId INT NOT NULL,
    OrganizerId INT NOT NULL,
    FOREIGN KEY (VenueId) REFERENCES Venue(VenueId),
    FOREIGN KEY (OrganizerId) REFERENCES Organizer(OrganizerId)
);
```
### Create Attendee Table
```sql
CREATE TABLE Attendee (
	AttendeeId INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Phone VARCHAR(10) NOT NULL UNIQUE
    CHECK(Phone REGEXP '^[0-9]{10}$')
);
```
### Create Booking Table
```sql
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
	BookingDate DATE NOT NULL,
    EventID INT NOT NULL,
    AttendeeID INT NOT NULL,
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (AttendeeID) REFERENCES Attendee(AttendeeID)
);
```
### Create Payment Table
```sql
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentStatus VARCHAR(50) NOT NULL,
    BookingID INT NOT NULL UNIQUE,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingId)
);
```
### Create Feedback Table
```sql
CREATE TABLE Feedback (
	FeedbackId INT PRIMARY KEY AUTO_INCREMENT,
    Comments VARCHAR(500),
    Rating INT NOT NULL CHECK(Rating BETWEEN 1 AND 5),
    EventId INT NOT NULL,
    FOREIGN KEY (EventId) REFERENCES Event(EventId)
);
```

[Entity Relationship Diagram](Task-2-ER-Diagram.png)

[Class Diagram](Task-2-Class-Diagram.png)

# Input Data 
### Venue Table
```sql
INSERT INTO Venue (VenueName, Location, Capacity) VALUES
('Taj Palace', 'New Delhi', '500'),
('Nehru Stadium', 'Mumbai', '1000'),
('Bangalore Convention Center', 'Bangalore', '750'),
('Chennai Trade Centre', 'Chennai', '600'),
('Hyderabad Expo Hall', 'Hyderabad', '800');
```

### Organizer Table
```sql
INSERT INTO Organizer (Name, ContactInfo) VALUES
('Amit Sharma', '9876543210'),
('Rohini Verma', '9823456789'),
('Karan Mehta', '9765432109'),
('Sakshi Iyer', '9912345678'),
('Vikram Singh', '9854321098');
```

### Event Table
```sql
INSERT INTO Event (EventName, EventDate, VenueId, OrganizerId) VALUES
('Tech Summit India', '2025-03-15', 1, 1),
('Startup Expo', '2025-04-10', 2, 2),
('AI Conference', '2025-05-05', 3, 3),
('Healthcare Innovation Meet', '2025-06-20', 4, 4),
('E-commerce Growth Hack', '2025-07-25', 5, 5);
```

### Attendee Table
```sql
INSERT INTO Event (EventName, EventDate, VenueId, OrganizerId) VALUES
('Tech Summit India', '2025-03-15', 1, 1),
('Startup Expo', '2025-04-10', 2, 2),
('AI Conference', '2025-05-05', 3, 3),
('Healthcare Innovation Meet', '2025-06-20', 4, 4),
('E-commerce Growth Hack', '2025-07-25', 5, 5);
```

### Booking Table
```sql
INSERT INTO Booking (BookingDate, EventID, AttendeeID) VALUES
('2025-03-01', 1, 1),
('2025-04-01', 2, 2),
('2025-05-01', 3, 3),
('2025-06-01', 4, 4),
('2025-07-01', 5, 5);
```

### Payment Table
```sql
INSERT INTO Payment (Amount, PaymentDate, PaymentStatus, BookingID) VALUES
(5000.00, '2025-03-02', 'Completed', 1),
(7000.00, '2025-04-02', 'Completed', 2),
(4500.00, '2025-05-02', 'Pending', 3),
(6000.00, '2025-06-02', 'Completed', 4),
(8000.00, '2025-07-02', 'Failed', 5);
```

### Feedback Table
```sql
INSERT INTO Feedback (Comments, Rating, EventId) VALUES
('Great networking event!', 5, 1),
('Very insightful sessions', 4, 2),
('Could have been better organized', 3, 3),
('Loved the speaker lineup!', 5, 4),
('Good event but too crowded', 4, 5);
```