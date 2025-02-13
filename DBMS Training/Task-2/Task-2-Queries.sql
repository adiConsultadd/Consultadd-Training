1. Get all Events with Venue and Organizer details : 
SELECT e.EventName, e.EventDate, v.VenueName, v.Location, o.Name AS Organizer
FROM Event e
JOIN Venue v ON e.VenueId = v.VenueId
JOIN Organizer o ON e.OrganizerId = o.OrganizerId;

2. Get Attendees for a specific Event : 
SELECT a.Name, a.Email, a.Phone, e.EventName
FROM Attendee a
JOIN Booking b ON a.AttendeeID = b.AttendeeID
JOIN Event e ON b.EventID = e.EventID
WHERE e.EventName = 'Tech Summit India';

3. Get total revenue for an event : 
SELECT e.EventName, SUM(p.Amount) AS TotalRevenue
FROM Payment p
JOIN Booking b ON p.BookingID = b.BookingID
JOIN Event e ON b.EventID = e.EventID
GROUP BY e.EventName;

4. Get Feedback with Event details : 
SELECT e.EventName, f.Comments, f.Rating
FROM Feedback f
JOIN Event e ON f.EventId = e.EventId;

5. Find Bookings with Payment Status : 
SELECT a.Name, e.EventName, p.Amount, p.PaymentStatus
FROM Attendee a
JOIN Booking b ON a.AttendeeID = b.AttendeeID
JOIN Event e ON b.EventID = e.EventID
JOIN Payment p ON b.BookingID = p.BookingID;