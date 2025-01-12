-----------------------------Creating table----------------------
CREATE TABLE actors(
	actor_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100) NOT NULL,
	date_of_birth Date,
	gender CHAR(1),
	added_date Date,
	updated_date Date
);

CREATE TABLE directors(
	directors_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	date_of_birth Date,
	nationality VARCHAR(100),
	added_date Date,
	updated_date Date
);
--------------------------------------------------Foreign key syntax--------------------------------
CREATE TABLE movies(
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR(100) NOT NULL,
	movie_length INT,
	movie_lang VARCHAR(20),
	age_certificate VARCHAR(10),
	release_date DATE,
	director_id INT REFERENCES directors (director_id)
);

CREATE TABLE movies_revenues(
	revenue_id SERIAL PRIMARY KEY,
	movie_id INT REFERENCES movies(movie_id),
	revenues_domestic NUMERIC(10,2),
	revenues_international NUMERIC(10,2)
);

-----------------------------------------------multiple primary key----------------------------------
CREATE TABLE movies_actors(
	movie_id INT REFERENCES movies(movie_id),
	actor_id INT REFERENCES actors(actor_id),
	PRIMARY KEY(movie_id,actor_id)
);

----------------------------------------Deleting Tables----------------------------
DROP TABLES IF EXISTS table_name;
