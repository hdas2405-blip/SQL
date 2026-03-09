CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(100),
Category VARCHAR(50),
Price DECIMAL(10,2)

);

INSERT INTO Products VALUES
(1, 'Keyboard', 'Electronics', 1200),
(2, 'Mouse', 'Electronics', 800),
(3, 'Chair', 'Furniture', 2500),
(4, 'Desk', 'Furniture', 5500);

CREATE TABLE Sales (
SaleID INT PRIMARY KEY,
ProductID INT,
Quantity INT,
SaleDate DATE,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)

);

INSERT INTO Sales VALUES
(1, 1, 4, '2024-01-05'),
(2, 2, 10, '2024-01-06'),
(3, 3, 2, '2024-01-10'),
(4, 4, 1, '2024-01-11');

##Q6. Write a CTE to calculate the total revenue for each product
 ##(Revenues = Price × Quantity), and return only products where  revenue > 3000.
 
 WITH ProductRevenue AS (
    -- Step 1: Join tables and calculate revenue per product
    SELECT 
        p.ProductID, 
        p.ProductName, 
        SUM(p.Price * s.Quantity) AS TotalRevenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
    GROUP BY p.ProductID, p.ProductName
)
-- Step 2: Filter results based on the calculated total revenue
SELECT 
    ProductName, 
    TotalRevenue
FROM ProductRevenue
WHERE TotalRevenue > 3000;

##Q7. Create a view named vw_CategorySummary that shows: Category, TotalProducts, AveragePrice.

CREATE VIEW vw_CategorySummary AS
SELECT 
    Category, 
    COUNT(ProductID) AS TotalProducts, 
    AVG(Price) AS AveragePrice
FROM Products
GROUP BY Category;

##Q8. Create an updatable view containing ProductID, ProductName, and Price.
 ##Then update the price of ProductID = 1 using the view.

CREATE VIEW vw_ProductPricing AS
SELECT 
    ProductID, 
    ProductName, 
    Price
FROM Products;

##Q9. Create a stored procedure that accepts a category name and returns all products belonging to that category.

DELIMITER //

CREATE PROCEDURE GetProductsByCategory(IN category_name VARCHAR(50))
BEGIN
    SELECT ProductID, ProductName, Category, Price
    FROM Products
    WHERE Category = category_name;
END //

DELIMITER ;

##Q10. Create an AFTER DELETE trigger on the Products table that archives deleted product rows into a new
##table ProductArchive. The archive should store ProductID, ProductName, Category, Price, and DeletedAt timestamp.

CREATE TABLE ProductArchive (
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    DeletedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
