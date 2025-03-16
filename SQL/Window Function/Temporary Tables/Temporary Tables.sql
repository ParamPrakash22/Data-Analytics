 drop table if exists temp_restaurants;

-- create your first temporary table
create temporary table temp_restaurants as select * from restaurants;

-- drop temporary table if they exists;
 drop table if exists temp_restaurants;
 
 -- create a new temporary table named 'sirsa resaturants' containing restaurants of sirsa only
 drop table if exists temp_restaurants;
 create temporary table temp_restaurants as select * from restaurants where city = 'sirsa';
 select * from temp_restaurants;
 
 -- create a new table name 'city satistics' containing aggregated tatics for each city
 drop table if exists city_statistics;
 create temporary table city_statistics as select city, round(avg(rating), 0), round(avg(cost), 0), sum(rating_count) from restaurants group by city;
 select * from city_statistics;
 
 -- create a  temporary table named 'expensive_restaurants' containing restaurants with a cost greater than $50
drop table if exists expensive_restaurants;
create temporary table expensive_restaurants as select * from restaurants where cost >500;
select * from expensive_restaurants;