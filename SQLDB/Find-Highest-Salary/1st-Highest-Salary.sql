Select TOP 10 * from Employee Order By Salary DESC;

SELECT * 
FROM Employee
ORDER BY EmployeeID
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY;

-- Maximum Salary | 1st Highest Salary
Select Max(Salary) from Employee;

Select Salary From Employee 
Order By Salary DESC
Offset 0 Rows 
FETCH NEXT 1 ROWS ONLY;