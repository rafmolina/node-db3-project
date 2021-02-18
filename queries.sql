-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select category.CategoryName, product.ProductName from category
join product
on product.CategoryId = category.id


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT [order].Id, Shipper.CompanyName, [order].OrderDate FROM [order]
JOIN Shipper ON [order].ShipVia = Shipper.Id
where [order].OrderDate < '2012-08-09'
ORDER BY Orderdate

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName, OrderDetail.Quantity FROM Product
JOIN OrderDetail ON OrderDetail.ProductId = Product.Id
WHERE OrderDetail.OrderId = '10251'

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [Order].Id, Customer.CompanyName, Employee.LastName FROM [Order] JOIN Customer 
ON [Order].CustomerId = Customer.Id JOIN Employee ON [Order].EmployeeId = Employee.Id