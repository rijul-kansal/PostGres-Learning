CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	age INT
);
----------------------------------Insert---------------------------
INSERT INTO customers(first_name,last_name,age)
Values
('rijul','kansal',22),
('ananya','kansal',21);

-- added date like this Rijul's kansal --> 'Rijul''s Kansal'
INSERT INTO customers(first_name,last_name,age)
Values ('rijul''s','kansal',22),


----------------------------------------Returning added data-------------------------------
INSERT INTO customers(first_name,last_name,age)
Values ('rijul','kansal1',22) Returning *;

-- Returning Single column
INSERT INTO customers(first_name,last_name,age)
Values ('rijul','kansal1',22) Returning customer_id;

Select * From customers;
-----------------------------------------Update--------------------------
Update customers
Set 
	first_name = 'rijull',
	age = 25
Where customer_id =1;

-------------------------------------Returning updated row---------------------------- 
Update customers
Set 
	first_name = 'rijull',
	age = 26
Where customer_id =1 Returning *;

-- updating all records
Update customers
Set 
	first_name = 'rijull',
	age = 267
Returning *;

-----------------------------Delete-------------------------------
Delete From customers
Where customer_id =1;

---------------------------------------------------------------------
Create Table t_tags(
	id Serial Primary Key,
	tags VARCHAR(100) Unique,
	timestamp TimeStamp Default Now()
);

Insert Into t_tags(tags) Values
('Pen'),
('Pencil');

---------------------------------UPSERT------------------------------
-- Do nothing
Insert Into t_tags(tags) Values
('Pen')
On Conflict(tags)
Do Nothing;

-- Update data
Insert Into t_tags(tags) Values
('Pen')
On Conflict(tags)
Do
	update Set
		tags = EXCLUDED.tags,
		timestamp = Now();