# Write your MySQL query statement below
select user_id, name, mail
from Users
where REGEXP_LIKE (mail, '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$', 'c')