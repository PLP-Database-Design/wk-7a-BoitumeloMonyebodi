Question 1
-- Original ProductDetail table with multivalued 'Products' column (violates 1NF)
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(255)
);

-- Inserting sample data with multiple products in one field
INSERT INTO ProductDetail (OrderID, CustomerName, Products) VALUES
(101, 'kea Smith', 'Laptop, Mouse'),
(102, 'Linky VanRooyen', 'Tablet, Keyboard, Mouse'),
(103, 'Boitumelo VanWyk', 'Phone');


-- Transformed table where each product is a separate row (1NF-compliant)
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Inserting normalized data: one product per row
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'kea Smith', 'Laptop'),
(101, 'Kea Smith', 'Mouse'),
(102, 'Linky VanRooyen', 'Tablet'),
(102, 'Linky VanRooyen', 'Keyboard'),
(102, 'Linky VanRooyen', 'Mouse'),
(103, 'Boitumelo VanWyk', 'Phone');

Question 2
-- Original OrderDetails table with partial dependency: CustomerName depends only on OrderID
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

-- Inserting sample data showing partial dependency
INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity) VALUES
(101, 'kea Smith', 'Laptop', 2),
(101, 'Kea Smith', 'Mouse', 1),
(102, 'Linky VanRooyen', 'Tablet', 3),
(102, 'Linky VanRooyen', 'Keyboard', 1),
(102, 'Linky VanRooyen', 'Mouse', 2),
(103, 'Boitumelo VanWyk', 'Phone', 1);


-- OrderItems table stores product and quantity per order
-- Fully depends on both OrderID and Product (no partial dependency)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting product info for each order
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);






