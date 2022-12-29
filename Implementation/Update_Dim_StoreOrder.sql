
--select * from Temp_Dim_StoreOrder
use [Retail Store DW]
go

create or alter procedure Update_Dim_StoreOrder
as
begin

IF(EXISTS(SELECT 1 FROM dbo.Dim_StoreOrder))
BEGIN
  



TRUNCATE TABLE Temp_Dim_StoreOrder
insert into log (message) values ('After TRUNCATE Temp_Dim_StoreOrder');

TRUNCATE TABLE Temp_Update_StoreOrder_1
insert into log (message) values ('After TRUNCATE Temp_Update_StoreOrder_1');
TRUNCATE TABLE Temp_Update_StoreOrder_2
insert into log (message) values ('After TRUNCATE Temp_Update_StoreOrder_2');
TRUNCATE TABLE Temp_Update_StoreOrder_3
insert into log (message) values ('After TRUNCATE Temp_Update_StoreOrder_3');
TRUNCATE TABLE Temp_Update_StoreOrder_4
insert into log (message) values ('After TRUNCATE Temp_Update_StoreOrder_4');
TRUNCATE TABLE Temp_Update_StoreOrder_5
insert into log (message) values ('After TRUNCATE Temp_Update_StoreOrder_5');

insert into Temp_Dim_StoreOrder
select 

   StoreOrder_ID_SurrogateKey,StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag
from Dim_StoreOrder
insert into log (message) values ('After insert Temp_Dim_StoreOrder');


-- Temp_Update_StoreOrder_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_StoreOrder_1
(
   StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag
)
SELECT s.StoreOrder_ID,st.Store_ID,st.StoreName,su.Supplier_ID,su.SupplierName,Address_Field1,Address_Field2,
Country,State,City,Zipcode,CONVERT(CHAR(8),[Date],112) as 'Date',Status,NetAmount as [Total Payment],
pm.StoreModeID as StorePayment_ID,pm.Mode as PaymentMode,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as endDate,1 as CurrentFlag
from [Retail store SA].dbo.store_order s Join [Retail store SA].dbo.Store st
on s.Store_ID = st.Store_ID
join [Retail store SA].dbo.supplier su on su.Supplier_ID=s.Supplier_ID
join [Retail store SA].dbo.address a on a.Address_ID = st.Address_ID
join [Retail store SA].dbo.store_payment_details p on p.StorePayment_ID= s.StorePayment_ID
join [Retail store SA].dbo.storepaymentmode pm on pm.StoreModeID= p.StoreModeID

insert into log (message) values ('After insert Temp_Update_StoreOrder_1');

-- Temp_Update_StoreOrder_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_StoreOrder_2
(
   StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag
)
select 
   StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag

from  Temp_Update_StoreOrder_1
where Temp_Update_StoreOrder_1.storeOrder_ID not in ( select storeOrder_ID from Temp_Dim_StoreOrder);


insert into log (message) values ('After insert Temp_Update_StoreOrder_2');


with max_SurrogateKey as (
select max(StoreOrder_id_surrogateKey) + 2 as max_Key from Temp_Dim_StoreOrder
)
-- Temp_Update_StoreOrder_3 - New Data with Considering scd
insert into Temp_Update_StoreOrder_3

select max_Key,t2.StoreOrder_ID,t2.Store_ID,t2.Store_Name,t2.Supplier_ID,t2.SupplierName ,t2.AddressField1,t2.AddressField2,
   t2.Country,t2.State,t2.City,t2.Zipcode,t2.Date,t2.Status,t2.[Total Payment],t2.StorePayment_ID,t2.PaymentMode,
   CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from Temp_Update_StoreOrder_2 as t2,max_SurrogateKey


insert into log (message) values ('After insert Temp_Update_StoreOrder_3');


-- temp4; -- for all current valid datas in dimension

insert into Temp_Update_StoreOrder_4
select StoreOrder_ID_SurrogateKey,StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag
from Temp_Dim_StoreOrder
where CurrentFlag = 1
;

insert into log (message) values ('After insert Temp_Update_StoreOrder_4');

insert into Temp_Update_StoreOrder_5 (
   StoreOrder_ID_SurrogateKey,StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag
)
select StoreOrder_ID_SurrogateKey,t1.StoreOrder_ID,t1.Store_ID,t1.Store_Name,t1.Supplier_ID,t1.SupplierName ,t1.AddressField1,t1.AddressField2,
   t1.Country,t1.State,t1.City,t1.Zipcode,t1.Date,t1.Status,t1.[Total Payment],t1.StorePayment_ID,t1.PaymentMode, t4.StartDate,t4.EndDate,t4.CurrentFlag
from Temp_Update_StoreOrder_1 as t1 inner join Temp_Update_StoreOrder_4 as t4 
on t1 .StoreOrder_ID = t4.StoreOrder_ID   
where t1.status != t4.status ;


insert into log (message) values ('After insert Temp_Update_StoreOrder_5');

with max_SurrogateKey as (
select max(StoreOrder_id_surrogateKey) + 2 as max_Key from Temp_Dim_StoreOrder
)
insert into Temp_Update_StoreOrder_3 
select max_Key,StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
    CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from Temp_Update_StoreOrder_5,max_SurrogateKey
 
insert into log (message) values ('After inserting again to Temp_Update_StoreOrder_3');

update Temp_Dim_StoreOrder 
set CurrentFlag = 0, EndDate = CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112)
from Temp_Update_StoreOrder_5
where Temp_Update_StoreOrder_5.StoreOrder_ID_SurrogateKey = Temp_Dim_StoreOrder.StoreOrder_ID_SurrogateKey

insert into log (message) values ('After update Temp_Dim_StoreOrder')

update Temp_Update_StoreOrder_3
set  StartDate = CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112)
						  
insert into log (message) values ('After update Temp_Update_StoreOrder_3')

insert into Temp_Dim_StoreOrder 
select 	StoreOrder_id_surrogateKey,StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
    CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from  Temp_Update_StoreOrder_3;

insert into log (message) values ('After insert Temp_Dim_StoreOrder finished')

truncate table [Retail Store DW].[dbo].[Dim_StoreOrder];

insert into log (message) values ('After truncate [Dim_StoreOrder]')

insert into [Retail Store DW].[dbo].[Dim_StoreOrder]
select 
	StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
	Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
	StartDate,EndDate,CurrentFlag
from Temp_Dim_StoreOrder
order by StoreOrder_ID_SurrogateKey asc
 
insert into log (message) values ('updating [Dim_StoreOrder] is finnished')
end
else
begin
   insert into log (message) values (' [Dim_StoreOrder] is empty')

END;



end
go