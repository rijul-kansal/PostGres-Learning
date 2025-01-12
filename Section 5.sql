------------------------Select-------------------
-- get all data
Select * From movies;

-- Order --> From->Select

-- get specific column
Select movie_id, movie_name From movies; 

----------------------------------Aliases--------------------
-- if we don't use double quotes then alias will be in small letter only
Select movie_name AS movieName From movies;

-- if we want name as it is then use double quotes
Select movie_name AS "Movie Name" From movies;

-- As keyword is optional
Select movie_name  "Movie Name" From movies;

----------------------------------Order BY---------------------
-- get all movies in ascending order
-- ASC--for ascending (Default)
-- DESC -- for descending
Select 
	*
From movies
Order By
	movie_name;

-- get all movies in descending order
Select 
	*
From movies
Order By
	movie_name DESC;

-- Sort based on multiple column
-- here we will sort based on first col first then if 2 contradict then sort based on 2nd column
Select 
	*
From movies
Order By
	movie_name DESC,
	release_date ASC;
	
-- Order --> From->Select->Order BY

-- using alias
-- we can give alias name as well 
Select 
	movie_name As moviename
From movies
Order By
	moviename DESC;

-- order by based on exp
Select
	first_name,
	Length(first_name) AS len
From actors
Order BY
	len DESC;

-- using col no in order BY
Select
	first_name,
	Length(first_name) AS len
From actors
Order BY
	2 DESC;

-----------------------------Nulls Last/First----------------------
-- sometime when we do asc then null come on last we want to it at first
Select
	revenues_international
From movies_revenues
Order BY
	1 ASC NUlls First;

-- sometime when we do dec then null come on first we want to it at last
Select
	revenues_international
From movies_revenues
Order BY
	1 DESC NULLS LAST;

-----------------------------------Distinct-----------------------
-- we want only distinct records in single row
Select Distinct movie_lang 
From movies;

-- we want only distinct records by combining  multiple col
-- here both col will combine then it remove duplicate records
Select Distinct movie_lang , director_id
From movies;

-- we want all distinct records
Select Distinct *
From movies;