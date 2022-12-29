go
Create or alter procedure Update_Dim_Supplier
as
begin
IF(EXISTS(SELECT 1 FROM dbo.Dim_Supplier))
BEGIN
  

TRUNCATE TABLE Temp_Dim_Supplier;
TRUNCATE TABLE Temp_Update_Supplier_1;
TRUNCATE TABLE Temp_Update_Supplier_2;

insert into log (message) values ('After Truncate Supplier Temp_Tables');


insert into Temp_Dim_Supplier
select 

   Supplier_ID,[SupplierName],AddressField1,AddressField2,
   Country,State,City,Zipcode
from Dim_Supplier;
insert into log (message) values ('After Insert Temp_Dim_Supplier');

-- Temp_Update_Supplier_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_Supplier_1

SELECT 
     Supplier_ID,[SupplierName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
from [Retail Store SA].dbo.Supplier s join [Retail Store SA].dbo.address a 
on a.Address_ID = s.Address_ID;
insert into log (message) values ('After Insert Temp_Update_Supplier_1');
-- Temp_Update_Supplier_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_Supplier_2

select 
  
       Supplier_ID,[SupplierName],AddressField1,AddressField2,
   Country,State,City,Zipcode
from  Temp_Update_Supplier_1 t1
where t1.Supplier_ID not in ( select Supplier_ID from Temp_Dim_Supplier);
insert into log (message) values ('After Insert Temp_Update_Supplier_2');

insert into Temp_Dim_Supplier
select * from temp_update_Supplier_2;
insert into log (message) values ('After Insert Temp_Dim_Supplier');

truncate table [Retail Store DW].[dbo].[Dim_Supplier];
insert into log (message) values ('After Truncate Dim_Supplier');

insert into [Retail Store DW].[dbo].[Dim_Supplier]
select * from dim_supplier;
insert into log (message) values ('After Insert Dim_Supplier');
end;
else 
begin
insert into log (message) values ('Supplier Dimension is Empty');
end;
END;

--select * from [Retail Supplier SA].[dbo].[Supplier_order]
--update [Retail Supplier SA].[dbo].[Supplier_order]
--set Status = 'failed' where Supplier_ID = 2
