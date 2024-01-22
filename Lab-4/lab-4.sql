--1)print hello world
create function hello()
returns varchar(100)
as
begin
	declare @str as varchar(50)
	set @str='hello world'
	return @str
end
select dbo.hello()

--2)Write a function which returns addition of two numbers.
create function addision(@n1 int,@n2 int)
returns int
as
begin
	declare @c int
	set @c=(@n1+@n2)
	return @c
end
select dbo.addision(2,5)

--3)Write a function to print cube of given number.
create function cubic(@n decimal(8,4))
returns decimal(8,4)
as
begin
	declare @ans decimal(8,4)
	set @ans=(@n*@n*@n)
	return @ans
end
select dbo.cubic(4)

--4)Write a function to check where given number is ODD or EVEN.
create function oddeven(@n int)
returns varchar(100)
as
begin
	declare @c as varchar(50)
	if @n%2=0
		set @c='even'
	else
		set @c='odd'
return @c
end
select dbo.oddeven(7)

--5)Write a function to compare two integers and returns the comparison result. (Using Case statement)
create function compare(@a int,@b int)
returns varchar(100)
as
begin
return(
	case
		when @a>@b then 'A is Greater than B.'
		when @a<@b then 'B is Greater than B.'
		else 'both are equals.'  
	end)
end
select dbo.compare(10,20)

--6)Write a function to print number from 1 to N. (Using while loop)
create function x(@n int)
	returns varchar(1000)
	as
	begin
	declare @b as int
	set	@b=1
	declare @ans as varchar(1000)
	while(@b<=@n)
			begin
			set @ans=(@ans+@b+'')
			set @b=@b+1
		end
	return @ans
end
select dbo.x(100)

--7)Write a function to print sum of even numbers between 1 to 20.
create function sumofeven()
	returns decimal(8,4)
	as begin
	declare @n decimal(8,4)
	set @n=0
	declare @sum decimal(8,4)
	set @sum=0
	while(@n<=20)
		begin
		if @n%2=0
			set @sum=@sum+@n
			set @n=@n+1
		end
	return @sum
end
select dbo.sumofeven()

--8)Write a function to check weather given number is prime or not.
create function primeornot(@n int)
	returns varchar(100)
as
begin
	declare @i int
	set @i=2
	declare @flag int
	set @flag=0
	while(@i<(@n))
		begin
		if @n%@i=0
			set @flag=1
		set @i=(@i+1)
	end
return(
		case
		when @flag=0 then 'given number is prime.'
		when @flag!=0 then 'given number is non-prime.' 
		end
		)
end	
select dbo.primeornot(10)

--9)Write a function which accepts two parameters start date & end date, and returns a difference in days
create function diffdate(@sd datetime,@ed datetime)
returns int
as
begin
	declare @diff int 
	set @diff=datediff(year,@ed,@sd)
return @diff
end
select dbo.diffdate(getdate(),'2005-03-17')

--10)Write a function which accepts year & month in integer and returns total days in given month & year.
create function days(@y int,@m int)
returns int
as
begin
	declare @y1 int
	set @y1=datediff(day,@y+1,@y)
	declare @m1 datetime
	set @m1=Eomonth(@m)
	return (@y1+@m1)
end


--11)Write a function which returns a table with detail of person whose first name starts with B.
create function person_Detail()
returns table
as
return(
	select * from Person
	where FirstName like 'B%'
	)

select * from person_Detail()

--12)Write a function which returns a table with unique first names from person table.
create function unique_person()
returns table
as
return(select distinct * from Person
		)

select * from unique_person()

--13)Write a function which accepts department ID as a parameter & returns a detail of the persons.
create function person_detail_1
(
@deptId int
)
returns table
as
return(select * from Person
		where DepartmentID=@deptid)

select * from person_detail_1(2)