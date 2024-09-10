-- DATETIME 

-- Arithmetic on DATETIME Values
DATE_SUB(created_at, INTERVAL 4 DAY)  -- DATE_<operation>(<column>, INTERVAL <number> <unit>)`

-- The DATE_FORMAT Function
SELECT DATE_FORMAT("2017-06-15", "%D") -- SELECT DATE_FORMAT(<date_column>,<format>) 

show databases

use salesdb

-- create a table 
CREATE TABLE GFGemployees(
employee_id INT PRIMARY KEY, 
employee_name VARCHAR(50), 
manager_id INT);

-- Insert data into table
INSERT INTO GFGemployees (employee_id, employee_name, manager_id)
VALUES  (1, 'Zaid', 3),  (2, 'Rahul', 3),  (3, 'Raman', 4),  
(4, 'Kamran', NULL),  (5, 'Farhan', 4);

SELECT e.employee_name AS employee,
m.employee_name AS manager FROM 
GFGemployees AS e JOIN GFGemployees 
AS m ON e.manager_id = m.employee_id;



