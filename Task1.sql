/*************************************TASK 1********************************************

--1.Return all columns and rows of the EmployeeTable*/
    SELECT * FROM EmployeeTable

--2.Return all columns of the3 highest paid employees 

	SELECT TOP 3 * FROM EmployeeTable ORDER BY Salary DESC

--3.Return [Firstname] and [Surname] of the person(s) with salary greater than 2000 

    SELECT FirstName,Surname FROM EmployeeTable WHERE Salary>2000 AND (DepartmentId=(SELECT Id FROM DepartmentTable WHERE DeptName='Finance'))

--4.Return [Firstname] and [Surname] of the person(s) in the Finance department 

    SELECT FirstName,Surname FROM EmployeeTable WHERE (DepartmentId=(SELECT Id FROM DepartmentTable WHERE DeptName='Finance'))

--5.Return [Firstname], [Surname] and [Location] of all the employees with first names beginning with “J" 

    SELECT e.Firstname,e.Surname,d.Location 
    FROM EmployeeTable e
    JOIN DepartmentTable d
    ON d.Id=e.DepartmentId
    WHERE e.Firstname LIKE 'J%'

--6.[Firstname], [Surname] and [Salary] of the highest earner

    SELECT TOP 1 Firstname,Surname,Salary from EmployeeTable ORDER By Salary DESC

--7.Return [Firstname], [Surname] and [Salary] of the 2nd highest earner

    SELECT  Firstname,Surname,Salary 
    FROM EmployeeTable ORDER BY Salary DESC
    OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY

--8.Return [Firstname], [Surname] and [Salary] of the 2nd lowest earner

    SELECT  Firstname,Surname,Salary 
    FROM EmployeeTable ORDER BY Salary ASC
    OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY

--9.Return[Firstname], [Surname] and [Salary] of the person with the highest [Salary] in Edinburgh 

    SELECT TOP 1 Firstname,Surname,Salary 
    FROM EmployeeTable 
    WHERE DepartmentId=(SELECT Id FROM DepartmentTable WHERE Location='Edinburgh')
    ORDER BY Salary DESC

--10.Return the [Firstname], [Surname] and [Age] of the person(s) with the two highest salaries using the date ‘2024-06-30’to work out their age.

    SELECT TOP 2 Firstname,Surname,
    DATEDIFF(YEAR,DateOfBirth,'2024-06-30') AS Age
    FROM EmployeeTable 
    ORDER BY Salary DESC

--11.Return the [Firstname], [Surname], [Salary] and [Age] of the person(s) who are older than 30 years using the date ‘2024-06-30’ to work out their age.


    SELECT Firstname,Surname,Salary,
    DATEDIFF(YEAR,DateOfBirth,'2024-06-30') AS Age
    FROM EmployeeTable 
    WHERE DATEDIFF(YEAR,DateOfBirth,'2024-06-30') > 30