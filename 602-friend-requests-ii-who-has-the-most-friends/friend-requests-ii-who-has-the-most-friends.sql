# Write your MySQL query statement below
SELECT id, COUNT(id) AS num
FROM
(
SELECT requester_id AS id FROM RequestAccepted
UNION ALL
SELEct accepter_id AS id FROM RequestAccepted
) AS derived_table
GROUP BY id
ORDER BY num DESC
LIMIT 1