# Write your MySQL query statement below
/*
SELECT product_id, new_price, MAX(change_date) AS max_change_date
FROM
(SELECT product_id, new_price, change_date
FROM Products
WHERE change_date<="2019-08-16"
GROUP BY product_id, change_date
ORDER BY change_date DESC, product_id) AS dervived_table
GROUP BY product_id
*/
/*
SELECT DISTINCT a.product_id, b.product_id, b.new_price, b.change_date
FROM Products a
LEFT JOIN Products b
ON a.product_id=b.product_id
*/

SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN 
(
    SELECT product_id, MAX(change_date)
    FROM Products
    WHERE change_date<="2019-08-16"
    GROUP BY product_id
)
UNION
SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN
(
 SELECT product_id
    FROM Products
    WHERE change_date<="2019-08-16"
    GROUP BY product_id   
)