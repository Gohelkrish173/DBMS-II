--1)
--select person.*,Department.deptname,Department.deptcode from person inner join Department on person.deptid=Department.deptid

--2)
--select person.personname from person inner join Department on person.deptid=Department.deptid where Department.location = 'c-block'

--3)
--select person.personname,person.salary,Department.deptname from person inner join Department on person.deptid=Department.deptid where person.city='jamnagar'

--4)
select person.personname,
	person.salary,
	department.deptname 
from person inner join 
Department 
on person.deptid=Department.deptid 
where person.city<>'rajkot'

--5)
--select person.*,Department.* from person inner join Department on person.deptid=Department.deptid where department.deptname = 'computer'

--6)
select * from person
where deptid is null