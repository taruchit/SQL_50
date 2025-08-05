# Write your MySQL query statement below
/*
SELECT a.id, a.name AS Employee, a.salary AS Salary, a.departmentId, b.name AS Department
FROM Employee a
LEFT JOIN Department b
ON a.departmentId=b.id
ORDER BY b.name, a.salary DESC
*/

SELECT b.name AS Department, a.name AS Employee, a.salary AS Salary
FROM Employee a
LEFT JOIN Department b
ON a.departmentId=b.id
WHERE (
    SELECT COUNT(DISTINCT c.salary)
    FROM Employee c
    WHERE c.departmentId=a.departmentId AND c.salary>a.salary
)<3