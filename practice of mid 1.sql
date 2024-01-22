-------------------------------------------------------------------
create proc SP_Insert_Student
@rno	int,
@name	varchar(100),
@sem	int,
@branch	varchar(50),
@spi	decimal(4,2)

as
begin
	insert into student(rno,name,sem,branch,spi)
	values(@rno,@name,@sem,@branch,@spi)
end

exec SP_Insert_Student 105,'hetvi',3,'cse',9
---------------------------------------------------------------
create proc SP_Update_Student
@rno	int,
@name	varchar(100),
@sem	int,
@branch	varchar(50),
@spi	decimal(4,2)

as
begin
	update Student
	set	
	name=@name,
	sem=@sem,
	branch=@branch,
	spi=@spi
	where rno=@rno
end

exec SP_Update_Student 105,'vanshi',3,'cse',9
----------------------------------------------------------------------
create proc SP_Delete_Student
@rno	int
as
begin
	delete Student
	where rno=@rno
end
	
exec SP_Delete_Student 105
------------------------------------------------------------------
alter proc SP_Maxspi_Student
as
begin
	select name,max(spi) from student
	group by name
	order by max(spi)
end

exec SP_Maxspi_Student

-----------------------------------------------------------------

alter function FN_retrive_Student(
@rno	int
)
returns table
as

	return(
	select * from Student
	where rno=@rno
	)

select * from FN_retrive_Student(101)
--------------------------------------------------------------------
create function FN_TotalSPi_Student()
returns table
as
	return(
	select branch,sum(spi) as  [total] from student
	group by branch
	)

select * from dbo.FN_TotalSPi_Student()

-------------------------------------------------------------------------------

create function add1(@y1 int,@y2	int)
returns int
as
begin
	declare @n1 int
	set @n1=@y1
	declare @n2	int
	set @n2=@y2
	declare @n	int
	set @n=@n1+@n2
	return @n
end

select dbo.add1(5,10)

create trigger TR_selectall_Student
after insert

