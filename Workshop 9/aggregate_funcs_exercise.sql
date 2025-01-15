-- Aggregate functions exercise

-- Q1, Print the number of books in database.
SELECT COUNT(*) FROM books;

-- Q2, Print how many book released in each year.
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

-- Q3, Print total number of books in stock.
SELECT SUM(stock_quantity) FROM books;

-- Q4, Find average release year for each author.
SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_lname, author_fname;

-- Q5, Find full name of the author who wrote the longest book.
SELECT CONCAT(author_fname, ' ', author_lname) AS name, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);

-- Q6, Make table with books released in each year, along with average number of pages.alter
SELECT
	released_year AS year,
    COUNT(*) AS '# books',
    AVG(pages) as 'avg pages'
FROM books
GROUP BY year
ORDER BY year ASC;