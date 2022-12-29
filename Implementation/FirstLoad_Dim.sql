

create or alter procedure FirstLoad_Dim_Customer
as
begin
	insert into [Retail Store DW].[dbo].[Dim_Customer]
	select 
		c.[Customer_ID] ,
		c.[First_Name] +' ' + c.[LastName],
		c.[PhoneNumber],
		a.[Address_Field1],
		a.[Address_Field2],
		a.[Country],
		a.[State],
		a.[City],
		a.[Zipcode]
	
	from [Retail store SA].[dbo].[customer] as c inner join
	[Retail store SA].[dbo].[address] as a on (c.Address_ID = a.Address_ID) 
	insert into log (message) values ('After insert into [Dim_Customer]')
end		  
Go


create or alter procedure FirstLoad_Dim_Store
as
begin
	insert into [Retail Store DW].[dbo].Dim_Store
	select 
		s.[Store_ID] ,
		s.[StoreName],
		a.[Address_Field1],
		a.[Address_Field2],
		a.[Country],
		a.[State],
		a.[City],
		a.[Zipcode]
	
	from [Retail store SA].[dbo].[store] as s inner join
	[Retail store SA].[dbo].[address] as a on (s.Address_ID = a.Address_ID) 

	insert into log (message) values ('After insert into [Dim_Store]') 
end
Go


create or alter procedure FirstLoad_Dim_Product
as
begin
	insert into [Retail Store DW].[dbo].[Dim_Product]
	
		select 
			p.[Product_ID],
			p.[ProductName],
			p.[Price],
			CONVERT(CHAR(8),[Manufactured_Date],112) as 'Manufactured_Date',
			CONVERT(CHAR(8),[Expiry_Date],112) as 'Manufactured_Date',
			sc.[Subcategory_ID],
			sc.[SubcategoryName],
			c.[Category_ID],
			c.[Category]
	
		from [Retail store SA].[dbo].[product] as p inner join
		[Retail store SA].[dbo].product_subcategory as sc on (p.Subcategory_ID = sc.Subcategory_ID) 
		inner join [Retail store SA].[dbo].[productcategory] as c on (sc.Category_ID = c.Category_ID)
	
	insert into log (message) values ('After insert into dim_product');

end
Go



create or alter procedure FirstLoad_Dim_Supplier
as
begin
insert into [Retail Store DW].[dbo].dim_supplier  SELECT Supplier_ID as SupplierID,SupplierName,Address_Field1,Address_Field2,Country,State,City,Zipcode
from [Retail store SA].dbo.supplier s Join [Retail store SA].dbo.address a 
on a.Address_ID = s.Address_ID

insert into log (message) values ('After insert into [dim_supplier]'); 
end
go


create or alter procedure FirstLoad_Dim_Employee
as
begin
insert into [Retail Store DW].[dbo].dim_Employee  
SELECT Employee_ID,First_Name+' '+LastName as Name,Store_ID as Current_Store_Id,NULL as Previous_Store_ID,GETDATE() as Effective_Date,PhoneNumber,Address_Field1,Address_Field2,Country,State,City,Zipcode
from [Retail store SA].dbo.employee e Join [Retail store SA].dbo.address a 
on a.Address_ID = e.Address_ID	
insert into log (message) values ('After insert into [dim_Employee]');
end
go

create or alter procedure FirstLoad_Dim_SubCategory
as
begin
insert into [Retail Store DW].[dbo].dim_SubCategory  SELECT Subcategory_ID,SubcategoryName,c.Category_ID,Category as Category_Name
from [Retail store SA].dbo.product_subcategory s Join [Retail store SA].dbo.productcategory c
on s.Category_ID = c.Category_ID	  
insert into log (message) values ('After insert into [dim_SubCategory]');
end
go


create or alter procedure FirstLoad_Dim_CustomerOrder
as
begin

insert into [Retail Store DW].[dbo].Dim_CustomerOrder(

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
insert into log (message) values ('After insert into [Dim_CustomerOrder]');
end
go



create or alter procedure FirstLoad_Dim_StoreOrder
as
begin

insert into [Retail Store DW].[dbo].Dim_StoreOrder
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
insert into log (message) values ('After insert into [Dim_StoreOrder]');
end
go


create or alter procedure FirstLoadOfDimentions
as
begin
BEGIN TRAN
exec FirstLoad_Dim_Customer
exec FirstLoad_Dim_Store
exec FirstLoad_Dim_Product
exec FirstLoad_Dim_Supplier
exec FirstLoad_Dim_Employee
exec FirstLoad_Dim_SubCategory
exec FirstLoad_Dim_CustomerOrder
exec FirstLoad_Dim_StoreOrder
COMMIT TRAN 
end
go

exec FirstLoadOfDimentions
select * from Dim_CustomerOrder





