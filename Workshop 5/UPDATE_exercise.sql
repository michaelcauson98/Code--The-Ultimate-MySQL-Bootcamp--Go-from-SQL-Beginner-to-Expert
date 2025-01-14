-- UPDATE exercise

-- Q1, change Jackson's name to "Jack"
UPDATE cats SET name = 'Jack' WHERE name = 'Jackson';

-- Q2, change Ringo's breed to "British Shorthair"
UPDATE cats SET breed = 'British Shorthair' WHERE name = 'Ringo';

-- Q3, update both Maine Coons' age to be 12
UPDATE cats SET age = 12 WHERE breed = 'Maine Coon';

SELECT * FROM cats;