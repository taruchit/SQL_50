# Write your MySQL query statement below
SELECT person_name
FROM 
(
SELECT turn, weight, person_name,
SUM(weight) OVER (ORDER BY turn) as total_weight
FROM Queue
) AS derived_table
WHERE total_weight<=1000
ORDER BY turn DESC
LIMIT 1