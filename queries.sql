-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT product.ProductName, product.CategoryId
FROM product;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.Id, Shipper.CompanyName
FROM [Order] as o
JOIN Shipper on Shipper.Id = o.ShipVia
WHERE o.OrderDate < "2012=08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT P.ProductName, P.Id, OrderDetail.quantity
FROM Product as P 
JOIN OrderDetail on P.Id = OrderDetail.ProductId
WHERE OrderDetail.OrderID = 10251

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT od.OrderId, Customer.CompanyName, Employee.LastName
FROM OrderDetail as od
JOIN [Order] as o, on od.OrderID = o.Id
JOIN Employee as e on o.EmployeeId = e.Id
JOIN Customer as c on o.CustomerId = c.id

