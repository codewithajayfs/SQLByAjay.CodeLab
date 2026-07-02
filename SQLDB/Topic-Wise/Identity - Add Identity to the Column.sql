-- Add Identity column to the existing Department table
-- Solution 1: Safe T-SQL Scripting (Best for Automation)
    -- Approach 1- If your table is empty or you want to generate brand new IDs:
    -- 1. Add a temporary new column with the IDENTITY property
    ALTER TABLE dbo.Department 
    ADD New_Id INT IDENTITY(1,1);
    GO

    -- 2. Drop the old ID column
    ALTER TABLE dbo.Department 
    DROP COLUMN Id;
    GO

    -- 3. Rename the new column to 'Id'
    EXEC sp_rename 'dbo.Department.New_Id', 'Id', 'COLUMN';
    GO


    -- Approach 2- If you need to preserve existing ID values:
    -- 1. Create a brand new table with the exact same structure + IDENTITY property
    CREATE TABLE dbo.Department_New (
        Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        DepartmentName VARCHAR(100) NOT NULL -- Include your other columns here
    );
    GO

    -- 2. Allow manual inserting of values into the IDENTITY column temporarily
    SET IDENTITY_INSERT dbo.Department_New ON;

    -- 3. Copy all data from the old table to the new table
    INSERT INTO dbo.Department_New (Id, DepartmentName)
    SELECT Id, DepartmentName FROM dbo.Department;

    -- 4. Turn off explicit identity inserting
    SET IDENTITY_INSERT dbo.Department_New OFF;
    GO

    -- 5. Delete the old table and rename the new one
    DROP TABLE dbo.Department;
    GO
    EXEC sp_rename 'dbo.Department_New', 'Department';
    GO

/*
-- Solution 2: SQL Server Management Studio (SSMS) GUI
  If you prefer not to write heavy migration scripts, the SSMS visual designer can manage this process automatically behind the scenes.
  Open Tools > Options.
  Go to Designers > Table and Database Designers.
  Uncheck "Prevent saving changes that require table re-creation" and click OK.
  Right-click your table in Object Explorer and select Design.
  Click on your Id column.
  In the Column Properties window at the bottom, expand Identity Specification.
  Change (Is Identity) from No to Yes.
  Press Ctrl + S to save.
 
 */

/*
-- Solution 3: The SEQUENCE Alternative (No Table Rebuild Required)If recreating the table or dropping the column is not an option (due to heavy dependencies or large data size), you can use a SEQUENCE object as a workaround. This dynamically generates auto-incrementing numbers without using the formal IDENTITY property.
*/
-- 1. Create a sequence object
CREATE SEQUENCE dbo.Seq_DeptId
    START WITH 1 -- Change this to your MAX(Id) + 1 if you have data
    INCREMENT BY 1;
GO

-- 2. Bind the sequence to the column as a default constraint
ALTER TABLE dbo.Department 
ADD CONSTRAINT DF_Department_Id 
DEFAULT (NEXT VALUE FOR dbo.Seq_DeptId) FOR Id;
GO
