# Write your MySQL query statement below
SELECT DISTINCT c.num AS ConsecutiveNums
FROM Logs a LEFT JOIN Logs b
ON a.num=b.num AND b.id=a.id+1
LEFT JOIN Logs c
ON b.num=c.num AND c.id=b.id+1
WHERE c.id IS NOT null