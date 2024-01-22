--1)
declare @productid		int,
		@productname	varchar(250),
		@price			decimal(10,2)

declare product_cursor cursor
for select product_id,product_name,price from Product_Info

open product_cursor

Fetch next from product_cursor into @productId,@productName,@price

while @@fetch_status=0
begin
	print concat(@productid,' ',@productname,' ',@price)
	Fetch next from product_cursor
	into @productid,@productname,@price
end

close product_cursor
deallocate product_cursor

--2)
declare @productid		int,
		@productName	varchar(250),
		@price			decimal(10,2)

declare product_cursor_fetch cursor
for select product_id,product_name,price from Product_Info

open product_cursor_fetch

fetch next from product_cursor_fetch into @productid,@productname,@price

while @@fetch_status =0
begin
	print concat(@productid,'_',@productname)
	fetch next from product_cursor_fetch into @productid,@productname,@price
end
close product_cursor_fetch
deallocate product_cursor_fetch

--3)
declare @product_id		int

declare product_cursordelete cursor
for select product_id from Product_Info

open product_cursordelete

fetch next from product_cursordelete into
@product_id

while @@FETCH_STATUS = 0

begin
	delete from Product_Info
	where product_id=@product_id
	
fetch next from product_cursordelete into @product_id
end
close product_cursordelete
deallocate product_cursordelete

--4)
declare @product_id		int

declare product_cursorupdate cursor
for select product_id from Product_Info

open product_cursorupdate

fetch next from product_cursorupdate into @product_id

while @@FETCH_STATUS =0
	begin
	update Product_Info
	set price=price+(price*.1)
	where product_id=@product_id

	fetch next from product_cursorupdate into @product_id
end

close product_cursorupdate
deallocate product_cursorupdate

--5)

declare @product_id		int,
		@product_Name	varchar(250),
		@price			decimal(10,2)

declare product_cursorinsert cursor
for product_id,product_name,price from newProduct

open product_cursorinsert

fetch next from product_cursorinsert into @product_id,@product_name,@price

while @@FETCH_STATUS = 0
begin
	INSERT INTO newProduct VALUES(1,'Smatphone',35000);
	INSERT INTO newProduct VALUES(2,'Laptop',65000);
	INSERT INTO newProduct VALUES(3,'Headphones',5500);
	INSERT INTO newProduct VALUES(4,'Television',85000);
	INSERT INTO newProduct VALUES(5,'Gaming Console',32000);

	fetch next from product_cursorinsert into @product_id,@product_name,@price
end
close product_cursorinsert
deallocate product_cursorinsert