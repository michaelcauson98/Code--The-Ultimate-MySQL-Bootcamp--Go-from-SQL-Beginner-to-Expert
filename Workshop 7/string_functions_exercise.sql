-- String functions exercise

-- Q1, reverse and uppercase: "Why does my cat look at me with such hatred?"
SELECT REVERSE('Why does my cat look at me with such hatred?');

-- Q2, what does the following commented SQL code print?

-- SELECT REPLACE(
-- CONCAT('I', ' ', 'like', ' ', 'cats'),
-- ' ',
-- '-'
-- );

-- A2, 'I-like-cats'

-- Q3, replace space in book titles with '->'. Name the output: 'title'.
SELECT REPLACE(title, ' ', '->') AS title FROM books;

-- Q4, Print authors' surname and reverse surname as two columns, titled 'forwards' and 'backwards'.
SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;

-- Q5, Print authors' full name but in caps, title 'full name in caps'.
SELECT UPPER(
	CONCAT(
		author_fname,
		' ',
		author_lname
	)
) AS 'full name in caps'
FROM books;

-- Q6, Produce '{title} was released in {date}', titled 'blurb'.
SELECT CONCAT(
	title,
    ' was released in ',
    released_year
) AS blurb FROM books;


-- Q7, Print book titles and the length of each title, title count 'character count'.
SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;

-- Q8, Print 'short title' (first 10 characters, followed by '...'), 'author' (last name, first name), and quantity ({stock_count} in stock).
SELECT
	CONCAT(SUBSTR(title,1,10),'...') AS 'short title',
	CONCAT(author_lname, ', ', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM books;