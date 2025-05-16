-- Question 1:
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products TEXT
);

INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');
-- 1NF: Normalize multi-valued Products column into separate rows
SELECT 
    OrderID,
    CustomerName,
    TRIM(value) AS Product
FROM 
    ProductDetail,
    UNNEST(STRING_TO_ARRAY(Products, ',')) AS value;
-- Question2:
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);
INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity) VALUES
(101, 'John Doe', 'Laptop', 2),
(101, 'John Doe', 'Mouse', 1),
(102, 'Jane Smith', 'Tablet', 3),
(102, 'Jane Smith', 'Keyboard', 1),
(102, 'Jane Smith', 'Mouse', 2),
(103, 'Emily Clark', 'Phone', 1);
-- Table 1: Orders (Customer info, OrderID is primary key)
CREATE TABLE Orders AS
SELECT DISTINCT 
    OrderID, 
    CustomerName 
FROM OrderDetails;

-- Table 2: OrderItems (OrderID + Product as composite key)
CREATE TABLE OrderItems AS
SELECT 
    OrderID, 
    Product, 
    Quantity 
FROM OrderDetails;



