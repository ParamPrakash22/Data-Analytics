-- Functions 

use Restro;
select * from messy_indian_dataset;

-- function to calculate age
 drop function if exists calculateAge;

DELIMITER $$
create function calculateAge(DOB Date) 
returns Int
deterministic
begin 
	declare age int;
    set age = year(curdate()) - year(DOB);
    return age;
END $$
DELIMITER ;

SELECT calculateAge('2002-05-22'); 

-- function to calculate tax
drop function if exists calculatetax;
DELIMITER $$
create function calculatetax(amount decimal(10,2), tax_rate decimal(5,2)) returns decimal(10,2)
deterministic
begin 
	declare tax decimal(10,2);
    set tax = amount*(tax_rate/100);
    return tax;
end $$
DELIMITER ;
select calculatetax(225.67,22.5) as tax_amount;

-- create function to categorised age 
drop function if exists categorisedAge;
DELIMITER $$
create function categorisedAge(age int) returns varchar(20)
deterministic
begin
	declare category varchar(20);
	if age <18
		then set category = 'child';
	elseif age between 18 and 40
		then set category = 'adult';
	else
		set category = 'Senior';
	end if;
	return category;
end $$
DELIMITER ;
Select categorisedAge(20) as category;



