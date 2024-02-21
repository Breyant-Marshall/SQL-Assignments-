--1. Which months in which years had more than 5000 bookings for the 'City Hotel'?
SELECT arrival_date_month, arrival_date_year, COUNT (*) AS number_of_bookings
FROM bookings
WHERE hotel = 'City Hotel'
GROUP BY arrival_date_month, arrival_date_year
HAVING COUNT(*) > 5000;

--2. Which room types have a higher average number of special requests than the overall average?
SELECT assigned_room_type, reserved_room_type
FROM bookings
WHERE total_of_special_requests:: INT > 
	(SELECT ROUND (AVG (total_of_special_requests:: INT), 2) FROM bookings);  

--3. What is the total number of nights stayed (weeknights and weekend nights combined) per hotel type?
SELECT DISTINCT hotel 
COUNT SUM (stays_in_weekend_nights::integer+stays_in_week_nights)
FROM bookings

--4. How many bookings did each customer type make each year?

SELECT customer_type, arrival_date_year, COUNT (*) AS number_of_bookings
FROM bookings
GROUP BY customer_type, arrival_date_year;

/*5. Which agents (identified by agent ID) have made more than 200 bookings? 
More than 500 bookings? */

SELECT agent, COUNT (*) AS number_of_bookings
FROM bookings
GROUP BY agent 
HAVING COUNT(*) > 200 OR COUNT(*) > 500;


/*6. What is the total revenue (adr can be used as a proxy for 
revenue) per hotel type for non-canceled bookings of guests who are not 
repeat guests and stayed more than 3 nights in total?*/