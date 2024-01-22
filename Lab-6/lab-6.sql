--1)
create trigger t1
on person
after insert,update,delete
as
begin
	 Print('record is affected');
end

delete person

--2)
create trigger t2
on person
for insert,update,delete
as
begin
	declare @personid		int,
		@personname			varchar(100),
		@operation			varchar(100),
		@updateDate			datetime

		if exists (select * from deleted)
		begin
		select @personid=personid,
			@personname=personname
			from deleted

			set @operation='deleted'
			set @updatedate=getdate()

			end

			else
			begin
			select @personid=personid,
					@personname=personname
					from inserted

					set @operation = 'inserteed/updated'
					set	@updatedate=	getdate()

						end

insert into personlog(Personid,personname,operation,updatedate)
values(@personid,@personname,@operation,@updateDate)

end

insert into person values(101,'krish',25000,'2023-03-17','rajkot',19,'2005-03-17')

select * from personLog

--3)
create trigger t3
on person
instead of insert,update,delete
as
begin
	declare @personid	INT,
			@personname	varchar(100),
			@operation	varchar(100),
			@updatedate	datetime

if exists (select * from deleted)
begin
select @personid=personid,
	@personname=personname
	from deleted

		set @operation='deleted'
		set @updatedate=getdate()

		end
	
	else
	begin
	select @personid=personid,
			@personname=personname
			from inserted

			set @operation='inseted/updated'
			set @updatedate=getdate()
	end
insert into PersonLog(personid,personname,operation,updatedate)
values(@personid,@personname,@operation,@updatedate)

end

insert into person values(108,'krish',100000,'2023-03-17','rajkot',19,'2005-03-17')

--4)
create trigger t4
on person
after insert
as
begin
	sp_rename 'person.PersonName','PERSONNAME'
end

insert into person values(109,'krish',50000,getdate(),'rajkot',19,'2005-03-17')

--5)
create trigger t5
on person
instead of insert
as
begin
	declare @age	int
	set @age=datediff(year,getdate(),Birthdate)

	update person 
	set person.Age=@age
	select * from person
end
