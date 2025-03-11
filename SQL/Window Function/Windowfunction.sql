select * from Restro.restaurants; 

-- 1. Rank every restaurant from most expensive to least expensive
select *, rank() over( order by cost) from Restro.restaurants;


-- create new column caontaing avg rating of restraunts thought the datasets
 select *, round(avg(rating) over(),0) as 'avg_rating' from Restro.restaurants;
 
 -- create new column caontaing avg rating_count of restraunts thought the datasets
select *, round(avg(rating_count) over(),0) as 'avg_ratingCount' from Restro.restaurants;

 -- create new column caontaing avg cost of restraunts thought the datasets
 select *, round(avg(cost) over(),0) as 'avg_cost' from restaurants;
 
 -- create column containing average, min, max of cost,rating, rating_count, of objects
 select *, round(avg(cost) over(),0) as 'avg_cost', min(cost) over() as 'Min_cost', Max(cost) over() as 'max_cost', round(avg(rating) over(),0) as 'avg_rating',
 Min(rating) over() as 'Min_rating',
  Max(rating) over() as 'Max_rating',
  round(avg(rating_count) over(),0) as 'avg_ratingCount',
  Min(rating_count) over() as 'Min_ratingCount',
  Max(rating_count) over() as 'Max_ratingCount'
 from restaurants;


-- create a cloumn containg average cost of the city where that specific restraunt is from
select *, round(avg(cost) over(partition by city),0) as 'avg_cost' from restaurants;

-- create a cloumn containg average cost of the cuisine which that specific restraunt is serving
select *, round(avg(cost) over(partition by cuisine),0) as 'avg_cost' from restaurants;

-- create both columns together
select *, 
round(avg(cost) over(partition by city),0) as 'avg_cost_city',
round(avg(cost) over(partition by cuisine),0) as 'avg_cost_cuisine'
 from restaurants;

-- list the restaurants whose cost is more than avg cost of the restaurants?

#select * where cost>round(avg(cost), round(avg(cost) over(),0) as 'avg_cost' from restaurants;

select * from restaurants where cost>(select avg(cost) from restaurants);

select * from (select *, avg(cost) over() as 'avg_cost' from restaurants) t where t.cost > t.avg_cost;

#list the restraunts whose cuisine cost is more than the avg cost

select * from (select *, avg(cost) over(partition by cuisine) as 'avg_cost' from restaurants) t where t.cost > t.avg_cost;











