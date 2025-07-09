# Write your MySQL query statement below
/*
SELECT b.contest_id, ROUND(COUNT(b.user_id)*100/3,2) AS percentage
FROM Register b LEFT JOIN Users a
ON b.user_id=a.user_id
GROUP BY b.contest_id
ORDER BY percentage DESC, contest_id ASC
*/

SELECT b.contest_id, 
ROUND(COUNT(DISTINCT b.user_id)*100/(SELECT COUNT(a.user_id) FROM Users a),2) AS
percentage
FROM Register b
GROUP BY b.contest_id
ORDER BY percentage DESC, b.contest_id ASC