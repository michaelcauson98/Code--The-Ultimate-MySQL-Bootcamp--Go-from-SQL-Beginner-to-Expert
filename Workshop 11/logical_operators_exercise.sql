-- Exercise 11

-- Q1, Mentally evaluate the following:
-- SELECT 10 != 10; A: 0
-- SELECT 15 > 14 AND 99 - 5 <= 94; A: 1
-- SELECT 1 in (5,3) OR 9 BETWEEN 8 AND 10; A: 1

-- Q2, Select all books written before 1980
SELECT * FROM books WHERE released_year < 1980;

-- Q3, Select all books written by Eggers or Chabon
SELECT * FROM books WHERE author_lname IN ('Eggers', 'Chabon');

-- Q4, Select all books written by Lahiri, published after 2000
SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;

-- Q5, Select all books with page counts between 100 and 200
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

-- Q6, Select all books where author_lname starts with a 'C' or an 'S',
SELECT * FROM books WHERE author_lname LIKE 'c%' OR author_lname LIKE 's%';

-- Q7, If title contains 'stories' -> set type column as 'Short Stories'.
-- 	   If title is 'Just Kids' or 'A Heartbreaking Work...' set type column to 'Memoir'.
--     Else set type column to 'Novel'.
SELECT title, author_lname,
CASE
	WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title IN ('Just Kids', 'A Heartbreaking Work of Staggering Genius') THEN 'Memoir'
    ELSE 'Novel'
END AS TYPE
FROM books;

-- Q8 (bonus), Make table with author_fname, author_lname and COUNT which lists number of published book(s).
SELECT author_fname, author_lname,
CONCAT(
	COUNT(*),
	CASE
		WHEN COUNT(*) = 1 THEN ' book'
        ELSE ' books'
    END
) AS COUNT
FROM books GROUP BY author_fname, author_lname;
