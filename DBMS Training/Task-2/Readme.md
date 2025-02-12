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