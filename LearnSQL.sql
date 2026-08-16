

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

SELECT Customer.FirstName, Customer.LastName, Invoice.InvoiceId
FROM Customer
INNER JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId;
/* Joins products and categories - Inner Join*/







SELECT Customer.FirstName, Customer.LastName, Invoice.InvoiceId
FROM Customer
LEFT JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId
ORDER BY Customer.LastName;
/* Combines tables based on a related column - Left Join*/


SELECT Invoice.InvoiceId, Customer.LastName, Customer.FirstName
FROM Invoice
RIGHT JOIN Customer
ON Invoice.CustomerId = Customer.CustomerId
ORDER BY Invoice.InvoiceId;
/* Right Join - Returns all customers and their matching invoices */


SELECT Customer.FirstName, Customer.LastName, Invoice.InvoiceId
FROM Customer
FULL JOIN Invoice
ON Customer.CustomerId = Invoice.CustomerId;
/* Full Join - Returns all customers and all invoices, matched where possible */



SELECT
    A.FirstName || ' ' || A.LastName AS CustomerName1,
    B.FirstName || ' ' || B.LastName AS CustomerName2,
    A.City
FROM Customer A, Customer B
WHERE A.CustomerId <> B.CustomerId
AND A.City = B.City
ORDER BY A.City;
/* Self Join - Matches different customers who live in the same city */


/*
SELECT column1, aggregate_function(column2), column3, ...
FROM table_name
WHERE condition
GROUP BY column1, column3
ORDER BY column_name;
*/

SELECT Country, COUNT(*) 
AS NumberOfCustomers
FROM Customer
GROUP BY Country;
/*To group how many customers from each country*/

SELECT Country, COUNT(*) AS NumberOfCustomers
FROM Customer
GROUP BY Country
HAVING COUNT(*) > 3; 
/* Assuming u only want countries with more than 3 customers*/

/*ORDER BY - sorting*/

SELECT *
FROM Customer
ORDER BY FirstName ASC;
/* Sorted alphabetically from A-Zssssss*/