-- Database create --
create database project;

-- Database Use --
use project;

-- create table stocks --

create table Stocks
(stock_item_id Int primary key,
pub_id Int,
item_name varchar(50),
quantity BIGINT,
expiery_date DATETIME,
Import_date DATETIME,
scale varchar(30)); 

INSERT INTO Stocks (stock_item_id, pub_id, item_name, quantity, expiery_date, import_date, scale)
VALUES 
    (1, 101, 'Manhattan Whiskey', 5000, '2025-12-31 00:00:00', '2025-01-01 10:00:00', 'Litres'),
    (2, 102, 'Margarita Tequila', 3000, '2025-11-30 00:00:00', '2025-01-02 14:30:00', 'Litres'),
    (3, 103, 'Dry Martini', 1500, '2026-06-15 00:00:00', '2025-01-03 09:00:00', 'Liters'),
    (4, 104, 'Rice', 10000, '2025-08-01 00:00:00', '2025-01-04 11:45:00', 'Kilograms'),
    (5, 105, 'Milk Powder', 2000, '2025-03-31 00:00:00', '2025-01-05 08:00:00', 'Grams');
    
desc Stocks;

create table Location
(location_id Int primary key,
location_name varchar(50),
coordinates varchar(30));

INSERT INTO Location (location_id, location_name, coordinates)
VALUES
    (1, 'New York City', '40.7128° N, 74.0060° W'),
    (2, 'London', '51.5074° N, 0.1278° W'),
    (3, 'Tokyo', '35.6895° N, 139.6917° E'),
    (4, 'Sydney', '33.8688° S, 151.2093° E'),
    (5, 'Paris', '48.8566° N, 2.3522° E');
    
    desc Location;
    
create table Pubs
(pub_id Int primary key,
pub_name varchar(30),
location_id Int,
pub_telephone varchar(15),
address varchar(30),
postcode varchar(30));

INSERT INTO Pubs (pub_id, pub_name, location_id, pub_telephone, address, postcode)
VALUES
    (1, 'The Crown', 1, '123-456-7890', '123 Main St', 'NY10001'),
    (2, 'The Red Lion', 2, '234-567-8901', '45 Piccadilly St', 'LND123'),
    (3, 'Blue Moon', 3, '345-678-9012', '789 Ginza St', 'TK101-0032'),
    (4, 'The Harbour', 4, '456-789-0123', '22 Circular Quay', 'SY2000'),
    (5, 'Cafe de Paris', 5, '567-890-1234', '10 Rue de Rivoli', '75001');

  desc Pubs;
  
  create table Menus
  (item_id Int primary key,
  pub_id int,
  item_name	varchar(30),
  price float,
  menu_type varchar (20));
  
  INSERT INTO Menus (item_id, pub_id, item_name, price, menu_type)
VALUES
    (1, 1, 'Cheeseburger', 9.99, 'Food'),
    (2, 2, 'Fish and Chips', 12.50, 'Food'),
    (3, 3, 'Sushi Platter', 15.75, 'Food'),
    (4, 4, 'Lager Beer', 5.50, 'Drink'),
    (5, 5, 'Espresso', 3.00, 'Drink');
    
      desc Menus;
      
	create table Orders
    ( order_id Int primary key, 
    transaction_id 	Int,
    order_total Int,
    order_aid BOOLEAN,
    order_date_time DATETIME,
    payment_method varchar(20));
    
    INSERT INTO Orders (order_id, transaction_id, order_total, order_aid, order_date_time, payment_method)
VALUES
    (1, 1001, 250, TRUE, '2025-01-10 14:30:00', 'Credit Card'),
    (2, 1002, 400, FALSE, '2025-01-11 12:00:00', 'Cash'),
    (3, 1003, 150, TRUE, '2025-01-12 16:45:00', 'UPI'),
    (4, 1004, 500, FALSE, '2025-01-13 09:15:00', 'Debit Card'),
    (5, 1005, 300, TRUE, '2025-01-14 18:20:00', 'Digital Wallet');
    
	desc Orders;
    
    create table Transactions
    (transaction_id Int primary key,
    pub_id Int,
    item_id Int,
    customer_id Int,
    transaction_date_time DATETIME);
    
    INSERT INTO Transactions (transaction_id, pub_id, item_id, customer_id, transaction_date_time)
