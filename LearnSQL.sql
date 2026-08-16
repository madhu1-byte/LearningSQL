

SELECT name FROM sqlite_master
WHERE type = 'table';

SELECT * FROM Customer; /*Select data and print*/
SELECT CustomerId, Phone, Email FROM Customer; 
/*Prints a table of just the customer ID, phone and email 
from the customer database*/

SELECT DISTINCT Country FROM Customer;
/*Prints only unique values, no duplicates*/

SELECT * FROM Customer
WHERE Country = 'Germany';
/* Only prints prints data of selected country*/


INSERT INTO Customer
(CustomerId, FirstName, LastName, Company, Address, City,
 State, Country, PostalCode, Phone, Fax, Email, SupportRepId)
VALUES
(60, 'Jason', 'Lee', 'Morgan', 'Fifth St', 'Albany', 'NY', 'USA',
 '18944', '+1 893 633 9089', NULL, 'jason@gmail.com', 7);
/* Added a new customer 'Jason' and all his info*/



UPDATE Customer
SET Company = 'Google', Email = 'jason01@gmail.com'
WHERE CustomerId = 60;
/*Update Jason's work and email info*/

SELECT *
FROM Customer
WHERE CustomerId = 60;
/Print Customer 60 (Jason)*/

DELETE FROM Customer
WHERE CustomerFirstName ='Jason';
/*Deleted Jason's first name from database */

SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
FROM Products
INNER JOIN Categories 
ON Products.CategoryID = Categories.CategoryID;
/* Joins products and categories - Inner Join*/

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
/* Combines tables based on a related column - Left Join*/

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID; 
/* Right Join */

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
/* All everything tgt - Full Join*/

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;
/* Self Join - Only matches customers from the same city*/

