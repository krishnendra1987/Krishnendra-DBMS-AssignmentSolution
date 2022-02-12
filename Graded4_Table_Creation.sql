create database if not exists `TravelOnTheGo` ;

use `TravelOnTheGo`;

create table if not exists `Passenger`(
 Passenger_name varchar (50) , 
 Category varchar (50) , 
 Gender varchar (50) , 
 Boarding_City varchar (50) ,students
 Destination_City varchar (50) , 
 Distance int , 
 Bus_Type varchar (50) 
 );
 
 create table if not exists `Price`(
  Bus_Type varchar (50) ,
  Distance int , 
  Price int
  );


