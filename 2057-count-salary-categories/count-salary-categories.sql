# Write your MySQL query statement below
/*
SELECT category, COUNT(category) AS accounts_count
FROM
(SELECT account_id,
CASE 
WHEN income<20000 THEN "LS"
WHEN income BETWEEN 20000 AND 50000 THEN "AS"
WHEN income>50000 THEN "HS"
END AS category
FROM Accounts) AS dervived_table
GROUP BY category
*/

SELECT c.category, COUNT(d.account_id) AS accounts_count
FROM
(
    SELECT "Low Salary" AS category
    UNION
    SELECT "Average Salary" AS category
    UNION
    SELECT "High Salary" AS category
) AS c
LEFT JOIN 
(
    SELECT account_id,
    CASE 
    WHEN income<20000 THEN "Low Salary"
    WHEN income BETWEEN 20000 AND 50000 THEN "Average Salary"
    WHEN income>50000 THEN "High Salary"
    END AS category
    FROM Accounts
) AS d
ON c.category=d.category
GROUP BY c.category

