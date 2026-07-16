
Select * From Department
Select * From Departments

-- Delete From Department

-- Chcek currect identity value for Employee table
-- SELECT IDENT_CURRENT('Department') AS CurrentIdentity;

-- Reset the identity seed for Employee table
-- DBCC CHECKIDENT ('Department', RESEED, 0)

Insert Into Department (Name, CreatedBy)
Values('Human Resources', 1),
	   ('Finance', 1),
	   ('IT', 1),
	   ('Marketing', 1),
	   ('Sales', 1)