-- 1.Problem statement
-- Table: Accounts

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | account_id  | int  |
-- | income      | int  |
-- +-------------+------+
-- account_id is the primary key for this table.
-- Each row contains information about the monthly income for one bank account.


-- Write an SQL query to report the number of bank accounts of each salary category. The salary categories are:

-- "Low Salary": All the salaries strictly less than $20000.
-- "Average Salary": All the salaries in the inclusive range [$20000, $50000].
-- "High Salary": All the salaries strictly greater than $50000.
-- The result table must contain all three categories. If there are no accounts in a category, then report 0. Return the result table in any order.

-- The query result format is in the following example.

-- Accounts table:
-- +------------+--------+
-- | account_id | income |
-- +------------+--------+
-- | 3          | 108939 |
-- | 2          | 12747  |
-- | 8          | 87709  |
-- | 6          | 91796  |
-- +------------+--------+

-- Result table:
-- +----------------+----------------+
-- | category       | accounts_count |
-- +----------------+----------------+
-- | Low Salary     | 1              |
-- | Average Salary | 0              |
-- | High Salary    | 3              |
-- +----------------+----------------+

-- Low Salary: Account 2.
-- Average Salary: No accounts.
-- High Salary: Accounts 3, 6, and 8.
use AVI;
create table Accounts(account_id int primary key, income int) ;
INSERT into Accounts ()
values(3,108939),
(2,12747),
(8,87709),
(6,91796);

-- SELECT CASE
-- WHEN income < 20000 THEN 'Low Salary'
-- WHEN income < 50000 AND income >20000 THEN 'Average Salary'
-- WHEN income > 50000 THEN 'High Salary'
-- END AS category ,count(account_id) accounts_count  FROM Accounts GROUP BY category;


SELECT
    categories.category,
    COUNT(accounts.account_id) AS accounts_count
FROM
    (
        SELECT 'Low Salary' AS category
        UNION ALL
        SELECT 'Average Salary'
        UNION ALL
        SELECT 'High Salary'
    ) AS categories
LEFT JOIN
    Accounts ON
    CASE
        WHEN Accounts.income < 20000 THEN 'Low Salary'
        WHEN Accounts.income >= 20000 AND Accounts.income <= 50000 THEN 'Average Salary'
        ELSE 'High Salary'
    END = categories.category
GROUP BY
    categories.category
ORDER BY
    FIELD(categories.category, 'Low Salary', 'Average Salary', 'High Salary');

-- Without using JOINS-----------------------------------------------------------------------------------------------------------------------------------------------
-- SELECT
--     'Low Salary' AS category,
--     COUNT(CASE WHEN income < 20000 THEN account_id END) AS accounts_count
-- FROM
--     Accounts
-- UNION ALL
-- SELECT
--     'Average Salary' AS category,
--     COUNT(CASE WHEN income >= 20000 AND income <= 50000 THEN account_id END) AS accounts_count
-- FROM
--     Accounts
-- UNION ALL
-- SELECT
--     'High Salary' AS category,
--     COUNT(CASE WHEN income > 50000 THEN account_id END) AS accounts_count
-- FROM
--     Accounts;

 

