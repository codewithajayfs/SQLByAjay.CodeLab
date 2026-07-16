
Select * From Employee

-- Delete From Employee

-- Chcek currect identity value for Employee table
--SELECT IDENT_CURRENT('Employee') AS CurrentIdentity;

-- Reset the identity seed for Employee table
--DBCC CHECKIDENT ('Employee', RESEED, 0)

-- Insert Values to All Columns
Insert Into Employee (   Name,             Email, Age, DepartmentId,   Status, IsActive, CreatedBy, CreatedOn)
Values               ('James', 'james@email.com',  35,            1, 'Active',        1,         1, GETDATE())

Select * From Employee

-- Insert Values to Specific Columns
Insert Into Employee (Name, Email, Age)
Values ('John Doe', 'john@email.com', 30)

-- Insert Multiple Records
Insert Into Employee (   Name,             Email, Age, DepartmentId,   Status, IsActive, CreatedBy, CreatedOn)
Values               ('James Bond', 'james.bond@email.com',  35,            2, 'Active',        1,         1, GETDATE()),
					  ('Mary', 'mary@email.com', 28,            3, 'Active',        1,         1, GETDATE()),
					  ('Robert', 'robert@email.com', 40,            4, 'Inactive',      0,         1, GETDATE()),
					  ('Linda', 'linda@email.com', 32,            5, 'Active',        1,         1, GETDATE())

-- Insert Records From Another Table
-- If there is less constaints on the table
INSERT INTO Employees_Copy(EmpId, EmpName)
  SELECT Id, Name FROM Employee

-- Create new table with the same structure as Employee table
Select * Into Employee_Copy From Employee Where 1=0
SELECT * FROM Employee_Copy


-- Create new table with the same structure as Employee table
Select * Into Employee_Copy_WithData From Employee Where 1=1
SELECT * FROM Employee_Copy_WithData


Select * Into Employee_Copy_WithData_1 From Employee