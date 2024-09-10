create database ecommerce;

-- Basic Queries
	-- 1. List all unique cities where customers are located.
		  select distinct customer_city from customers

	-- 2. Count the number of orders placed in 2017.
		  select count(order_id) from orders where year(order_purchase_timestamp) = 2017

	-- 3. Find the total sales per category.
	-- 4. Calculate the percentage of orders that were paid in installments.
	-- 5. Count the number of customers from each state. 

SELECT * FROM mysql.user;

UPDATE mysql.user SET Password=PASSWORD('[Quest]') WHERE User='[root]';