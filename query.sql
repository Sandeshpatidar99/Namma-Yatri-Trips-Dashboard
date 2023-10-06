-- Total Trips
select count( distinct tripid) from trip_details

-- Total Drivers
select count(distinct driverid) from trips;

-- Total earnings
select sum(fare) from trips

-- Total Completed trips
select count( distinct tripid) from trips

-- Total no of searches
select count(searches) from trip_details
where searches = 1;

-- Total searches got estimated
select count(searches_got_estimate) from trip_details
where searches_got_estimate = 1;

-- Total searches for quotes
select count(searches_for_quotes) from trip_details
where searches_for_quotes = 1 

-- Total searches which got quotes
select sum(searches_got_quotes) from trip_details

-- Total drivers cancelled
select count(driver_not_cancelled) from trip_details
where driver_not_cancelled = 0;

-- Total OTP entered
select count(otp_entered) from trip_details
where otp_entered = 1;

-- Total end rides
select count(end_ride) from trip_details
where end_ride = 1;

-- Avg distance per ride
select concat(avg(distance), ' Km') as Avg_Distance from trips

-- Avg fare per trip
select concat('Rupees ',round(avg(fare),2)) as Avg_Fare from trips

-- Distance Travelled
select sum(distance) from trips

-- Which is the most used payment method
select t.faremethod , p.method, count(t.tripid) from trips t
join payment p on p.id=t.faremethod
group by 1,2
order by count(t.tripid) desc;

-- Highest Payment of the day
select t.faremethod,p.method,t.fare from trips t
join payment p on p.id = t.faremethod
order by 3 desc

-- Which two location has the most trips
select t.loc_from ,a.Assembly as loc_from , t.loc_to ,a1.Assembly as loc_to, count(t.tripid) from trips t
join assembly a on a.ID = t.loc_from
join assembly a1 on a1.ID = t.loc_to
group by 1,2,3,4
order by 5 desc

-- Top 5 earning drivers
select driverid , sum(fare) from trips
group by 1
order by 2 desc
limit 5

-- Which duration has the most earnings
select t.duration, d.Duration,sum(t.fare) from trips t
join duration d on d.Id=t.duration
group by 1,2
order by 3 desc

-- Which duration has the most trips
select duration , count(tripid) as no_of_trips from trips
group by 1
order by 2 desc

-- Which driver & customer pair has the most orders
select driverid,custid,count(tripid) from trips
group by 1,2
order by 3 desc

-- searches to estimate
select concat(sum(searches_got_estimate)/sum(searches)*100,' %') 
as fare_estimate_rate from trip_details

-- Which area got the most trips and in which duration
select t.loc_from, a.Assembly, t.duration, d.duration, count(tripid) from trips t
join assembly a on a.ID=t.loc_from
join duration d on d.duration=t.duration
group by 1,2,3,4
order by 5 desc

-- Which area got highest no of fare
select loc_from , sum(fare) from trips
group by 1
order by 2 desc

-- Which area got highest no of cancellations
select loc_from , count(customer_not_cancelled)+count(driver_not_cancelled) 
as cancellations from trip_details
where customer_not_cancelled = 0 and driver_not_cancelled = 0
group by 1
order by 2 desc

-- Which area got highest no of trips
select loc_from, count(distinct tripid) as no_of_trips from trips
group by 1
order by 2 desc

-- Which duration has highest no of trips
select t.duration,d.Duration,count(distinct t.tripid) from trips t
join duration d on t.duration = d.Id
group by 1,2
order by 3 desc

-- Which duration has highest no of fares
select t.duration,d.Duration,sum(t.fare) from trips t
join duration d on t.duration = d.Id
group by 1,2
order by 3 desc


select * from duration


















 












select * from duration


















select * from trips








