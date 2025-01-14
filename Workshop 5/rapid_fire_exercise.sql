-- Rapid fire exercises

-- Q1, selects cat_id for all rows
SELECT cat_id FROM cats;

-- Q2, selects (name, breed) for all rows
SELECT name, breed FROM cats;

-- Q3, selects (name, age) of Tabby cats
SELECT name, age FROM cats WHERE breed = 'Tabby';

-- Q4, selects (cat_id, age) whenever cat_id == age
SELECT cat_id, age FROM cats WHERE cat_id = age;