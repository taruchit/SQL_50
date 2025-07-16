# Write your MySQL query statement below
SELECT year AS first_year, product_id, quantity, price
FROM Sales
WHERE (product_id, year) IN (SELECT product_id, MIN(year) AS firstYear
FROM Sales GROUP BY product_id)