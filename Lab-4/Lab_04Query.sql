--1. Write a function to print "hello world".
create function fn_Hello()
returns varchar(50)
as
begin
	declare @str as varchar(50)
	set @str = 'Hello world' 
	return @str 
end

select dbo.fn_Hello()

--2. Write a function which returns addition of two numbers.
create function fn_add(
	@a int,
	@b int 
)
returns int 
as 
begin
	Declare @c as int
	set @c=(@a+@b)
	--Declare @a as int
	--set @b=5
	--c=a+b
	return @c
end
select dbo.fn_add(5,10)
--3. Write a function to print cube of given number.
create function fn_cube(
	@a int
)
returns int 
as 
begin
	Declare @c as int
	set @c=@a*@a*@a
	
	return @c
end
select dbo.fn_cube(5)
--4. Write a function to check where given number is ODD or EVEN.
create function fn_oddeven(
	@a int
)
returns varchar(50) 
as 
begin
	Declare @c as varchar(50)
	if @a%2=0
		set @c ='even'
	else
		set @c = 'odd'

	return @c
end
select dbo.fn_oddeven(5)

--5. Write a function to compare two integers and returns the comparison result. (Using Case statement)
create function fn_comparison(
	@a int,
	@b int 
)
returns varchar(50) 
as 
begin
	--Declare @c as int
	
	return (
	case
		when @a>@b then ' A is greater then b'
		when @a<@b then ' A is less then b'
		else 'both are equl'
	end
	)
end
select dbo.fn_comparison(5,10)

--6. Write a function to print number from 1 to N. (Using while loop)
create function fn_printnumber(
	@a int
)
returns varchar(50) 
AS 
begin
	declare @b as int
	set @b = 1
	declare @ans as varchar(1000)
	set @ans =0
		while (@b<=@a)
			begin
				set @ans =@ans+@b+' '
				set	@b=@b+1
			end
	return @ans
end 
select dbo.fn_printnumber(10)

--7. Write a function to print sum of even numbers between 1 to 20.
create function fn_sum()
returns varchar(1000)
as
begin 
	declare @ans as varchar(100)
	declare @a as int
	declare @b as int
	set @ans =0
	set @a=1
	set @b=20

	while (@a<=20)
		begin 
			set @ans =@ans +@a
			set @a =@a+1
		end
	return @ans
end
select dbo.fn_sum()


--8. Write a function to check weather given number is prime or not.
create function fn_prime(
	@a int
)
returns varchar(50) 
as 
begin
	declare @str as varchar(100)
	declare @count as int 
	set @count=0
	declare @i as int 
	set @i = 1
	while (@i<=@a)
		begin 
			if (@a%@i=0)
				set @count=@count+1
			
			set @i=@i+1
		end 
	if @count=2
		set @str ='prime'
	else 
		set @str = 'not prime'
	
	
	return @str
end
select dbo.fn_prime(20)
--9. Write a function which accepts two parameters start date & end date, and returns a difference in days.
alter function fn_datediff(
	@date1 datetime,
	@date2 datetime
)
returns int
as
begin
	declare @diff as int
	set @diff = datediff(day,@date2,@date1)
	
	return @diff 
end
select dbo.fn_datediff('2023-06-01','2023-01-27')
--10. Write a function which accepts year & month in integer and returns total days in given month & year.
create function fn_TotalDay(
	@month int,
	@year int
)
returns datetime 
as 
begin 
	declare @day as datetime
	set @day =(@year,@month,1)
end 
select dbo.TotalDay(2023,05)
--Table valued functions (Use tables of lab-2)
--11. Write a function which returns a table with detail of person whose first name starts with B.

--12. Write a function which returns a table with unique first names from person table.
--13. Write a function which accepts department ID as a parameter & returns a detail of the persons.