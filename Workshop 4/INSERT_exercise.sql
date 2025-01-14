-- INSERT Exercise 

-- Create table
CREATE TABLE people
(
	first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT
);

-- Check description
DESC people;

-- Populate
INSERT INTO people(first_name,last_name,age) 
VALUES  ("Linda","Belcher",45),
		("Phillip","Frond",38),
        ("Calvin","Fischoeder",70);

-- Check contents
SELECT * from people
