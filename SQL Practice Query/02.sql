-- Customers:
-- 	CustomerID: Integer, Primary Key
-- 	FirstName: Text
-- 	LastName: Text
-- 	Email: Text

-- Products:
-- 	ProductID: Integer, Primary Key
-- 	ProductName: Text
-- 	Price: Decimal

-- Sales:
-- 	SaleID: Integer, Primary Key
-- 	CustomerID: Integer, Foreign Key references Customers(CustomerID)
-- 	ProductID: Integer, Foreign Key references Products(ProductID)
-- 	Quantity: Integer
-- 	SaleDate: Date
-----------------------------------------------------------------------------------------
-- Create the database
CREATE DATABASE SalesDB;

-- Use the created database
USE SalesDB;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Create the Sales table
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data into Customers table
INSERT INTO Customers (FirstName, LastName, Email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Michael', 'Johnson', 'michael.johnson@example.com');

-- Insert sample data into Products table
INSERT INTO Products (ProductName, Price) VALUES
('Laptop', 1200.00),
('Smartphone', 800.00),
('Tablet', 300.00);

-- Insert sample data into Sales table
INSERT INTO Sales (CustomerID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 2, '2023-06-01'),
(2, 2, 1, '2023-06-05'),
(3, 3, 3, '2023-06-10');

select * from customers
----------------------------------------------------------------------------------------------------
-- Practice: GROUP BY and HAVING
SELECT 
    c.CustomerID, 
    c.FirstName, 
    p.ProductName, 
    SUM(p.Price * s.Quantity) AS Total_Price, 
    c.Email
FROM 
    Customers c
JOIN 
    Sales s ON c.CustomerID = s.CustomerID
JOIN 
    Products p ON s.ProductID = p.ProductID
GROUP BY 
    c.CustomerID, c.FirstName, p.ProductName, c.Email;