Use EmployeeDB;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);


SELECT * FROM Employee;



-- Insert into Employee (FirstName, LastName, Email, HireDate, Salary)
-- Values ('John', 'Doe', 'john.doe@example.com', '2020-01-15', 50000.00),
--        ('Jane', 'Smith', 'jane.smith@example.com', '2020-02-20', 55000.00),
--        ('Michael', 'Johnson', 'michael.johnson@example.com', '2020-03-25', 60000.00),
--        ('Emily', 'Davis', 'emily.davis@example.com', '2020-04-30', 65000.00),
--        ('William', 'Brown', 'william.brown@example.com', '2020-05-05', 70000.00),
--        ('Olivia', 'Wilson', 'olivia.wilson@example.com', '2020-06-10', 75000.00),
--        ('James', 'Taylor', 'james.taylor@example.com', '2020-07-15', 80000.00),
--        ('Sophia', 'Anderson', 'sophia.anderson@example.com', '2020-08-20', 85000.00),
--        ('Benjamin', 'Thomas', 'benjamin.thomas@example.com', '2020-09-25', 90000.00),
--        ('Ava', 'Jackson', 'ava.jackson@example.com', '2020-10-30', 95000.00),
--        ('Ethan', 'White', 'ethan.white@example.com', '2020-11-05', 85000.00),
--        ('Mia', 'Harris', 'mia.harris@example.com', '2020-12-10', 90000.00);


-- Insert into Employee (FirstName, LastName, Email, HireDate, Salary)
-- Values ('Mia', 'Harris', 'mia.harris@example.com', '2020-12-10', 90000.00)