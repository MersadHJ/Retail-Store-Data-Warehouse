use [Retail Store DW]

go
create or alter procedure Update_Dim_CustomerOrder
as
begin

IF(EXISTS(SELECT 1 FROM dbo.Dim_CustomerOrder))
BEGIN

TRUNCATE TABLE Temp_Dim_CustomerOrder
insert into log (message) values ('After TRUNCATE Temp_Dim_CustomerOrder');
TRUNCATE TABLE Temp_Update_CustomerOrder_1
insert into log (message) values ('After TRUNCATE Temp_Update_CustomerOrder_1');
TRUNCATE TABLE Temp_Update_CustomerOrder_2
insert into log (message) values ('After TRUNCATE Temp_Update_CustomerOrder_2');
TRUNCATE TABLE Temp_Update_CustomerOrder_3
insert into log (message) values ('After TRUNCATE Temp_Update_CustomerOrder_3');
TRUNCATE TABLE Temp_Update_CustomerOrder_4
insert into log (message) values ('After TRUNCATE Temp_Update_CustomerOrder_4');
TRUNCATE TABLE Temp_Update_CustomerOrder_5
insert into log (message) values ('After TRUNCATE Temp_Update_CustomerOrder_5');

insert into Temp_Dim_CustomerOrder
select 

     customerorder_id_surrogateKey,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
from Dim_CustomerOrder

insert into log (message) values ('After insert Temp_Dim_CustomerOrder');

-- Temp_Update_StoreOrder_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_CustomerOrder_1
(
   CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
)
SELECT c.CustomerOrder_ID,s.Store_ID,s.StoreName,cu.Customer_ID,First_Name as CustomerFirstName,LastName as CustomerLastName
,CONVERT(CHAR(8),[Date],112) as 'Date',Status,NetAmount as [Total Payment],Payment_ID as CustomerPayment_ID,pm.Mode as PaymentMode,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as endDate,1 as CurrentFlag
from [Retail store SA].dbo.customer_order c Join [Retail store SA].dbo.Store s  
on c.Store_ID = s.Store_ID
join [Retail store SA].dbo.customer cu on cu.Customer_ID = c.Customer_ID
join [Retail store SA].dbo.customer_payment_details p on p.CustomerPayment_ID= c.Payment_ID
join [Retail store SA].dbo.customerpaymentmode pm on pm.CustomerModeID = p.CustomerModeID  
insert into log (message) values ('After insert Temp_Update_CustomerOrder_1');


-- Temp_Update_StoreOrder_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_CustomerOrder_2
(
	CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
)
select 
   CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag

from  Temp_Update_CustomerOrder_1
where Temp_Update_CustomerOrder_1.CustomerOrder_ID not in ( select CustomerOrder_ID from Temp_Dim_CustomerOrder);

insert into log (message) values ('After insert Temp_Update_CustomerOrder_2');

with max_SurrogateKey as (
select max(customerorder_id_surrogateKey) + 2 as max_Key from Temp_Dim_CustomerOrder
)													

-- Temp_Update_StoreOrder_3 - New Data with Considering scd
insert into Temp_Update_CustomerOrder_3(
	   customerorder_id_surrogateKey,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag

)

select max_Key ,t2.CustomerOrder_ID,t2.Store_ID,t2.Store_Name  ,t2.Customer_ID,t2.CustomerFirstName,t2.CustomerLastName,t2.[Date],t2.[Status],
	t2.[Total Payment],t2.CustomerPayment_ID,t2.PaymentMode,
   CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from Temp_Update_CustomerOrder_2 as t2, max_SurrogateKey
insert into log (message) values ('After insert Temp_Update_CustomerOrder_3');

--truncate table temp4; -- for all current valid datas in dimension

insert into Temp_Update_CustomerOrder_4
select customerorder_id_surrogateKey,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
		[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
from Temp_Dim_CustomerOrder
where CurrentFlag = 1
;

insert into log (message) values ('After insert Temp_Update_CustomerOrder_4');

insert into Temp_Update_CustomerOrder_5 (
   customerorder_id_surrogateKey,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
		[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
)
select customerorder_id_surrogateKey,t1.CustomerOrder_ID,t1.Store_ID,t1.Store_Name  ,t1.Customer_ID,t1.CustomerFirstName,t1.CustomerLastName,t1.[Date],t1.[Status],
		t1.[Total Payment],t1.CustomerPayment_ID,t1.PaymentMode,t4.StartDate,t4.EndDate,t4.CurrentFlag
from Temp_Update_CustomerOrder_1 as t1 inner join Temp_Update_CustomerOrder_4 as t4 
on t1 .CustomerOrder_ID = t4.CustomerOrder_ID   
where t1.status != t4.status ;

insert into log (message) values ('After insert Temp_Update_CustomerOrder_5');


with max_SurrogateKey as (
select max(CustomerOrder_ID_SurrogateKey) + 2 as max_Key from Temp_Dim_CustomerOrder
)
insert into Temp_Update_CustomerOrder_3 
select max_Key,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,
    CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from Temp_Update_CustomerOrder_5,max_SurrogateKey
insert into log (message) values ('After inserting into Temp_Update_CustomerOrder_3 again ');


update Temp_Dim_CustomerOrder 
set CurrentFlag = 0, EndDate = CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112)
from Temp_Update_CustomerOrder_5
where Temp_Update_CustomerOrder_5.customerorder_id_surrogateKey = Temp_Dim_CustomerOrder.customerorder_id_surrogateKey
insert into log (message) values ('After updating Temp_Dim_CustomerOrder ');


update Temp_Update_CustomerOrder_3
set  StartDate = CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112)
insert into log (message) values ('After updating Temp_Update_CustomerOrder_3 ');

insert into Temp_Dim_CustomerOrder 
select 	customerorder_id_surrogateKey,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,
    CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from  Temp_Update_CustomerOrder_3;

insert into log (message) values ('finished inserting into Temp_Dim_CustomerOrder');


truncate table [Retail Store DW].[dbo].[Dim_CustomerOrder];
insert into log (message) values ('After truncate [Dim_CustomerOrder]');


insert into [Retail Store DW].[dbo].[Dim_CustomerOrder]
select 
	CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
from Temp_Dim_CustomerOrder
order by customerorder_id_surrogateKey asc
insert into log (message) values ('updating [Dim_CustomerOrder] is finnished');

END

else
begin
   insert into log (message) values (' [Dim_CustomerOrder] is empty')

END;

END
go