Question 1
-- Creating a table that violates 1NF due to multivalued Products
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(100) -- Contains one product per row (flattened for simplicity)
);

-- Inserting product data; each product is now a separate row for 1NF compliance
INSERT INTO ProductDetail (OrderID, CustomerName, Products)
VALUES
(101, 'Kea Smith', 'Laptop'),
(101, 'Kea Smith', 'Mouse'),
(102, 'Linky VanRooyen', 'Tablet'),
(102, 'Linky VanRooyen', 'Keyboard'),
(102, 'Linky VanRooyen', 'Mouse'),
(103, 'Boitumelo VanWyk', 'Phone');

Question 2
-- Creating the Orders table with OrderID as the primary key
-- CustomerName depends entirely on OrderID, fixing the partial dependency issue
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Inserting unique orders with associated customer names
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'Kea Smith'),
(102, 'Linky VanRooyen'),
(103, 'Boitumelo VanWyk');

-- Creating the Product table with a composite primary key (OrderID, Product)
-- Each product entry is tied to a specific order, and quantity is fully dependent on both
CREATE TABLE Product (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting detailed product and quantity data per order
INSERT INTO Product (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);







