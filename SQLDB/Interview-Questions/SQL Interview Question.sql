-- Q1 - Clone Table Without Data
Select * Into Employees_Copy From Employees
Where 1=0;

-- Q2 - Clone table with data
Select * Into Employee_Copy_1 From Employees;

-- Q3- Find duplicates in the given table
Select EmpID, Count(*) As EmpCount
From Employee_Copy_1
Group By EmpID;

-- Q4 - How to delete duplicate records
-- Insert Into Employee_Copy_1 
--	Values (2, 'Anita Reddy', 2, 1, 180000.00, '2016-03-15', 1),
--	       (3, 'Suresh Kumar', 1, 1, 185000.00, '2016-03-15', 1),
--	       (6, 'Deepa Menon', 2, 1, 180000.00, '2016-03-15', 1)

;With CTE_DuplicateEmployee
As
( Select EmpID, ROW_NUMBER() Over (Partition By EmpID Order By EmpId) RowNumber
From Employee_Copy_1
)
-- Delete From CTE_DuplicateEmployee Where RowNumber > 1;
--Select * From CTE_DuplicateEmployee Where RowNumber > 1

Select * From Employee_Copy_1;

-- Q5 - Difference Between Union and Union All
Select ManagerID From Employees
Union
Select ManagerID From Employee_Copy_1

Select ManagerID From Employees
Union All
Select ManagerID From Employee_Copy_1

-- Q6 - Difference between Rank, Row_Number, and Dense_Rank

Select DeptID, Rank() Over (Partition By DeptID Order By DeptID) As ranks From Employees;

Select DeptID, Dense_Rank() Over (Partition By DeptID Order By DeptID) As ranks From Employees;

Select DeptID, Row_Number() Over (Partition By DeptID Order By DeptID) As ranks From Employees;

-- Q7 - Employee who is not present in department table
 --Insert Into Employee_Copy_1 
	--Values (13, 'Anita Rani',    6, 1, 180000.00, '2016-03-15', 1),
	--       (14, 'Suresh Kumari', 7, 2, 185000.00, '2016-03-15', 1),
	--       (15, 'Deepa Varte',   8, 4, 180000.00, '2016-03-15', 1)

Select * From Employee_Copy_1 Order By EmpID
Select * From Departments
-- Using Subquery
Select EmpID, EmpName, DeptID
From Employee_Copy_1
Where DeptID Not In (Select DeptID From Departments);

-- Using Left Join
Select E.*, D.DeptID, D.DeptName
From Employee_Copy_1 E
Left Join Departments D on E.DeptID=D.DeptID
Where D.DeptID Is Null

-- Q8 - Find Second Highest Salary in Each Department --Insert Into Employee_Copy_1 
	--Insert Into Employee_Copy_1 
	--Values (20, 'Anita Rani',    1, 1, 185000.00, '2016-03-15', 1),
	--       (21, 'Suresh Kumari', 2, 2, 120000.00, '2016-03-15', 1),
	--       (22, 'Deepa Varte',   3, 3,  95000.00, '2016-03-15', 1),
	--       (23, 'Ajay Varte',    4, 4, 105000.00, '2016-03-15', 1)
	
Select * From Employee_Copy_1 Order By EmpID
Select DeptID, Salary, RANK() Over(Partition By DeptID Order By Salary DESC) SalaryRank
From Employee_Copy_1

Select * From 
(
Select E.*, DENSE_RANK() Over(Partition By DeptID Order By Salary DESC) SalaryRank
From Employee_Copy_1 E
) A
Where SalaryRank = 2

-- Q9 - Find all the transation done by "Vikram Joshi"
Select * From Employee_Copy_1
Select * From Orders
Select * From Orders Where EmpID in (Select EmpID From Employees Where Upper(EmpName) = 'Vikram Joshi')

-- Q10 - Self Join, Manager Salary > Emp Salary

Select * From Employee_Copy_1
Select E.EmpID, E.EmpName, M.EmpID As ManagerId, M.EmpName As ManagerName
From Employee_Copy_1 E
Join Employee_Copy_1 M On M.EmpID=E.ManagerId

Select E.*, M.EmpID As ManagerId, M.EmpName As ManagerName
From Employee_Copy_1 E
Left Join Employee_Copy_1 M on M.EmpID=E.ManagerID
--Where E.EmpID=2
Order By E.EmpID

-- Q11 - Left / Right / Inner Join
Select E.EmpID, E.EmpName, E.DeptID, D.DeptID, D.DeptName From Employee_Copy_1 E
Left Join Departments D on D.DeptID=E.DeptID
Order By E.EmpID

Select E.EmpID, E.EmpName, E.DeptID, D.DeptID, D.DeptName From Employee_Copy_1 E
Right Join Departments D on D.DeptID=E.DeptID
Order By E.EmpID

Select E.EmpID, E.EmpName, E.DeptID, D.DeptID, D.DeptName From Employee_Copy_1 E
Join Departments D on D.DeptID=E.DeptID
Order By E.EmpID

-- Q12 - Update query to swap gender
Select * From Employee_Copy_1 Order By EmpID
--Update Employee_Copy_1
--Set Gender = (Case When Gender='Male' Then 'Female' When Gender='Female' Then 'Male' End);