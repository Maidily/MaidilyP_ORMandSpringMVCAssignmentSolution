-- Create database
CREATE DATABASE IF NOT EXISTS customerManagement;
USE customerManagement;

-- Create table
CREATE TABLE IF NOT EXISTS customers (
customer_id int primary key auto_increment, 
first_name varchar(100), 
last_name varchar(100), 
email varchar(50)
);

-- select query :: testing
SELECT * FROM customers;
