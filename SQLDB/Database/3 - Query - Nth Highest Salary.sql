
Use EmployeeDB;

-- For Nth highest salary, I usually use DENSE_RANK() because it correctly handles duplicate salaries and works for any N. 
-- Alternative approaches include TOP + DISTINCT, correlated subqueries, and nested MAX() for fixed values like 2nd or 3rd highest salary. 
-- ROW_NUMBER() and OFFSET/FETCH are generally avoided because they do not handle duplicate salaries correctly.

-- Select TOP 10 * from Employee Order By Salary DESC;

-- SELECT * 
-- FROM Employee
-- ORDER BY EmployeeID
-- OFFSET 3 ROWS
-- FETCH NEXT 5 ROWS ONLY;

-- Maximum Salary | 1st Highest Salary
Select Max(Salary) from Employee;

Select Salary From Employee 
Order By Salary DESC
Offset 0 Rows 
FETCH NEXT 1 ROWS ONLY;


-- 2nd Highest Salary

Select Max(Salary) from Employee Where Salary < (Select Max(Salary) from Employee);

Select Salary From Employee 
Order By Salary DESC
Offset 1 Rows 
FETCH NEXT 1 ROWS ONLY;


-- 3rd Highest Salary
Select * from Employee;

-- Approach 1 - Using TOP + DISTINCT (Most Common Interview Approach)
SELECT Min(Salary)
FROM
(
    SELECT DISTINCT TOP 3 Salary
    FROM Employee
    ORDER BY Salary DESC
) AS SalaryTable;


-- Approach 2 - Generic Nth Highest Salary
DECLARE @N INT = 3;

SELECT MIN(Salary)
FROM
(
    SELECT DISTINCT TOP (@N) Salary
    FROM Employee
    ORDER BY Salary DESC
) AS T;

-- Approach 3 - DENSE_RANK() (Recommended) | Works when Salary is unique
DECLARE @N1 INT = 3;

;WITH SalaryRanked AS
(
    SELECT Salary,
           DENSE_RANK() OVER(ORDER BY Salary DESC) AS SalaryRank
    FROM Employee
)
SELECT Salary
FROM SalaryRanked
WHERE SalaryRank = @N1;

-- Approach 4 - DISTINCT + DENSE_RANK() | Salary has duplicates
DECLARE @N2 INT = 3;

;WITH SalaryRanked AS
(
    SELECT Salary,
           DENSE_RANK() OVER(ORDER BY Salary DESC) AS SalaryRank
    FROM Employee
)
SELECT DISTINCT Salary
FROM SalaryRanked
WHERE SalaryRank = @N2;

-- Approach 5 - ROW_NUMBER() (Be Careful) | Works when Salary is unique
-- ROW_NUMBER() is generally NOT suitable for Nth highest salary questions.
DECLARE @N3 INT = 3;

;WITH SalaryRanked AS
(
    SELECT Salary,
           ROW_NUMBER() OVER(ORDER BY Salary DESC) AS SalaryRank
    FROM Employee
)
SELECT Salary
FROM SalaryRanked
WHERE SalaryRank = @N3;

-- Approach 6 - RANK() | There is no Rank = 3.
DECLARE @N4 INT = 3;

;WITH SalaryRanked AS
(
    SELECT Salary,
           RANK() OVER(ORDER BY Salary DESC) AS SalaryRank
    FROM Employee
)
SELECT Salary
FROM SalaryRanked
WHERE SalaryRank = @N4;

-- Approach 7 - Correlated Subquery (Generic Nth Highest)
-- For 3rd highest salary: Exactly 2 distinct salaries must be greater than it.
DECLARE @N5 INT = 3;

SELECT DISTINCT E1.Salary
FROM Employee E1
WHERE
(
    SELECT COUNT(DISTINCT E2.Salary)
    FROM Employee E2
    WHERE E2.Salary > E1.Salary
) = @N5 - 1;

-- Approach 8 - OFFSET + FETCH (Generic Nth Highest)
-- This approach is simple and works well for small datasets and unique salaries.
SELECT Salary
FROM Employee
ORDER BY Salary DESC
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY;

-- Approach 9 - Using Subquery
Select Max(Salary) from Employee Where Salary < (Select Max(Salary) from Employee Where Salary < (Select Max(Salary) from Employee));
