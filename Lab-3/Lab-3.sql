--1)Create Procedure that show detail of first 3 persons.
create proc SP_Table_Topperson
as
begin
select Top(3) firstname,lastname from Person
end

exec SP_Table_Topperson

--2)Create Procedure that takes department dame as input and returns a table with all workers working in that department.
create proc SP_Table_Workername(
@departmentName varchar(100)
)
as
begin
	select firstname,lastname,department.DepartmentName from person
	inner join Department on department.DepartmentID=person.DepartmentID
	where Department.DepartmentName=@departmentname
end

exec SP_Table_Workername 'HR'

--3)Create Procedure that takes department name & designation name as input and returns a table with worker’s first name, salary, joining date & department name.
create proc SP_Table_personname(
@departmentname  varchar(100),
@designationname varchar(100)
)
as
begin
	select firstname,salary,joiningdate,department.DepartmentName from person
	left outer join Department on department.departmentid=person.DepartmentID
	left outer join Designation on Designation.DesignationID=person.DesignationID
where department.departmentname=@departmentname
and designation.DesignationName=@designationname
end

exec SP_Table_personname 'hr','ceo'

--4)Create Procedure that takes first name as an input parameter and display all the details of the worker with their department & designation name.
create proc SP_Table_GiveFirstName(
@firstname varchar(100)
)
as
begin
	select person.*,Designation.DesignationName,Department.DepartmentName from person
	left outer join Department on Department.DepartmentID=Person.DepartmentID
	left outer join designation on Designation.DesignationID=person.DesignationID
where firstname=@firstname
end

exec SP_Table_GiveFirstName 'neha'

--5)Create Procedure which displays department wise maximum, minimum & total salaries.
create proc SP_Table_Salary
as
begin
	select department.DepartmentName,max(salary) maxsalary,min(salary) as minsalary,sum(salary) totalsalary from Person
	left outer join Department on Department.DepartmentID=person.DepartmentID
	group by Department.DepartmentName
end

exec SP_Table_Salary

--6)
create proc SP_Table_Salary_1
as
begin
	select Designation.DesignationName,max(salary) maxsalary,min(salary) as minsalary,sum(salary) totalsalary from Person
	left outer join Designation on Designation.Designationid=person.DesignationID
	group by Designation.DesignationName
end

exec SP_Table_salary_1