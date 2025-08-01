# Write your MySQL query statement below
SELECT visited_on, 
(SELECT sum(amount)
FROM Customer 
WHERE visited_on BETWEEN DATE_SUB(a.visited_on, INTERVAL 6 DAY) AND a.visited_on )
AS amount,
(SELECT ROUND(SUM(amount)/7, 2)
FROM Customer 
WHERE visited_on BETWEEN DATE_SUB(a.visited_on, INTERVAL 6 DAY) AND a.visited_on )
AS average_amount
FROM Customer a
WHERE visited_on >=(
    SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY) FROM Customer
)
GROUP BY visited_on
ORDER BY visited_on ASC