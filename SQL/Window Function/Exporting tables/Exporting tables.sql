select * from restaurants;

-- create a table name sirsa_restaurants containing restaurants of sirsa only

drop table if exists sirsa_restaurants;
create table sirsa_restaurants as select * from restaurants where city = 'sirsa';
select * from sirsa_restaurants;

-- create a new tabkl as 'city_satistics' containg aggregated satistics fro each city\

drop table if exists city_satistics;
create table city_satistics as select city, avg(rating), avg(rating_count), count(*) from restaurants group by city;
select * from city_satistics;

-- create a new table named 'expensive_restaurants' containing restaurants with a cost greater than $50
 
drop table if exists expensive_restaurants;
create table expensive_restaurants as select * from restaurants where cost >50;
select * from expensive_restaurants;

