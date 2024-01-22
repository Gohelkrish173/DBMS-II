create database Person_LogInfo

CREATE TABLE Person(
PersonID Int,
PersonName Varchar (100),
Salary Decimal (8,2),
JoiningDate Datetime,
City Varchar (100),
Age Int,
BirthDate Datetime
)

CREATE TABLE PersonLog(
PLogID Int,
PersonID Int,
PersonName Varchar(250),
Operation
Varchar (50),
UpdateDate
Datetime
)
CREATE TABLE UPDATE_FOR_PERSON(
MSG VARCHAR(50)
)
CREATE TABLE UPDATE_FOR_PERSONLOG(
MSG VARCHAR(50)
)
---1)

CREATE TRIGGER TR_DML
ON Person
AFTER INSERT,UPDATE,DELETE
AS
BEGIN
     INSERT INTO UPDATE_FOR_PERSON
	 VALUES('Record is Affected'+CAST(GETDATE() AS VARCHAR(55)))
END

--2)
ALTER TRIGGER TR_DML
ON PERSON
FOR INSERT,UPDATE,DELETE
AS
BEGIN
     DECLARE @PersonID INT,@PersonName VARCHAR(50),@Operation VARCHAR(50),@UpdateDate DATETIME
	IF EXISTS (SELECT * FROM deleted)
	BEGIN
	     SELECT @PersonID=PersonID,@PersonName=PersonName FROM deleted
	     SET @Operation='DELETED'
	     SET @UpdateDate=GETDATE()
	END
	ELSE
	BEGIN
	     SELECT @PersonID=PersonID,@PersonName=PersonName FROM inserted
	     SET @Operation='INSERTED /UPDATED'
	     SET @UpdateDate=GETDATE()
	END
	 INSERT INTO PersonLog(PersonID,PersonName,Operation,UpdateDate)
	 VALUES(@PersonID,@PersonName,@Operation,@UpdateDate)
END

--3)

ALTER TRIGGER TR_DML
ON PERSON
INSTEAD OF INSERT,UPDATE,DELETE
AS
BEGIN
     DECLARE @PersonID INT,@PersonName VARCHAR(50),@Operation VARCHAR(50),@UpdateDate DATETIME
	IF EXISTS (SELECT * FROM deleted)
	BEGIN
	     SELECT @PersonID=PersonID,@PersonName=PersonName FROM deleted
	     SET @Operation='DELETED'
	     SET @UpdateDate=GETDATE()
	END
	ELSE
	BEGIN
	     SELECT @PersonID=PersonID,@PersonName=PersonName FROM inserted
	     SET @Operation='INSERTED /UPDATED'
	     SET @UpdateDate=GETDATE()
	END
	 INSERT INTO PersonLog(PersonID,PersonName,Operation,UpdateDate)
	 VALUES(@PersonID,@PersonName,@Operation,@UpdateDate)
END

--4)
CREATE TRIGGER TR_PERSON_INSERT
ON PERSON
AFTER INSERT
AS
BEGIN
     DECLARE @PERSONENAME VARCHAR(50)
	 SELECT @PERSONENAME FROM inserted
	 UPDATE Person
	 SET  PersonName=UPPER(PersonName)
	 WHERE PersonName=@PERSONENAME
END
--5)
CREATE TRIGGER TR_PERSON_INSERTED
ON PERSON
AFTER INSERT
AS
BEGIN
     DECLARE @B_DATE DATETIME,@AGE INT
	 SELECT @B_DATE=BirthDate FROM inserted
	 set @AGE=DATEDIFF(year,getdate(), @B_DATE)
	 update Person
	 set Age=@AGE
	 where BirthDate=@B_DATE

END

--6)
CREATE TRIGGER TR_PERSONLOG_DELETE
ON PersonLog
AFTER DELETE
AS
BEGIN
    INSERT INTO UPDATE_FOR_PERSONLOG
	VALUES('Record deleted successfully from PersonLog')
END

