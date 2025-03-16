select * from restaurants;

-- create the view
create view rest as (
	select name, city, rating, rating_count as 'orders', cost,
    cuisine, cost*rating_count as 'Revenue' from restaurants);
    
select * from rest;

-- create a view for end user
drop view if exists user_view;
create view user_view as (select name, city, rating, rating_count, cost from restaurants);
select * from user_view;

-- create a view for sweet dishes
drop view if exists sweet_dishes;
create view sweet_dishes as (select * from restaurants where cuisine = 'Sweets');
select * from sweet_dishes;

-- create a view of top 100 restaurants

drop view if exists top_100;
create view top_100 as (Select * from restaurants order by rating_count desc limit 100);
select * from top_100;


-- create a view of restaurants atlest 100 people visited
drop view if exists atleast_100;
create view atleast_100 as (select * from restaurants where rating_count>99 order by rating_count desc);
select * from atleast_100;

-- create a view of top 1000 most expensive restaurants;
drop view if exists top1000;
create view top1000 as(select * from restaurants order by cost desc limit 1000);
select * from top1000;

 -- create a view for top rated restaurants in each city
  drop view if exists top_rated_restro;
  create view top_rated_restro as (
	  select * from (Select *, row_number() over(partition by city order by rating desc) as 'rank' from restaurants) t where t.rank <2
    );
select * from top_rated_restro;

-- create a view of restaurants with high revenue of margins





