go
Create or alter procedure Update_Dim_Store
as
begin
IF(EXISTS(SELECT 1 FROM dbo.Dim_store))
BEGIN
  

TRUNCATE TABLE Temp_Dim_Store
TRUNCATE TABLE Temp_Update_Store_1
TRUNCATE TABLE Temp_Update_Store_2
insert into log (message) values ('After Truncate Store Temp_Tables');
insert into Temp_Dim_Store
select 

   Store_ID,[StoreName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
from Dim_Store
insert into log (message) values ('After Insert Temp_Dim_Store');
-- Temp_Update_Store_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_Store_1
(
  
   Store_ID,[StoreName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
)
SELECT 
  
   Store_ID,[StoreName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
from [Retail store SA].dbo.Store s join [Retail store SA].dbo.address a 
on s.Address_ID=a.Address_ID
insert into log (message) values ('After Insert Temp_Update_Store_1');
-- Temp_Update_Store_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_Store_2
(
  
   
   Store_ID,[StoreName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
)
select 
  
   Store_ID,[StoreName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
from  Temp_Update_Store_1 t1
where t1.Store_ID not in ( select Store_ID from Temp_Dim_Store);
insert into log (message) values ('After Insert Temp_Update_Store_2');


insert into Temp_Dim_Store
select * from temp_update_Store_2

insert into log (message) values ('After Insert Temp_Dim_Store');



truncate table [Retail Store DW].[dbo].[Dim_Store];

insert into log (message) values ('After Truncate Dim_Store');
insert into [Retail Store DW].[dbo].[Dim_Store]
select * from temp_dim_Store

insert into log (message) values ('After Insert Dim_Store');
end;
--select * from [Retail store SA].[dbo].[store_order]
--update [Retail store SA].[dbo].[store_order]
--set Status = 'failed' where Store_ID = 2
else 
begin
insert into log (message) values ('Store Dimension is Empty');
end;
end;