Write a SQL query to select products with an average sale price greater than $100, using the HAVING clause to filter the results.


 MySQL  localhost:3306 ssl  student  SQL > CREATE TABLE Sales (
                                        ->     sale_id INT PRIMARY KEY,
                                        ->     product_id INT,
                                        ->     product_name VARCHAR(100),
                                        ->     region VARCHAR(50),
                                        ->     quantity INT,
                                        ->     sale_price DECIMAL(10,2),
                                        ->     sale_amount DECIMAL(10,2)
                                        -> );
  MySQL  localhost:3306 ssl  student  SQL > INSERT INTO Sales
                                        -> (sale_id, product_id, product_name, region, quantity, sale_price, sale_amount)
                                        -> VALUES
                                        -> (1, 101, 'Laptop', 'North', 2, 600.00, 1200.00),
                                        -> (2, 102, 'Mouse', 'South', 10, 20.00, 200.00),
                                        -> (3, 101, 'Laptop', 'East', 1, 650.00, 650.00),
                                        -> (4, 103, 'Printer', 'West', 3, 150.00, 450.00),
                                        -> (5, 104, 'Monitor', 'North', 5, 180.00, 900.00);
 MySQL  localhost:3306 ssl  student  SQL > SELECT
                                        ->     product_id,
                                        ->     product_name,
                                        ->     AVG(sale_price) AS average_sale_price
                                        -> FROM Sales
                                        -> GROUP BY product_id, product_name
                                        -> HAVING AVG(sale_price) > 100;
+------------+--------------+--------------------+
| product_id | product_name | average_sale_price |
+------------+--------------+--------------------+
|        101 | Laptop       |         625.000000 |
|        103 | Printer      |         150.000000 |
|        104 | Monitor      |         180.000000 |
+------------+--------------+--------------------+
Develop a SQL query that groups sales data by region and uses the HAVING clause to identify regions with total sales exceeding $10,000.


 MySQL  localhost:3306 ssl  student  SQL > SELECT
                                        ->     region,
                                        ->     SUM(sale_amount) AS total_sales
                                        -> FROM Sales
                                        -> GROUP BY region
                                        -> HAVING SUM(sale_amount) > 10000;
Empty set (0.0019 sec)

Create a SQL query to find products with a sales count greater than 50, applying the HAVING clause to filter the grouped data.
 MySQL  localhost:3306 ssl  student  SQL > SELECT
                                        ->     product_id,
                                        ->     product_name,
                                        ->     COUNT(*) AS sales_count
                                        -> FROM Sales
                                        -> GROUP BY product_id, product_name;
+------------+--------------+-------------+
| product_id | product_name | sales_count |
+------------+--------------+-------------+
|        101 | Laptop       |           2 |
|        102 | Mouse        |           1 |
|        103 | Printer      |           1 |
|        104 | Monitor      |           1 |
+------------+--------------+-------------+

Write a SQL query that calculates the total sales for each product and uses the HAVING clause to select products with total sales between 
5,000 and 20,000.

  MySQL  localhost:3306 ssl  student  SQL > SELECT
                                        ->     product_id,
                                        ->     product_name,
                                        ->     SUM(sale_amount) AS total_sales
                                        -> FROM Sales
                                        -> GROUP BY product_id, product_name
                                        -> HAVING SUM(sale_amount) BETWEEN 5000 AND 20000;
Empty set (0.0022 sec)

Optimize each query for performance, considering indexing, subqueries, and other relevant SQL techniques.

SQL HAVING Clause – Query Optimization Assignment

SELECT product_id, product_name, AVG(sale_price) AS avg_price
FROM Sales
GROUP BY product_id, product_name
HAVING AVG(sale_price) > 100;

Optimization:

Create index on grouped columns:

CREATE INDEX idx_product ON Sales(product_id, product_name);

Use WHERE to reduce rows before grouping:

SELECT product_id, product_name, AVG(sale_price)
FROM Sales
WHERE sale_price > 0
GROUP BY product_id, product_name
HAVING AVG(sale_price) > 100;