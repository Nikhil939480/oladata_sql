show databases;
use ola;
show tables;
select * from oladata;

#1.Retrieve all successful bookings:
Create View successful_bookings As
select * from oladata
where Booking_Status = 'Success'; 
select * from successful_bookings;

#2.Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT 
    Vehicle_Type, 
    AVG(Ride_distance) AS avg_distance
FROM 
    oladata
GROUP BY 
    Vehicle_Type;
SELECT * FROM ride_distance_for_each_vehicle;

#Get the total number of canceled ride by customers:
Create View canceled_rides_by_customers As
SELECT COUNT(*) FROM oladata
WHERE Booking_Status = 'Canceled by Customer';
select * from canceled_rides_by_customers;

#4.List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers As
SELECT Customer_ID, Count(Booking_ID) as total_rides
FROM oladata
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;
select * from Top_5_Customers;

#5.Get the number of rides canceled by drives due to car-releted issues:
Create View Rides_Canceled_by_Drives_P_C_Issues As
SELECT COUNT(*) FROM oladata
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#6.Find the maximum and minimum driver rating for Prime Sedan booking:
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Rating) as max_rating,
MIN(Driver_Rating) as min_rating
FROM oladata WHERE Vehicle_Type = 'Prime Seddan';
select * from Max_Min_Driver_Rating;
 
#7.Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating AS
SELECT Vehicle_Type,AVG(Customer_Rating) as avg_customer_rating
FROM oladata
GROUP BY Vehicle_Type;
 select * from AVG_Cust_Rating;
 
#8.Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT SUM(Ride_distance) as total_successful_ride_value
FROM oladata
WHERE Booking_Status = 'Success';
select * from total_successful_ride_value;