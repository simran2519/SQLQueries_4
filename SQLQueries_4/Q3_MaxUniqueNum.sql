-- 3.Problem statement
--  Table my_numbers contains many numbers in column num including duplicated ones.
--  Can you write a SQL query to find the biggest number, which only appears once.

--  +---+
-- |num|
-- +---+
-- | 8 |
-- | 8 |
-- | 3 |
-- | 3 |
-- | 1 |
-- | 4 |
-- | 5 |
-- | 6 | 

-- For the sample data above, your query should return the following result:
-- +---+
-- |num|
-- +---+
-- | 6 |
-- Note: If there is no such number, just output null.
use AVI;
CREATE table MyNumbers (num int);
INSERT INTO MyNumbers ()
VALUES (8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);
-- SELECT num, max(num) 
-- (SELECT count(num) as Totalnum FROM MyNumbers GROUP BY num) 
-- Where 

 SELECT max(num) as num 
 FROM 
 (SELECT num
     FROM MYNumbers
     GROUP BY num
     HAVING COUNT(num) = 1) as unique_num

