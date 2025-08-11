# Write your MySQL query statement below
SELECT MAX(salary) AS SecondHighestSalary
FROM
(SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
FROM Employee) AS derived_table
WHERE rnk=2