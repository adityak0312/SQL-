-- Creating a new table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Altering the table to add a new column
ALTER TABLE Employees
ADD DateOfJoining DATE;

-- Dropping the table (be careful, as this will delete all data)
-- DROP TABLE Employees;

-- Inserting data into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, DateOfJoining)
VALUES 
(1, 'John', 'Doe', 'HR', 50000.00, '2023-01-15'),
(2, 'Jane', 'Smith', 'Finance', 60000.00, '2023-02-20');

-- Updating an employee's salary
UPDATE Employees
SET Salary = 65000.00
WHERE EmployeeID = 2;

-- Deleting an employee record
DELETE FROM Employees
WHERE EmployeeID = 1;

-- Selecting all data from the Employees table
SELECT * FROM Employees;

-- Granting SELECT privilege on the Employees table to a user
GRANT SELECT ON Employees TO 'username';

-- Revoking SELECT privilege from a user
REVOKE SELECT ON Employees FROM 'username';

-- Starting a new transaction
BEGIN TRANSACTION;

-- Inserting a new employee
INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, DateOfJoining)
VALUES (3, 'Alice', 'Johnson', 'IT', 70000.00, '2023-03-10');

-- Setting a savepoint
SAVEPOINT BeforeDelete;

-- Deleting an employee
DELETE FROM Employees
WHERE EmployeeID = 2;

-- Rolling back to the savepoint (undoes the delete)
ROLLBACK TO BeforeDelete;

-- Committing the transaction (saves the insertion of Alice)
COMMIT;
