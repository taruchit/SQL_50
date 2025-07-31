# Write your MySQL query statement below

SELECT results
FROM
(SELECT name AS results
FROM Users
WHERE user_id = (
SELECT user_id_1
FROM
(
SELECT a.user_id AS user_id_1, a.name AS name_1, COUNT(b.movie_id) AS rating_count
FROM Users a LEFT JOIN MovieRating b
ON a.user_id=b.user_id
GROUP BY a.user_id
ORDER BY rating_count DESC, a.name ASC
) AS derived_table_1
LIMIT 1
)
UNION ALL
SELECT title AS results
FROM Movies
WHERE movie_id = (
SELECT movie_id_1
FROM
(SELECT c.movie_id AS movie_id_1, c.title AS name_2, AVG(d.rating) AS avg_rating
FROM Movies c
LEFT JOIN MovieRating d 
ON c.movie_id=d.movie_id AND d.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY c.movie_id
ORDER BY avg_rating DESC, title ASC)
AS derived_table_2
LIMIT 1
)) AS derived_table_3


# Row 1 result
/*
SELECT name AS results
FROM Users
WHERE user_id = (
SELECT user_id_1
FROM
(
SELECT a.user_id AS user_id_1, a.name AS name_1, COUNT(b.movie_id) AS rating_count
FROM Users a LEFT JOIN MovieRating b
ON a.user_id=b.user_id
GROUP BY a.user_id
ORDER BY rating_count DESC, a.name ASC
) AS derived_table_1
LIMIT 1
)
*/
# Row 2 results
/*
SELECT title AS results
FROM Movies
WHERE movie_id = (
SELECT movie_id_1
FROM
(SELECT c.movie_id AS movie_id_1, c.title AS name_2, AVG(d.rating) AS avg_rating
FROM Movies c
LEFT JOIN MovieRating d 
ON c.movie_id=d.movie_id AND d.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY c.movie_id
ORDER BY avg_rating DESC, title ASC)
AS derived_table_2
LIMIT 1
)
*/
/*
SELECT name_1
FROM
(
SELECT a.user_id AS user_id_1, a.name AS name_1, COUNT(b.movie_id) AS rating_count
FROM Users a LEFT JOIN MovieRating b
ON a.user_id=b.user_id
GROUP BY a.user_id
ORDER BY rating_count DESC, a.name ASC
) AS derived_table
LIMIT 1
*/