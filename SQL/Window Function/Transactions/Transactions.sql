-- Transactions

select * from messy_indian_dataset;

-- Start a transaction 
start transaction;
update messy_indian_dataset set purchase_amount = 11 where id = 2;


-- Transaction with rollback
start transaction;
update messy_indian_dataset set purchase_amount = 110 where id in (1, 2);
rollback;
select * from messy_indian_dataset;


-- Transaction with comit
start transaction;
update messy_indian_dataset set city = 'Mumbai' where id = 2;
commit;
select * from messy_indian_dataset;
-- comit & rollback

start transaction;
INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
(11, 'RAMu Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
select * from messy_indian_dataset;
commit;
rollback;
select * from messy_indian_dataset;

-- comit & rollback woith multiple commands
start transaction;
INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
(1, 'Rajesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(2, 'Priya Sharma', 25, 'Female', 'priya@example.com', '9876543211', 'Delhi', 'Delhi', NULL, '2023-02-15'),
(3, 'Amit Kumar', 35, 'Male', 'amit@example.com', '9876543212', 'Bangalore', 'Karnataka', 750.25, '2023-03-25');
select * from messy_indian_dataset;
rollback;
commit;
select * from messy_indian_dataset;

-- Rollback with multiple commands

start transaction;
INSERT INTO messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date) VALUES
(1, 'Rajesh Patel', 30, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05'),
(2, 'Priya Sharma', 25, 'Female', 'priya@example.com', '9876543211', 'Delhi', 'Delhi', NULL, '2023-02-15'),
(3, 'Amit Kumar', 35, 'Male', 'amit@example.com', '9876543212', 'Bangalore', 'Karnataka', 750.25, '2023-03-25');
select * from messy_indian_dataset;
Rollback;
select * from messy_indian_dataset;
