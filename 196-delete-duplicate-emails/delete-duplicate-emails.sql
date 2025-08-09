# Write your MySQL query statement below
DELETE a
FROM Person a
INNER JOIN Person b
ON a.email=b.email AND a.id>b.id