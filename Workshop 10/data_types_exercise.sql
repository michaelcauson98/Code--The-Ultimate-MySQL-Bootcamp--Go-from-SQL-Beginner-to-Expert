-- Data types exercise

-- Q1, What's a good use case for CHAR?
-- Instances where the length of strings is (reasonably consistent) or unchanging (E.g. US state abbreviations).

-- Q2, Fill in appropriate variable types for the following table.
CREATE TABLE inventory (
	item_name VARCHAR(50),
    price DECIMAL(9,2),
    quantity INT UNSIGNED
);

-- Q3, What is the difference between DATETIME and TIMESTAMP?
-- TIMESTAMP has a narrower range: [1970, ~2038], but takes up less memory. Format is the same.

-- Q4, Write a SELECT statement to print out the current time.
SELECT CURTIME();

-- Q5, Write a SELECT statement to print out the current date.
SELECT CURDATE();

-- Q6, Write a SELECT statement to print out the current day of the week (as a 1-7 number).
SELECT DAYOFWEEK(CURDATE());

-- Q7, Write a SELECT statement to print out the name of the current day of the week
SELECT DAYNAME(CURDATE());

-- Q8, Print the current date and time using mm/dd/yyyy.
SELECT DATE_FORMAT(NOW(),'%m/%d/%Y');

-- Q8, Print the current date and time using e.g. 'January 2nd at 3:15'.
SELECT DATE_FORMAT(NOW(),'%M %D at %k:%i');

-- Q9, Create a tweets table that stores, a tweet content, a username, time it was created.
CREATE TABLE tweets
(
	content VARCHAR(180),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);
