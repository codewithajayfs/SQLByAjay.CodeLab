-- SQL Interview Questions

-- Department
CREATE TABLE Department (
    Id            INT PRIMARY KEY,
    Name          VARCHAR(100) NOT NULL,
    Status        VARCHAR(20) DEFAULT 'Active',
);

-- Employee
CREATE TABLE Employee (
    Id            INT PRIMARY KEY,
    Name          VARCHAR(100) NOT NULL,
    Email         VARCHAR(100) UNIQUE,
    Age           INT CHECK (Age >= 18),
    DepartmentId  INT,
    Status        VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (DepartmentId) REFERENCES Department(Id)
);

Select * From dbo.Department;
Select * From dbo.Employee;

CREATE TABLE Customer (
    Id            INT Identity(1,1),
    Name          VARCHAR(100) NOT NULL,
    Email         VARCHAR(100) UNIQUE,
    Age           INT CHECK (Age >= 18),
    Status        VARCHAR(20) DEFAULT 'Active'
);

-- Add Primary Key to Customer table
Alter Table Customer
Add Constraint PK_Customer_Id Primary Key (Id);

-- Add Unique Constraint to Customer Email
Alter Table Customer
Add Constraint UQ_Customer_Email Unique (Email);

-- Add Check Constraint to Customer Age
Alter Table Customer
Add Constraint CK_Customer_Age Check (Age >= 18);

-- Add Default Constraint to Customer Status
Alter Table Customer
Add Constraint DF_Customer_Status Default 'Active' For Status;

-- Drop Constraint from Customer table
--Alter Table Customer
--Drop Constraint CK__Customer__Age__02084FDA;

--Alter Table Customer
--Drop Constraint DF__Customer__Status__02FC7413;

--Alter Table Customer
--Drop Constraint UQ__Customer__A9D10534A5973258;

-- Add Column
Alter Table Department
Add IsActive bit Constraint DF_Department_IsActive Default (1)

Alter Table Department
Add CreatedBy Int Constraint FK_Department_CreatedBy_Employee_Id Foreign Key (CreatedBy) References Employee (Id)

Alter Table Department
Add CreatedOn DateTime Constraint DF_Department_CreatedOn Default GetDate()

Alter Table Department
Add UpdatedBy Int Constraint FK_Department_UpdatedBy_Employee_Id Foreign Key (UpdatedBy) References Employee (Id)

Alter Table Department
Add UpdatedOn DateTime


Alter Table Employee
Add IsActive bit Constraint DF_Employee_IsActive Default (1)

Alter Table Employee
Add CreatedBy Int Constraint FK_Employee_CreatedBy_Employee_Id Foreign Key (CreatedBy) References Employee (Id)

Alter Table Employee
Add CreatedOn DateTime Constraint DF_Employee_CreatedOn Default GetDate()

Alter Table Employee
Add UpdatedBy Int Constraint FK_Employee_UpdatedBy_Employee_Id Foreign Key (UpdatedBy) References Employee (Id)

Alter Table Employee
Add UpdatedOn DateTime