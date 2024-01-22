--7)
select personname from person
left outer join Department on person.deptid=Department.deptid
where Department.deptname = 'civil' and joiningdate > '2001-08-01'

--8)
select person.personname,Department.deptname from person
inner join Department on person.deptid=Department.deptid
where (getdate()-person.joiningdate)>365

--9)
select department.deptname,count(person.personname) from person
inner join Department on person.deptid=Department.deptid
group by Department.deptname

--10)
select Department.deptname,max(person.salary) maximum,min(person.salary) minimum from person
inner join Department on person.deptid = Department.deptid
group by department.deptname

--11)
select person.city,max(person.salary) maximum,sum(person.salary) total,min(person.salary) minimum,AVG(person.salary) average from person
inner join Department on person.deptid = Department.deptid
group by person.city

--12)
select Department.deptname,sum(person.salary) from person
inner join Department on person.deptid=Department.deptid
group by Department.deptname
having sum(person.salary)>100000

--13
select person.city,avg(person.salary) from person
inner join Department on person.deptid=Department.deptid
group by person.city
having person.city = 'ahmedabad'

--14)
select Department.deptname,count(person.personname) from person
inner join Department on person.deptid=Department.deptid
group by Department.deptname
having count(person.personname) is null

--15)
select Department.deptname,count(person.personname) from person
inner join Department on person.deptid=Department.deptid
group by Department.deptname
having count(person.personname) > 2

--16)
select person.personname +' lives in ' +person.city+' and works in '+Department.deptname +' monthly.' from person
inner join Department on person.deptid = Department.deptid

--17)
select person.personname +' earns '+cast(person.salary as varchar)+' from department '+Department.deptname+' monthly.' from person
inner join Department on person.deptid=Department.deptid

select person.personname +' earns '+convert(varchar,person.salary)+' from department '+Department.deptname+' monthly.' sentances from person
inner join Department on person.deptid=Department.deptid

--18)
select person.city,Department.deptname,sum(person.salary),avg(person.salary),max(person.salary) from person
inner join Department on person.deptid=Department.deptid
group by person.city,Department.deptname

--19)
update person set person.salary=person.salary+(person.salary*10/100)
from person inner join Department on person.deptid=Department.deptid
where Department.deptname = 'computer'