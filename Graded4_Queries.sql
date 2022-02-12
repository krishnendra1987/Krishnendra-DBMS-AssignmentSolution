-- 3) How many females and how many male passengers travelled for a minimum distance of 
-- 600 KM's?

select Gender, count(Gender) as "No of M/F"
from 
  passenger
  where distance >=600
  group by Gender;
  

-- 4) Find the minimum ticket price for Sleeper Bus. 
select min(price) as price, Bus_Type
from 
  `Price`
where Bus_Type = "Sleeper";


-- 5) Select passenger names whose names start with character 'S' 

select Passenger_name from `passenger`
 where Passenger_name like 'S%';
 
 
-- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City, 
-- Destination City, Bus_Type, Price in the output

select Passenger_name , Boarding_City , Destination_City , p1.Bus_Type , p2.Price 
from 
   `Passenger` p1 
   left join 
   `Price` p2 
on p1.Bus_Type = p2.Bus_Type and p1.Distance = p2.Distance ;

-- 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a 
-- distance of 1000 KM s 

NA 

-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to 
-- Panaji?

select Price, Bus_Type
from 
  `Price`
  where Distance = (select Distance from `Passenger` where Boarding_City="Panaji" and Destination_City="Bengaluru" );


-- 9) List the distances from the "Passenger" table which are unique (non-repeated 
-- distances) in descending order.

  select Distance 
  from 
    `Passenger` 
group by Distance having count(Distance) = 1 order by Distance desc ;

 
-- 10) Display the passenger name and percentage of distance travelled by that passenger 
-- from the total distance travelled by all passengers without using user variables 

select 
   Passenger_name , Distance , Distance * 100 / (select sum(Distance) from Passenger) 
   as "Percentage %" 
from Passenger;


-- 11) Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise

-- Stored Procedure Code --->

-- CREATE DEFINER=`root`@`localhost` PROCEDURE `categorize_price`()
-- BEGIN
--     select Distance, Price,
--     case 
--      when price > 1000 then "Expensive"
--      when price > 500 and price < 1000 then "Average Cost"
--      else "Cheap"
--    end as Cost_Rating  
--      from `Price`;
-- END

call categorize_price;