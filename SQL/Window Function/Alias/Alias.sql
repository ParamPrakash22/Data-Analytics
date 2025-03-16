
-- select all the columns from the 'restaurants' table with alias 'r'
select * from restaurants as rest;

-- select the city and the avg cost of the restaurants in each city using the table alias and aggregate functions
select rest.city, avg(rest.cost) from restaurants as rest group by rest.city; 

-- select resataurants that have a higher rating than the avg rating of all restaurants in the same city using self-refrencing query with table alias
select rest.* from restaurants as rest where rest.rating > (select avg(rating) from restaurants where city = rest.city);