-- 2.Problem statement
-- Select all employee's name and bonus whose bonus is < 1000.

-- Table:Employee

-- +-------+--------+-----------+--------+
-- | empId |  name  | supervisor| salary |
-- +-------+--------+-----------+--------+
-- |   1   | John   |  3        | 1000   |
-- |   2   | Dan    |  3        | 2000   |
-- |   3   | Brad   |  null     | 4000   |
-- |   4   | Thomas |  3        | 4000   |
-- +-------+--------+-----------+--------+
-- empId is the primary key column for this table.
-- Table: Bonus

-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+
-- empId is the primary key column for this table.

-- Example output:

--  +-------+-------+
--  | name  | bonus |
-- +-------+-------+
-- | John  | null  |
-- | Dan   | 500   |
-- | Brad  | null  |
-- +-------+-------+

use AVI;
create table Employee (empId int primary key, name varchar(50), supervisor int , salary int );
create table bonus (empId int primary key, bonus int);
-- Insert values into the Employee table
INSERT INTO Employee (empId, name, supervisor, salary)
VALUES
(1, 'John', 3, 1000),
(2, 'Dan', 3, 2000),
(3, 'Brad', NULL, 4000),
(4, 'Thomas', 3, 4000);

-- Insert values into the Bonus table
INSERT INTO Bonus (empId, bonus)
VALUES
(2, 500),
(4, 2000);

-- Solution Query 
SELECT Employee.empId ,Bonus.bonus
FROM Employee 
LEFT JOIN Bonus ON Employee.empId=Bonus.empId
WHERE bonus< 1000 OR bonus IS NULL