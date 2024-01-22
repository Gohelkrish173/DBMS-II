--1)All tables Insert
create procedure tabel_insert
@firstname	varchar(100),
@lastname		varchar(100),
@salary		decimal(8,2),
@joiningDate	datetime,
@designationid int,
@departmentId	int
as
begin
	insert into [dbo].[person](
	[firstname],
	[lastname],
	[salary],
	[joiningdate],
	[departmentId],
	[designationid])
	values
	( @firstname ,@lastname, @salary, @joiningdate, @designationId,@departmentId) 
end

exec tabel_insert 'shyam','gohel',500000,'2022/11/28',1,11

--1.2)
create procedure tabel_insert_1
@departmentname	varchar(100)
as
begin
	insert into [dbo].[Department](
	[departmentname] 
	)
	values(@departmentname) 
end

exec tabel_insert_1 'KG'

--1.3)
create proc table_insert_2
@designationName varchar(100)
as
begin
	insert into dbo.designation(
	designationname)
	values(@designationName)
end

exec table_insert_2 'Trusty'

--2)
alter proc table_update
@workerid		int,
@firstname		varchar(100),
@lastname		varchar(100),
@salary			decimal(8,2),
@joiningdate	datetime,
@designationid	int,
@departmentid	int

as
begin
	update person set
	firstname=@firstname,
	lastname=@lastname,
	salary=@salary,
	joiningdate=@joiningdate,
	designationid=@designationid,
	departmentid=@departmentId
	where Workerid=@Workerid
end

exec table_update 110,'shyam','gohel',1000,'2023-11-28',1,11

--2.1)
create proc SP_table_update_1
@departmentId	int,
@departmentName varchar(100)
as
begin
	update department set
	departmentname=@departmentName
	where departmentId=@DepartmentId
end
select * from department
exec SP_table_update_1 2,'worker'

--2.2)
create proc SP_table_update_2
@designationId int,
@designationName varchar(100)
as
begin
	update Designation set
	designationName=@designationName
	where designationId=@designationId
end
select * from Designation
exec SP_table_update_2 16,'peayun'

--3)
create proc SP_table_delete
as
begin
	delete person
end

exec SP_table_delete

--3.1)
create proc SP_table_delete_1
as
begin
	delete Department
end

exec SP_table_delete

--3.2)
create proc SP_table_delete_2
as
begin
	delete designation
end

exec SP_table_delete

--4)
create proc SP_Table_primarykey
as
begin
	select name,SCHEMA_NAME(schema_id),OBJECT_NAME(parent_object_id) 'person'
	from SYS.objects where type_desc='Primary_key_constraint'
end

exec SP_table_primarykey

--5)
create proc SP_Table_SelectALL
as
begin
	select person.*,designation.DesignationName,department.departmentname from person
	left outer join department on department.departmentid=person.departmentid
	left outer join designation on designation.designationid=person.designationid
end

exec SP_Table_SelectALL
