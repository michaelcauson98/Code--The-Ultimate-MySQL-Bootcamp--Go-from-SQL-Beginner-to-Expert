-- Create table and insert exercise

-- Create table
CREATE TABLE Employees
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    last_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed'
);

-- Check description
DESC Employees;

-- Populate table
INSERT INTO Employees(first_name,last_name,age)
VALUES  ('Thomas','Chickenman',87);

INSERT INTO Employees(first_name,last_name,age)
VALUES  ('John','Smith',26);

INSERT INTO Employees(first_name,middle_name,last_name,age)
VALUES  ('Harry','Harold','Harrison',60);

-- Check entries
SELECT * FROM Employees