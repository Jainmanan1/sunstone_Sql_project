CREATE DATABASE IF NOT EXISTS online_retail;
USE online_retail;


CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    ContactInfo VARCHAR(50),
    BankDetails VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Discount DECIMAL(5, 2)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    DeliveryAddress VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItem (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Customers (Name, Address, ContactInfo, BankDetails)
VALUES ('John Doe', '123 Main St', '555-1234', 'Bank A - 12345678'),
       ('Jane Smith', '456 Oak St', '555-5678', 'Bank B - 87654321');


INSERT INTO Products (ProductName, Description, Price, StockQuantity, Discount)
VALUES ('Laptop', 'High-end gaming laptop', 1200.00, 10, 10.00),
       ('Smartphone', 'Latest model smartphone', 800.00, 20, 5.00),
       ('Tablet', '10-inch display tablet', 400.00, 15, 7.50);


INSERT INTO Orders (OrderDate, CustomerID, TotalAmount, PaymentMethod, DeliveryAddress)
VALUES ('2024-07-01', 1, 1300.00, 'Credit Card', '123 Main St'),
       ('2024-07-02', 2, 850.00, 'PayPal', '456 Oak St');

INSERT INTO OrderItem (OrderID, ProductID, Quantity, Price)
VALUES (1, 1, 1, 1200.00),
       (1, 3, 1, 100.00),  
       (2, 2, 1, 800.00),
       (2, 3, 1, 50.00);  
