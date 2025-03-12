-- Rank

select * from Restro.restaurants; 


-- Rank every restraunt fro most expemsive to least expensive

select *, rank() over(order by cost desc) as 'Rank' from restaurants;

-- rank every restraunts from most visited to least visited
select *, rank() over(order by rating_count desc) as 'Rank' from restaurants;

-- rank every retaurants from most expensive to least expensive as per their city
select *, rank() over(partition by city order by cost desc) as 'Rank' from restaurants;

-- Dense-rank every retaurants from most expensive to least expensive as per their city
select *, dense_rank() over(Order by cost desc) as 'Rank' from restaurants;

-- row-number every restaurants from most expensive to least expensive as per their city
select *, row_number() over(partition by city order by cost desc) as 'Rank' from restaurants;

-- rank every retaurants from most expensive to least expensive as per their city along with its city (Adilabad-1, Adilabas-2)
select *, concat(city, '-', row_number() over(partition by city order by cost desc)) as 'Rank' from restaurants;

-- find the top 5 restautrants of every city as per their revenue
Select * from (Select *, 
	cost*rating_count as 'Revenue',
    row_number() over(partition by city order by rating_count*cost desc) as 'Rank' 
    from restaurants) t where t.rank<6;

-- find the top 5 restautrants of every cuisine as per their revenue
Select * from (Select *, 
	cost*rating_count as 'Revenue',
    row_number() over(partition by cuisine order by rating_count*cost desc) as 'Rank' 
    from restaurants) t where t.rank<6;

