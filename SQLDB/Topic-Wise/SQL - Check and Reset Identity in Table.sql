/*
To check the current identity value of a table in SQL Server, use the 
-- DBCC CHECKIDENT command or the 
-- IDENT_CURRENT function.

1. Check Current and Max Value (DBCC CHECKIDENT)
Syntax: DBCC CHECKIDENT ('YourTableName', NORESEED);

2. Get Value as a Query Result (IDENT_CURRENT)
SELECT IDENT_CURRENT('YourTableName') AS CurrentIdentity;

3. Check the Last Inserted Identity (Same Session)
SELECT SCOPE_IDENTITY(); – Recommended. Returns the last identity value created in the current session and current scope (prevents issues with triggers generating a different ID on another table).

SELECT @@IDENTITY; – Returns the last identity value created in the current session regardless of scope.

4. Check Seed and Increment Settings
SELECT 
    IDENT_SEED('YourTableName') AS SeedValue,
    IDENT_INCR('YourTableName') AS IncrementValue;

--------------------------------------------------------------
To reset or change the identity value of a table in SQL Server, use the DBCC CHECKIDENT command with the RESEED argument.

1. Reset to a Specific New Value
-- The next inserted row will have an ID of 101
DBCC CHECKIDENT ('YourTableName', RESEED, 100);

2. Reset After Deleting All Rows (TRUNCATE)
TRUNCATE TABLE YourTableName;

3. Automatically Correct Out-of-Sync Values
-- Automatically fixes the identity to max value + 1
DBCC CHECKIDENT ('YourTableName', RESEED);

*/


-- Chcek currect identity value for Employee table
SELECT IDENT_CURRENT('Employee') AS CurrentIdentity;

-- Reset the identity seed for Employee table
DBCC CHECKIDENT ('Employee', RESEED, 0)
