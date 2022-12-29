go
Create or alter procedure Update_Dim_Customer
as
begin
IF(EXISTS(SELECT 1 FROM dbo.Dim_Customer))
BEGIN
TRUNCATE TABLE Temp_Dim_Customer
TRUNCATE TABLE Temp_Update_Customer_1
TRUNCATE TABLE Temp_Update_Customer_2
insert into log (message) values ('After Truncate Customer Temp_Tables');

insert into Temp_Dim_Customer
select 

   Customer_ID,[Customer Name],PhoneNumber,Address_Field1,Address_Field2,
   Country,State,City,Zipcode
from Dim_Customer
insert into log (message) values ('After Insert Temp_Dim_Customer');
-- Temp_Update_Customer_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_Customer_1
(
  
   Customer_ID,[Customer Name],PhoneNumber,Address_Field1,Address_Field2,
   Country,State,City,Zipcode
)
SELECT 
   Customer_ID,First_Name+' '+LastName as [Customer Name],PhoneNumber,Address_Field1,Address_Field2,
Country,State,City,Zipcode
from [Retail store SA].dbo.customer c join [Retail store SA].dbo.address a 
on c.Address_ID=a.Address_ID
insert into log (message) values ('After Insert Temp_Update_Customer_1');
-- Temp_Update_Customer_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_Customer_2
(
  
   Customer_ID,[Customer Name],PhoneNumber,Address_Field1,Address_Field2,
   Country,State,City,Zipcode
)
select 
  
   Customer_ID,[Customer Name],PhoneNumber,Address_Field1,Address_Field2,
   Country,State,City,Zipcode

from  Temp_Update_Customer_1 t1
where t1.Customer_ID not in ( select Customer_ID from Temp_Dim_Customer);

insert into log (message) values ('After Insert Temp_Update_Customer_2');

insert into Temp_Dim_Customer
select * from temp_update_customer_2


insert into log (message) values ('After Insert temp_update_customer_2');


truncate table [Retail Store DW].[dbo].[Dim_Customer];

insert into log (message) values ('After Truncate Dim_Customer');


insert into [Retail Store DW].[dbo].[Dim_Customer]
select * from temp_dim_customer
insert into log (message) values ('After Insert Dim_Customer');
end;


else 
begin
insert into log (message) values ('Customer Dimension is Empty');
end;


end;

--select * from [Retail store SA].[dbo].[store_order]
--update [Retail store SA].[dbo].[store_order]
--set Status = 'failed' where Customer_ID = 2