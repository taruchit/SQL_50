# Write your MySQL query statement below
SELECT a.query_name, ROUND(AVG(a.rating/a.position),2) AS quality, 
ROUND(((SELECT COUNT(1) FROM Queries c WHERE a.query_name=c.query_name AND
c.rating<3)/(SELECT COUNT(1) FROM Queries b WHERE a.query_name=b.query_name)*100),2)AS poor_query_percentage
FROM Queries a
GROUP BY query_name