VALUES
    (1001, 1, 1, 201, '2025-01-10 14:30:00'),
    (1002, 2, 2, 202, '2025-01-11 12:00:00'),
    (1003, 3, 3, 203, '2025-01-12 16:45:00'),
    (1004, 4, 4, 204, '2025-01-13 09:15:00'),
    (1005, 5, 5, 205, '2025-01-14 18:20:00');
    
desc Transactions;
        
create table Customers
(customer_id Int primary key,
Name varchar(40),
contact_number varchar(15),
address varchar (60),
email varchar(50),
pub_id Int);

INSERT INTO Customers (customer_id, name, contact_number, address, email, pub_id)
VALUES
    (201, 'Alice Johnson', '123-456-7890', '123 Elm St, New York, NY', 'alice.johnson@example.com', 1),
    (202, 'Bob Smith', '234-567-8901', '45 Oak St, London, UK', 'bob.smith@example.co.uk', 2),
    (203, 'Charlie Brown', '345-678-9012', '789 Pine St, Tokyo, Japan', 'charlie.brown@example.jp', 3),
    (204, 'Diana Green', '456-789-0123', '22 Maple St, Sydney, Australia', 'diana.green@example.au', 4),
    (205, 'Eve White', '567-890-1234', '10 Rue de Paris, Paris, France', 'eve.white@example.fr', 5);

desc Customers;

create table Employees
(employee_id Int primary key,
role varchar(30),
name varchar(50),
contract_type varchar (30),
pub_id Int,
address varchar(100),
contact_number varchar(15),
postcode Varchar(20),
email Varchar(100));

INSERT INTO Employees (employee_id, role, name, contract_type, pub_id, address, contact_number, postcode, email)
VALUES
    (1, 'Manager', 'John Doe', 'Full-time', 1, '123 Main St, New York, NY', '123-456-7890', 'NY10001', 'john.doe@example.com'),
    (2, 'Chef', 'Jane Smith', 'Part-time', 2, '45 High St, London, UK', '234-567-8901', 'LND123', 'jane.smith@example.co.uk'),
    (3, 'Waiter', 'Mark Taylor', 'Full-time', 3, '789 King St, Tokyo, Japan', '345-678-9012', 'TK101-0032', 'mark.taylor@example.jp'),
    (4, 'Bartender', 'Emily Johnson', 'Part-time', 4, '22 Harbour St, Sydney, Australia', '456-789-0123', 'SY2000', 'emily.johnson@example.au'),
    (5, 'Host', 'David Green', 'Full-time', 5, '10 Rue de Rivoli, Paris, France', '567-890-1234', '75001', 'david.green@example.fr');

desc Employees;

create table Employees_shifts
(emp1oyee_shift_id Int primary key,
emp1oyee_id Int,
shift_start DATETIME,
shift_end DATETIME,
on_shift Boolean);

INSERT INTO Employees_shifts (employee_shift_id, employee_id, shift_start, shift_end, on_shift)
VALUES
    (1, 1, '2025-01-10 09:00:00', '2025-01-10 17:00:00', TRUE),
    (2, 2, '2025-01-11 10:00:00', '2025-01-11 16:00:00', TRUE),
    (3, 3, '2025-01-12 12:00:00', '2025-01-12 20:00:00', TRUE),
    (4, 4, '2025-01-13 14:00:00', '2025-01-13 22:00:00', FALSE),
    (5, 5, '2025-01-14 08:00:00', '2025-01-14 16:00:00', TRUE);

desc Employees_shifts;

create table Discounts
(discount_id Int primary key,
item_id Int,
discount_percentage Int,
end_date Date,
previous1y_used	Boolean);

INSERT INTO Discounts (discount_id, item_id, discount_percentage, end_date, previous1y_used)
VALUES
    (1, 1, 10, '2025-02-01', TRUE),
    (2, 2, 15, '2025-03-15', FALSE),
    (3, 3, 20, '2025-04-30', TRUE),
    (4, 4, 5, '2025-06-01', FALSE),
    (5, 5, 25, '2025-07-15', TRUE);

desc Discounts;
