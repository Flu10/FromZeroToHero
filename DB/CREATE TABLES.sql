

CREATE SCHEMA HR
GO




CREATE TABLE [HR].[Location]
    ( LocationId    INT PRIMARY KEY IDENTITY (1,1)
    , StreetAddress NVARCHAR(40)
    , PostalCode    NVARCHAR(12)
    , City          NVARCHAR(30) NOT NULL
    , StateProvince NVARCHAR(25)
    )
GO

CREATE TABLE HR.Department
    ( DepartmentId     INT PRIMARY KEY IDENTITY (1,1)
    , DepartmentName   NVARCHAR(30) NOT NULL
    , LocationId       INT
	, CONSTRAINT [FK_Department_Location] FOREIGN KEY ([LocationId]) REFERENCES [HR].[Location] ([LocationId]))
GO

CREATE TABLE HR.Job
    ( JobId         INT PRIMARY KEY IDENTITY (1,1)
    , JobTitle      NVARCHAR(35) NOT NULL
    , MinSalary     int
    , MaxSalary     int
    )
GO

CREATE TABLE HR.Employee
    ( EmployeeId     INT PRIMARY KEY IDENTITY (1,1)
    , FirstName      NVARCHAR(20)
    , LastName       NVARCHAR(25) NOT NULL
    , Email          NVARCHAR(25) NOT NULL
    , PhoneNumber    NVARCHAR(20)
    , HireDate       DATE NOT NULL
    , JobId          INT NOT NULL 
    , Salary         DECIMAL(8,2)
    , CommissionPct  DECIMAL(2,2)
    , ManagerId      INT 
    , DepartmentId   INT
    , CONSTRAINT     EmpSalaryMin
                     CHECK (Salary > 0)
    , CONSTRAINT     EmpEmailUK
                     UNIQUE (Email)
	,CONSTRAINT [FK_Employee_Job] FOREIGN KEY ([JobId]) REFERENCES [HR].[Job] ([JobId])
	,CONSTRAINT [FK_Employee_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [HR].[Employee] ([EmployeeId])
	,CONSTRAINT [FK_Employee_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [HR].[Department] ([DepartmentId])
    )
GO