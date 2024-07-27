CREATE DATABASE hotel_reservation_analysis
USE hotel_reservation_analysis

-- 1. What is the total number of reservations in the dataset?
SELECT COUNT(Booking_ID) AS Total_Reservations
FROM hotel_reservation;

-- 2. Which meal plan is the most popular among guests?
SELECT type_of_meal_plan, COUNT(type_of_meal_plan) AS Meal_Plan_Count
FROM hotel_reservation
GROUP BY type_of_meal_plan
ORDER BY Meal_Plan_Count DESC
LIMIT 1;

-- 3. What is the average price per room for reservations involving children?
SELECT AVG(avg_price_per_room) AS Average_Price_Per_Room
FROM hotel_reservation
WHERE no_of_children > 0;

-- 4. How many reservations were made for the year 2018?
SELECT COUNT(Booking_ID) AS Reservations_In_Year
FROM hotel_reservation
WHERE YEAR(arrival_date) = 2018;

-- 5. What is the most commonly booked room type?
SELECT room_type_reserved, COUNT(room_type_reserved) AS Room_Type_Count
FROM hotel_reservation
GROUP BY room_type_reserved
ORDER BY Room_Type_Count DESC
LIMIT 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(Booking_ID) AS Weekend_Reservations
FROM hotel_reservation
WHERE no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time) AS Highest_Lead_Time, MIN(lead_time) AS Lowest_Lead_Time
FROM hotel_reservation;

-- 8. What is the most common market segment type for reservations?
SELECT market_segment_type, COUNT(market_segment_type) AS Market_Segment_Count
FROM hotel_reservation
GROUP BY market_segment_type
ORDER BY Market_Segment_Count DESC
LIMIT 1;

-- 9. How many reservations have a booking status of "Confirmed"?
SELECT COUNT(Booking_ID) AS Confirmed_Reservations
FROM hotel_reservation
WHERE booking_status = 'Confirmed';

-- 10. What is the total number of adults and children across all reservations?
SELECT SUM(no_of_adults) AS Total_Adults, SUM(no_of_children) AS Total_Children
FROM hotel_reservation;

-- 11. What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) AS Average_Weekend_Nights
FROM hotel_reservation
WHERE no_of_children > 0;

-- 12. How many reservations were made in each month of the year?
SELECT MONTH(arrival_date) AS Month, COUNT(Booking_ID) AS Reservations_Count
FROM hotel_reservation
GROUP BY MONTH(arrival_date)
ORDER BY Month;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT room_type_reserved, 
       AVG(no_of_weekend_nights + no_of_week_nights) AS Average_Nights_Spent
FROM hotel_reservation
GROUP BY room_type_reserved;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT room_type_reserved, 
       COUNT(room_type_reserved) AS Room_Type_Count, 
       AVG(avg_price_per_room) AS Average_Price_Per_Room
FROM hotel_reservation
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY Room_Type_Count DESC
LIMIT 1;

-- 15. Find the market segment type that generates the highest average price per room.
SELECT market_segment_type, 
       AVG(avg_price_per_room) AS Average_Price_Per_Room
FROM hotel_reservation
GROUP BY market_segment_type
ORDER BY Average_Price_Per_Room DESC
LIMIT 1;
