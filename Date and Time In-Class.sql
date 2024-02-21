/* Date and Time In-Class Explanation*/

SELECT NOW();
SELECT CURRENT_DATE;
SELECT CURRENT_TIME;
SELECT CURRENT_TIMESTAMP;

--DATE_PART ('time element', date) 

SELECT customer_name, AVG(AGE(current_date,
arrival_date)) AS avg_time_since_last_booking
FROM bookings
GROUP BY customer_name
ORDER BY avg_time_since_last_booking DESC
LIMIT 10;

--DATE_TRUNC

SELECT DATE_TRUNC('month', arrival_date) AS
month, SUM(adr) as total_revenue
FROM bookings
GROUP BY month
ORDER BY month;

--EXTRACT

SELECT EXTRACT(QUARTER FROM arrival_date) AS
quarter, COUNT(*) as bookings_count
FROM bookings
WHERE DATE_PART ('year',arrival_date) = 2016
GROUP BY quarter
ORDER BY quarter;

--INTERVAL 

SELECT id, customer_name, arrival_date,
arrival_date - INTERVAL '6 months' AS
six_months_prior
FROM bookings
WHERE arrival_date - lead_time * INTERVAL '1 day' <
arrival_date - INTERVAL '6 months'
LIMIT 10;

--TO CHAR

SELECT TO_CHAR(arrival_date, 'YYYY, Month') AS
formatted_month, SUM(adr) AS total_revenue
FROM bookings
GROUP BY formatted_month
ORDER BY MIN(arrival_date);
