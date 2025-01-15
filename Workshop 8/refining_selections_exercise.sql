-- Add new data too book table
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
-- Refining selections exercise

-- Q1, All story titles that contain 'stories' somewhere.
SELECT title FROM books WHERE title LIKE '%stories%';

-- Q2, Print the title of the book with the largest page count.
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- Q3, Print summary containing title and year for 3 most recent books in table.
SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

-- Q4, Find all books with an author_lname that contains space character.
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

-- Q5, Find 3 books with lowest stock quantity, printing title, year and stock count.
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

-- Q6, Print title and author_lname, sorted first by author_lname, then by title.
SELECT title, author_lname FROM books ORDER BY author_lname, title;

-- Q7, Produce 'yell' table, then sort alphabettically by last name
SELECT
	UPPER(CONCAT(
		'my favourite author is ',
        author_fname,
        ' ',
        author_lname,
        '!'
        )) as yell
FROM BOOKS ORDER BY author_lname;
