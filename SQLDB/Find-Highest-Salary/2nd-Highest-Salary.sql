-- 2nd Highest Salary

Select Max(Salary) from Employee Where Salary < (Select Max(Salary) from Employee);

Select Salary From Employee 
Order By Salary DESC
Offset 1 Rows 
FETCH NEXT 1 ROWS ONLY;