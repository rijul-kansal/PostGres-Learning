-------------------------------Change of dataType--------------------------
-- change of 1 datatype to other
Select Cast('1' As Int);
Select '1'::Int;
------------------------------------Data Types----------------------------
------------------------------------------Boolean--------------------------------------
--    True     False
--   -----     -----
--    TRUE       FALSE
--    'TRUE'     'FALSE'
--    '1'        '0'
--    'yes'      'no'
--    'y'        'n'

Create Table table_boolean(
	idd Serial Primary Key,
	is_available Boolean
);

Insert Into table_boolean(is_available) Values('y'), ('yes') ,(True),(False) ,('No');

Select * From table_boolean
Where is_available = True;
-- Query 
Select * From table_boolean
Where is_available ;

---------------------------------------------Character---------------------------------------------
-- Types
--        Character(n) , char(n) -- fixed length , space padded
--        Character Varying(n) , varchar(n) -- max length
--        text , varchar -- unlimited
-- If limit exceed in first 2 then postgres will truncate

Select 'adnan'::CHAR(10); -- "adnan     "
Select 'adnan'::VARCHAR(10); -- "adnan"
Select 'adnan'::text; -- "adnan"


---------------------------------------------Numeric--------------------------------------
-- not contain null values
-- if we enter number that will out of range we will get error
-- Types
--        smallint  2 Bytes  -32,768 to 32,767
--        integer   4 Bytes   -2,147,483,648 to 2,147,483,647
--        bigint    8 Bytes   -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807

-----------------------------------------Serial------------------------------------------
-- start from 1 and auto increment
--        smallserial  2 Bytes      1 to 32,767
--        serial       4 Bytes      1  to 2,147,483,647
--        bigserial    8 Bytes      1 to 9,223,372,036,854,775,807

----------------------------------------Decimal--------------------------------------
-- numeric(p,s)
-- decimal(p,s)
-- p --> total no of digit on left and right side of dot
-- s --> no of digit on right side of dot
-- real --> allows precision to 6 digit
-- double --> allows precision to 15 digit

--------------------------------------------Date----------------------------------------
-- default format YYYY-MM-DD
-- use 4 Bytes 

-- get current date
Select CURRENT_DATE;

-- get Date and time 
Select Now();

--------------------------------------------Time----------------------------------------
-- 8 Bytes
-- Time(precision) precision meant how many fraction you want at 2nd place(max 6)
-- Lots of Format
--   HH:MM:SS
--   HH:MM:SS.pppppp
--   HHMMSS

-- get current time
Select Current_Time(2);

-- get local time
Select LocalTime;

-- airthmetic Operation
Select '10:00'::Time - '04:00'::Time;

-------------------------------------------------interval----------------------------------------- 
-- 'n type' :: interval

Select '10:00'::Time - '4 hours 30 minutes 10 second'::interval;

--------------------------------------Timestamp/timestamptz--------------------------------
-- Timestamp is date and time without time zone
-- Timestamptz is date and time with time zone

Create Table table_tststz(
	ts Timestamp,
	tstz TimeStampTz
);

Insert Into table_tststz(ts,tstz) 
Values
('2020-02-02 10:10:20-07','2020-02-02 10:10:20-07');
Select * From table_tststz;
 "2020-02-02 10:10:20" - "2020-02-02 22:40:20+05:30"
-- not timezone          here when we store it will convert into UTC and output us in our local timeZone

-- get Timezone
Show TIMEZONE; -- "Asia/Calcutta"

-- set different timezone
SET Timezone ='America/New_York';
SET Timezone ='Asia/Calcutta';

-- current timestamp
Select Current_TimeStamp;
Select TimeOfDay();

-- timezone
Select Timezone('Asia/Singapore','2020-02-02 10:10:10');

--------------------------------------------------UUID------------------------------------
-- download uuid 
Create Extension If Not Exists "uuid-ossp";

Select uuid_generate_v1(); -- use mac access of this laptop
Select uuid_generate_v4(); -- complete random no
-- Syntax
-- col name uuid Default uuid_generate_v1();

--------------------------------------hstore----------------------------------------
Create Extension hstore;
-- store in key value pair
-- contain text strings only

Create Table table_hstore(
	prod_id Serial Primary Key,
	title Text,
	information hstore
);

Insert Into table_hstore(title,information)
Values
(
	'book3',
	'
		"a"=>"b2",
		"c"=>"d2"
	'
);

Select * From table_hstore;

-- getting single col
Select information->'a' From table_hstore;

--------------------------------------------N/w Storage-----------------------------
-- help in storing IPV4 IPV6 and Mac Addr

-- Types    bytes     fns
-- cidr     7 or 19   store ipv4 and ipv6
-- inet     7 or 19   store ipv4 and ipv6 hosts and n/w
-- macaddr     6   store mac addr
-- macaddr8    8   store mac addr (EUI format)

-- Here IPV4 will come first Then IPV6 will come

Create Table table_netaddr(
	id Serial Primary Key,
	ip inet
);

Insert Into table_netaddr(ip) 
Values
('4.2.3.4'),
('222.22.23.24');

Select * From table_netaddr;

-- set mask
Select
	ip,
	set_masklen(ip,24)
From table_netaddr;