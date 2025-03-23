-- Procedures

use Restro;
select * from messy_indian_dataset;

-- creating your first procedure
drop procedure if exists getuserid;
DELIMITER $$
create  procedure getuserid(in user_id int) 
	begin
		select * from messy_indian_dataset where id = user_id;
	end $$
DELIMITER ;
call getuserid(2);

-- Procedure to update purchase amount by percentage
SET SQL_SAFE_UPDATES = 0;
drop procedure if exists Updateamount;
DELIMITER $$
create procedure Updateamount(in percentage decimal(5,2))
	begin 
		update messy_indian_dataset
		set purchase_amount = purchase_amount * (1+percentage/100);
        select * from messy_indian_dataset;
	end $$
DELIMITER ;
call Updateamount(10);

-- procedure to delete low rated restaurants and logging
create table if not exists deleted_rest_log(
	id int,
    name varchar(255),
    rating decimal(5,2),
    deletion_time timestamp);
    
drop procedure if exists del_low_rated_restaurants;
DELIMITER $$
create procedure del_low_rated_restaurants(min_rating decimal(5,2))
	begin 
		insert into deleted_rest_log (id, name, rating, deletion_time)
         select id, name, rating, now() from Restro.restaurants 
			where rating < min_rating;
	delete from Restro.restaurants
    where rating <min_rating;
    end $$
DELIMITER ;
call del_low_rated_restaurants(3);
select * from Restro.restaurants order by rating;
