--1)
declare @a	int,
		@b	int,
		@c	varchar(250)

		select @a=1,
				@b=0

		begin try
			select	@c = (@a/@b)
		end try
		begin catch
			print ('error occur that is divide by zero')
		end catch

--2)
declare @d	int,
		@e	varchar(250)

		select @d = 10,
				@e = 'ten'
		begin try
			select @d=@e
		end try

		begin catch
			print('error occur that is type converting ')
		end catch

--3)
alter proc PR_Error_Stringtonumber

as
begin
 declare @f	int,
 @g	int,
 @h int 

	
	begin try
	select @f=10,@g='ten';
		set @h=@f+@h;
		print @h;
	end try
	begin catch
		select
			ERROR_LINE() as Errorline,
			ERROR_MESSAGE() as ErrorMsg,
			ERROR_NUMBER()	as ErrorNumb,
			ERROR_PROCEDURE() as ErrorPRoc,
			ERROR_SEVERITY() as Errorseverity,
			ERROR_STATE()	as errorstate
		end catch;
	end;
	exec PR_Error_Stringtonumber

--4)

begin try
insert into Customer values(101,'krish','gk1732005@gmail.com')
end try
begin catch
	select	ERROR_LINE() as Errorline,
			ERROR_MESSAGE() as ErrorMsg,
			ERROR_NUMBER()	as ErrorNumb,
			ERROR_PROCEDURE() as ErrorPRoc,
			ERROR_SEVERITY() as Errorseverity,
			ERROR_STATE()	as errorstate
end catch

--6)
begin try
insert into Orders values(5,102,'2005-03-17')
end try
begin catch
	select	ERROR_LINE() as Errorline,
			ERROR_MESSAGE() as ErrorMsg,
			ERROR_NUMBER()	as ErrorNumb,
			ERROR_PROCEDURE() as ErrorPRoc,
			ERROR_SEVERITY() as Errorseverity,
			ERROR_STATE()	as errorstate
end catch

--5)
alter procedure PR_Available
@id 	int
as
begin
	begin try
			if not exists (select * from customer where id=@id)
			throw 50001,'id is not matched',0
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMsg
	end catch
end

exec PR_Available 105

--8)
ALTER procedure PR_Taken
@ID	INT
AS
BEGIN
	BEGIN TRY
	IF EXISTS (INSERT INTO Customer(101,'RUTVIK','RUTVIK123'))
		THROW 50002,'ID IS TAKEN',0
	END TRY
	BEGIN CATCH
		select ERROR_MESSAGE() as ErrorMsg
	END CATCH
END

EXEC PR_Taken 101

--7)
