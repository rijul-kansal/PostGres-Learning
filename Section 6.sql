----------------------Operators--------------------------
-- 1) Comparison Operators
--		Equal =
--		Greater then >
--		Greater then and equal to >=
--		Less then <
--		Less then and equal to <=
--		not equal to <>
-- 2) Logical Operators
--		And
--		Or
--		Like
--		In
--		Between
-- 3)  Arithmetic Operators
--		Add +
--		Sub -
--		MUL *
--		Div /
--		Mod %


------------------------------------Where------------------------------------------
-- Get all english movies
-- we can not use alias in where class
Select *
From movies
Where movie_lang = 'English';

-- order --> From ->Where ->select->Order By


------------------------------------Logical Operator--------------------
-------------------------------------And----------------------------------------
-- get all movie with language english and age certificate is 18
Select *
From movies
Where
	movie_lang='English' And
	age_certificate='18';

--------------------------------------------Or----------------------------------
-- get all movie with language english or chinese movies
Select *
From movies
Where
	movie_lang='English' Or movie_lang='Chinese'
Order BY 
	movie_lang;

-- combine Both
-- get all movie with language english or chinese movies And age certificate is 12

Select * 
From movies
Where	
	(movie_lang='English' Or movie_lang='Chinese') And
	age_certificate='12';

---------------------------------------Comparison Operator----------------------
-- get all movies where movie len is greater then 100
-- we can also use numeric data in quotes as well it will give same result
Select *
From movies
Where
	movie_length > 100
Order By
	movie_length;

-- get all movies where release date is > 2000
Select * 
From movies
Where
	release_date > '2000-01-01'
Order BY release_date;

-- comparison operator also word on strings
Select * 
From movies
Where
	movie_lang > 'English'
Order BY movie_lang;

----------------------------------------------limit----------------------------------------
-- get top 5 biggest movies by movie length
Select *
From movies
Order By movie_length DESC
Limit 5;

-- get top 5 oldest american directors
Select *
From directors
Where nationality='American'
Order By date_of_birth
Limit 5;

--------------------------------------Offset---------------------------------------------
-- get 5 movies sort based on movie id and skip first 4 movies
Select *
From movies
Order By movie_id
Limit 5
Offset 4;

-------------------------------Fetch----------------------------
--syntax 
-- Fetch {First|Next} [row_count] {row | rows} Only

-- get top 5 biggest movies by movie length
Select *
From movies
Order By movie_length DESC
Fetch First 5 Rows Only;

-- get 5 movies sort based on movie id and skip first 4 movies
Select *
From movies
Order By movie_id
Fetch First 5 Rows Only
Offset 4;

---------------------------------Logical Operator-------------------------------------
------------------------------------------In/ Not In----------------------------------------
-- get all movies with lang english and chinese
Select * 
From movies
Where movie_lang In ('English','Chinese')
Order By movie_lang;

------------------------------------Between / Not Between-----------------------------------
-- >= and <= 
-- get all movies b/w year 1999 to 2005
Select * 
From movies
Where release_date Between '1999-01-01' And '2005-12-31'
Order By release_date;

-- Like / ILike
-- Like is Case sensitive
-- ILike is Not Case sensitive
-- % match any no of char
-- _ match single  char
Select 'hello' Like '%ll_';

-- get all actors whose name start with A
Select *
From actors
Where first_name Like 'A%'
Order BY first_name;


--------------------------------------------Null/ Not Null---------------------------------
-- if we use Is Null then return only Null column
-- get all movies whose domestic revenue is null or revenues international is null
Select * 
From movies_revenues
Where 
	revenues_domestic Is Null Or
	revenues_international Is Null;

------------------------------------------------Concat--------------------------------
-- Method 1
Select 'Hello' || 'World';
Select 'Hello' ||' '|| 'World';
-- this fn make final ans as null
Select 'Hello' || NULL || 'World';

-- Method 2
Select Concat('Hello','World');
Select Concat('Hello',' ','World');
-- this fn will not make final value as null if every single col is null
Select Concat('Hello',' | ',Null,'World');

-- Method 3
Select Concat_WS(' , ','Hello','World','123');
-- this fn will  make final value as empty if every single col is Null
Select Concat(' | ','Hello',Null,'World');