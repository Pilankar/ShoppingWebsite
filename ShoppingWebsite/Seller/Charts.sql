--Stocks Per Peroduct
--SELECT Product.Id, Product.[name], StockDetails.size, StockDetails.stock_no 
--FROM Product INNER JOIN MappingTable
--ON Product.Id = MappingTable.product_id
--INNER JOIN StockDetails
--ON MappingTable.stock_id = StockDetails.Id
--WHERE Product.seller_id = 101; 

--Revenue Trend This Month
SELECT Convert(varchar(10), [Order].orderedDate, 23) AS OrderedDate, SUM(Product.price*OrderDetail.quantity) AS TotalPrice
FROM Product INNER JOIN OrderDetail 
ON Product.Id = OrderDetail.product_id INNER JOIN [Order] ON OrderDetail.order_id = [Order].Id 
WHERE (MONTH([Order].orderedDate) = MONTH(GETDATE())) AND (Product.seller_id = 101) 
GROUP BY [Order].orderedDate;

--Revenue Today
SELECT SUM(Product.price*OrderDetail.quantity) AS Revenue
FROM Product INNER JOIN OrderDetail 
ON Product.Id = OrderDetail.product_id INNER JOIN [Order] ON OrderDetail.order_id = [Order].Id 
WHERE (convert(date,[Order].orderedDate) = convert(date,getdate())) AND (Product.seller_id = 101);


--Units Today
SELECT SUM(OrderDetail.quantity) AS Units
FROM Product INNER JOIN OrderDetail 
ON Product.Id = OrderDetail.product_id INNER JOIN [Order] ON OrderDetail.order_id = [Order].Id 
WHERE (convert(date,[Order].orderedDate) = convert(date,getdate())) AND (Product.seller_id = 101);

--Sales Per Category This Month
SELECT CONCAT(Product.category_type ,' ', Product.category_subtype) AS Category, SUM(Product.price*OrderDetail.quantity) AS TotalPrice
FROM Product INNER JOIN OrderDetail 
ON Product.Id = OrderDetail.product_id INNER JOIN [Order] ON OrderDetail.order_id = [Order].Id 
WHERE (MONTH([Order].orderedDate) = MONTH(GETDATE())) AND (Product.seller_id = 101) 
GROUP BY CONCAT(Product.category_type ,' ', Product.category_subtype);

--Less than 200 Stocks per Product
SELECT Product.Id, StockDetails.size, StockDetails.stock_no
FROM Product INNER JOIN MappingTable
ON Product.Id = MappingTable.product_id
INNER JOIN StockDetails
ON MappingTable.stock_id = StockDetails.Id
WHERE Product.seller_id = 101 AND StockDetails.stock_no <= 200; 

--Profit Trend This Month
SELECT Convert(varchar(10), [Order].orderedDate, 23) AS OrderedDate, SUM((Product.price*OrderDetail.quantity))+(-1000) AS Profit
FROM Product INNER JOIN OrderDetail 
ON Product.Id = OrderDetail.product_id INNER JOIN [Order] ON OrderDetail.order_id = [Order].Id 
WHERE (MONTH([Order].orderedDate) = MONTH(GETDATE())) AND (Product.seller_id = 101) 
GROUP BY [Order].orderedDate;

--Profit Today
SELECT SUM(Product.price*OrderDetail.quantity)+(-1000) AS Profit
FROM Product INNER JOIN OrderDetail 
ON Product.Id = OrderDetail.product_id INNER JOIN [Order] ON OrderDetail.order_id = [Order].Id 
WHERE (convert(date,[Order].orderedDate) = convert(date,getdate())) AND (Product.seller_id = 101);

--Dates
Select Convert(date, getdate(), 23) AS Dates;
select Convert(varchar(10), getdate(), 23) AS Dates;
SELECT CAST( GETDATE() AS Date );
select CURDATE() AS Dates;
SELECT CONVERT (date, GETDATE());