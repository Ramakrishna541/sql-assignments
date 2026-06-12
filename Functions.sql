CREATE TABLE Customers 
 CustomerID INT PRIMARY KEY,
 CustomerName VARCHAR(100) 
);

CREATE TABLE Orders ( 
OrderID INT PRIMARY KEY,
 CustomerID INT, OrderAmount DECIMAL(10,2),
 Tax DECIMAL(10,2), 
FOR EIGN KEY (CustomerID) REFERENCES Customers(CustomerID) );

INSERT INTO Customers VALUES (1, 'Ravi'), (2, 'Sita'), (3, 'Arjun');

INSERT INTO Orders VALUES (101, 1, 1000, 50), (102, 1, 2000, 100), (103, 2, 500, 25), (104, 3, 7000, 350);

Create a SQL function named CalculateOrderTotal that takes an order ID as input and returns the total cost of the order, including any applicable taxes.

DELIMITER //

CREATE FUNCTION CalculateOrderTotal(p_OrderID INT)
RETURNS DECIMAL(10,2)

DETERMINISTIC

BEGIN
    DECLARE TotalCost DECIMAL(10,2);

    SELECT (OrderAmount + Tax)
    INTO TotalCost
    FROM Orders
    WHERE OrderID = p_OrderID;

    RETURN TotalCost;
END //

DELIMITER ;

Develop a SQL function named DetermineLoyaltyLevel that takes a customer ID as input and returns the customer's loyalty level based on their total spend across all orders.

DELIMITER //

CREATE FUNCTION CalculateOrderTotal(p_OrderID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC

BEGIN
    DECLARE TotalCost DECIMAL(10,2);

    SELECT (OrderAmount + Tax)
    INTO TotalCost
    FROM Orders
    WHERE OrderID = p_OrderID;

    RETURN TotalCost;
END //
DELIMITER ;

Write example queries that demonstrate how to use each of the created functions to retrieve meaningful data from the database
SELECT CalculateOrderTotal(101);
+--------------------------+
| CalculateOrderTotal(101) |
+--------------------------+
|                  1050.00 |
+--------------------------+
 SELECT DetermineLoyaltyLevel(1);
+--------------------------+
| DetermineLoyaltyLevel(1) |
+--------------------------+
| Silver                   |
+--------------------------+

Test the functions with sample data to ensure they produce the expected results and handle edge cases appropriately.
SELECT
->     OrderID,
->     CalculateOrderTotal(OrderID) AS TotalAmount
 -> FROM Orders;
+---------+-------------+
| OrderID | TotalAmount |
+---------+-------------+
|     101 |     1050.00 |
|     102 |     2100.00 |
|     103 |      525.00 |
|     104 |     7350.00 |
+---------+-------------+
SELECT
->     CustomerID,
->     CustomerName,
->     DetermineLoyaltyLevel(CustomerID) AS LoyaltyLevel
-> FROM Customers;
+------------+--------------+--------------+
| CustomerID | CustomerName | LoyaltyLevel |
+------------+--------------+--------------+
|          1 | Ravi         | Silver       |
|          2 | Sita         | Bronze       |
|          3 | Arjun        | Gold         |
+------------+--------------+--------------+