/* Breyant Marshall
Instructor: James Larkin
Topic: SQL Fundamentals
Due Date: 25/10/2023*/

--Recent Booking Trends
/*The marketing team wants to know the latest bookings to analyze recent
customer preferences. Display the names and hotel types of the last 10 guests
who made a reservation, along with their arrival dates.*/

SELECT customer_name, hotel, arrival_date
FROM bookings
ORDER BY arrival_date DESC
LIMIT 10;

--Special Requests Analysis
/*The guest services team has reported a rise in special requests from guests. For
training purposes, they want to see the bookings where guests made more than 2
special requests. Can you provide a list?*/

SELECT *
FROM bookings
WHERE total_of_special_requests > '2';

SELECT total_of_special_requests, customer_name
FROM bookings
WHERE total_of_special_requests > '2';


--Planning Ahead
/*The sales team noticed that some guests book their stay well in advance. They're
curious to know who these early birds are. List guests who decided to book more
than 300 days ahead of their arrival.*/

SELECT customer_name, lead_time
FROM bookings
WHERE lead_time > 300;

--Summer Vacationers
/*Summer is always a busy time for hotels. The operations team wants to know
how many transient customers (those without a package deal or part of a group)
typically book during the summer months of June, July, and August.*/

SELECT COUNT (customer_type)
FROM bookings
WHERE customer_type = 'Transient' AND arrival_date_month IN ('June', 'July', 'August');

--High Roller
/*The luxury services team is creating a new package for guests who don't mind
spending a bit more. They'd like to know which bookings had an average daily
rate (ADR) of more than $200 to tailor their offerings.*/

SELECT*
FROM bookings 
WHERE adr>200;

--Trust-Based Bookings 
/*The reservations team observed that many guests are confident in their travel
plans and opt not to pay a deposit. Can you find out how many confirmed
bookings were made without any deposit?*/

SELECT COUNT (deposit_type)
FROM bookings
WHERE deposit_type ILIKE '%No Deposit%';

--Year-End Vacationers
/*As the year-end approaches, the events team is planning festivities. They'd like to
know the guests who typically book their stay either at the very beginning or the
very end of the year. Who are these guests?*/

SELECT customer_name, arrival_date_month
FROM bookings
WHERE arrival_date_month IN ('January','December'); 

--Agent Performance Review
/*Agent '28' is up for a performance review. To gauge his effectiveness, the HR
team is particularly interested in his ability to secure long-term bookings. Extract
a list of all reservations made by this agent that were not canceled and were
booked more than 30 days in advance. Your output should display the guest
name, hotel type, and lead time for each relevant reservation.*/

SELECT customer_name, hotel, lead_time
FROM bookings
WHERE agent = 28 AND is_canceled = 1 AND lead_time > 30;