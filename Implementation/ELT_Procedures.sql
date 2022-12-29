
create or alter procedure drop_const
as 
ALTER TABLE [dbo].[customer] DROP CONSTRAINT IF EXISTS [FK_Customer_ID_Address_ID];
ALTER TABLE [dbo].[customer_order] DROP CONSTRAINT IF EXISTS [FK_customer_order_Store_ID];
ALTER TABLE [dbo].[customer_order] DROP CONSTRAINT IF EXISTS [FK_CustomerOrder_ID_Customer_ID];
ALTER TABLE [dbo].[customer_order] DROP CONSTRAINT IF EXISTS [FK_CustomerOrder_ID_CustomerPayment_ID];
ALTER TABLE [dbo].[customer_order] DROP CONSTRAINT IF EXISTS [FK_CustomerOrder_ID_Employee_ID];
ALTER TABLE [dbo].[customer_order_details] DROP CONSTRAINT IF EXISTS [FK_CustomerOrder_ID_CustomerOrderDetails_ID];
ALTER TABLE [dbo].[customer_order_details] DROP CONSTRAINT IF EXISTS [FK_Product_ID_CustomerOrderDetails_ID];
ALTER TABLE [dbo].[customer_payment_details] DROP CONSTRAINT IF EXISTS [FK_CustomerModeID_CustomerPayment_ID];
ALTER TABLE [dbo].[employee] DROP CONSTRAINT IF EXISTS [FK_Employee_ID_Address_ID];
ALTER TABLE [dbo].[employee] DROP CONSTRAINT IF EXISTS [FK_Employee_ID_Store_ID];
ALTER TABLE [dbo].[inventory] DROP CONSTRAINT IF EXISTS [FK_Store_ID_Inventory_ID];
ALTER TABLE [dbo].[product] DROP CONSTRAINT IF EXISTS [FK_product_ID_Subcategory_ID];
ALTER TABLE [dbo].[product_inventory] DROP CONSTRAINT IF EXISTS [FK_Product_Inventory_Inventory_ID];
ALTER TABLE [dbo].[product_inventory] DROP CONSTRAINT IF EXISTS [FK_Product_Inventory_Product_ID];
ALTER TABLE [dbo].[product_subcategory] DROP CONSTRAINT IF EXISTS [FK_Subcategory_ID_Category_ID];
ALTER TABLE [dbo].[store] DROP CONSTRAINT IF EXISTS [FK_Store_ID_Address_ID];
ALTER TABLE [dbo].[store_has_supplier] DROP CONSTRAINT IF EXISTS [FK_store_has_supplier_Store_ID];
ALTER TABLE [dbo].[store_has_supplier] DROP CONSTRAINT IF EXISTS [FK_store_has_supplier_Supplier_ID];
ALTER TABLE [dbo].[store_order] DROP CONSTRAINT IF EXISTS [FK_StoreOrder_ID_Store_ID];
ALTER TABLE [dbo].[store_order] DROP CONSTRAINT IF EXISTS [FK_StoreOrder_ID_Supplier_ID];
ALTER TABLE [dbo].[store_order] DROP CONSTRAINT IF EXISTS [FK_StorePayment_ID_StoreOrder_ID];
ALTER TABLE [dbo].[store_order_details] DROP CONSTRAINT IF EXISTS [FK_StoreOrder_ID_Order_ID];
ALTER TABLE [dbo].[store_payment_details] DROP CONSTRAINT IF EXISTS [FK_StoreModeID_StorePayment_ID];
ALTER TABLE [dbo].[store_payment_details] DROP CONSTRAINT IF EXISTS [FK_StorePayment_ID_Store_ID];
ALTER TABLE [dbo].[supplier] DROP CONSTRAINT IF EXISTS [FK_supplier_ID_Address_ID];
go


create or alter procedure add_const as
ALTER TABLE [dbo].[customer_order] ADD CONSTRAINT  [FK_CustomerOrder_ID_CustomerPayment_ID] FOREIGN KEY ([Payment_ID]) REFERENCES [dbo].[customer_payment_details]([CustomerPayment_ID]);
ALTER TABLE [dbo].[customer_order_details] ADD CONSTRAINT [FK_CustomerOrder_ID_CustomerOrderDetails_ID] FOREIGN KEY ([CustomerOrder_ID]) REFERENCES [dbo].[customer_order]([CustomerOrder_ID]);
ALTER TABLE [dbo].[store_order_details] ADD CONSTRAINT [FK_StoreOrder_ID_Order_ID] FOREIGN KEY ([StoreOrder_ID]) REFERENCES [dbo].[store_order]([StoreOrder_ID]);
ALTER TABLE [dbo].[customer] ADD CONSTRAINT [FK_Customer_ID_Address_ID] FOREIGN KEY ([Address_ID]) REFERENCES [dbo].[address]([Address_ID]);
ALTER TABLE [dbo].[employee] ADD CONSTRAINT [FK_Employee_ID_Address_ID] FOREIGN KEY ([Address_ID]) REFERENCES [dbo].[address]([Address_ID]);
ALTER TABLE [dbo].[store] ADD CONSTRAINT [FK_Store_ID_Address_ID] FOREIGN KEY ([Address_ID]) REFERENCES [dbo].[address]([Address_ID]);
ALTER TABLE [dbo].[supplier] ADD CONSTRAINT [FK_supplier_ID_Address_ID] FOREIGN KEY ([Address_ID]) REFERENCES [dbo].[address]([Address_ID]);
ALTER TABLE [dbo].[customer_order] ADD CONSTRAINT [FK_CustomerOrder_ID_Customer_ID] FOREIGN KEY ([Customer_ID]) REFERENCES [dbo].[customer]([Customer_ID]);
ALTER TABLE [dbo].[customer_payment_details] ADD CONSTRAINT [FK_CustomerModeID_CustomerPayment_ID] FOREIGN KEY ([CustomerModeID]) REFERENCES [dbo].[customerpaymentmode]([CustomerModeID]);
ALTER TABLE [dbo].[customer_order] ADD CONSTRAINT [FK_CustomerOrder_ID_Employee_ID] FOREIGN KEY ([Employee_ID]) REFERENCES [dbo].[employee]([Employee_ID]);
ALTER TABLE [dbo].[product_inventory] ADD CONSTRAINT [FK_Product_Inventory_Inventory_ID] FOREIGN KEY ([Inventory_ID]) REFERENCES [dbo].[inventory]([Inventory_ID]);
ALTER TABLE [dbo].[customer_order_details] ADD CONSTRAINT [FK_Product_ID_CustomerOrderDetails_ID] FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[product]([Product_ID]);
ALTER TABLE [dbo].[product_inventory] ADD CONSTRAINT [FK_Product_Inventory_Product_ID] FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[product]([Product_ID]);
ALTER TABLE [dbo].[product] ADD CONSTRAINT [FK_product_ID_Subcategory_ID] FOREIGN KEY ([Subcategory_ID]) REFERENCES [dbo].[product_subcategory]([Subcategory_ID]);
ALTER TABLE [dbo].[product_subcategory] ADD CONSTRAINT [FK_Subcategory_ID_Category_ID] FOREIGN KEY ([Category_ID]) REFERENCES [dbo].[productcategory]([Category_ID]);
ALTER TABLE [dbo].[customer_order] ADD CONSTRAINT [FK_customer_order_Store_ID] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[employee] ADD CONSTRAINT [FK_Employee_ID_Store_ID] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[inventory] ADD CONSTRAINT [FK_Store_ID_Inventory_ID] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[store_has_supplier] ADD CONSTRAINT [FK_store_has_supplier_Store_ID] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[store_order] ADD CONSTRAINT [FK_StoreOrder_ID_Store_ID] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[store_payment_details] ADD CONSTRAINT [FK_StorePayment_ID_Store_ID] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[store_order] ADD CONSTRAINT [FK_StorePayment_ID_StoreOrder_ID] FOREIGN KEY ([StorePayment_ID]) REFERENCES [dbo].[store_payment_details]([StorePayment_ID]);
ALTER TABLE [dbo].[store_payment_details] ADD CONSTRAINT [FK_StoreModeID_StorePayment_ID] FOREIGN KEY ([StoreModeID]) REFERENCES [dbo].[storepaymentmode]([StoreModeID]);
ALTER TABLE [dbo].[store_has_supplier] ADD CONSTRAINT [FK_store_has_supplier_Supplier_ID] FOREIGN KEY ([Supplier_ID]) REFERENCES [dbo].[supplier]([Supplier_ID]);
ALTER TABLE [dbo].[store_order] ADD CONSTRAINT [FK_StoreOrder_ID_Supplier_ID] FOREIGN KEY ([Supplier_ID]) REFERENCES [dbo].[supplier]([Supplier_ID]);
go


CREATE or Alter procedure FillStaginAddress 
as 

	  begin
	   
truncate table address;
 
insert into address
select address_ID, Address_Field1,Address_field2,City,State,Country,Zipcode
from [Retail store].dbo.address
end
Go


CREATE or Alter procedure FillStaginCustomer
as 
begin

	  truncate table customer
 

insert into customer
select customer_id,First_Name,LastName,PhoneNumber,Address_ID
from [Retail store].dbo.customer
end
Go

CREATE or Alter procedure FillStaginCustomerOrder
as 

	  
	  truncate table customer_order
	 
begin
insert into customer_order
select customerorder_id,Status,Customer_ID,Payment_ID,Employee_ID,Date,Store_ID
from [Retail store].dbo.customer_order
where Date is not null and Customer_ID is not null and Payment_ID is not null and Employee_ID is not null 
and Store_ID is not null 

end
Go

CREATE or Alter procedure FillStaginCustomerOrderDetails
as 
begin

	truncate table customer_order_details
 

insert into customer_order_details
select customerorderdetails_id,Amount,Quantity,CustomerOrder_ID,Product_ID
from [Retail store].dbo.customer_order_details
where CustomerOrder_ID in(select customerorder_id from customer_order)
end
Go

CREATE or Alter procedure FillStaginCustomerPaymentDetails
as 
begin

	  truncate table customer_payment_details
 


insert into customer_payment_details
select CustomerPayment_ID,NetAmount,CustomerModeID
from [Retail store].dbo.customer_payment_details
where CustomerModeID is not null
end
Go

CREATE or Alter procedure FillStaginCustomerPaymentMode
as 
begin

	  truncate table customerpaymentmode
 

insert into customerpaymentmode
select CustomerModeID,Mode,Discount
from [Retail store].dbo.customerpaymentmode
end
Go

CREATE or Alter procedure FillStaginEmployee
as 
begin

	  truncate table employee
 
insert into employee
select Employee_ID,Store_ID,First_Name,LastName,PhoneNumber,Address_ID
from [Retail store].dbo.employee
where Store_ID is not null
end
Go

CREATE or Alter procedure FillStaginInventory
as 
begin

	  truncate table inventory
 

insert into inventory
select Inventory_ID,Store_ID
from [Retail store].dbo.inventory
end
Go

CREATE or Alter procedure FillStaginProduct
as 
begin

	  truncate table product
 

insert into product
select Product_ID,ProductName,Price,Manufactured_Date,Expiry_Date,Margin,Subcategory_ID
from [Retail store].dbo.product
where Manufactured_Date is not null and Subcategory_ID is not null
end
Go


CREATE or Alter procedure FillStaginProductInventory
as
begin

	  truncate table product_inventory
 

insert into product_inventory
select Inventory_ID,Product_ID,quantity
from [Retail store].dbo.product_inventory
end
Go

CREATE or Alter procedure FillStaginProductSubCategory
as 

	  truncate table product_subcategory
 
	  begin
insert into product_subcategory
select Subcategory_ID,SubcategoryName,Category_ID
from [Retail store].dbo.product_subcategory
end
Go

CREATE or Alter procedure FillStaginProductCategory
as 
begin

	  truncate table productcategory
 

insert into productcategory
select Category_ID,Category
from [Retail store].dbo.productcategory
end
Go

CREATE or Alter procedure FillStaginStore
as 
begin

	  truncate table store
 
	  
insert into store
select Store_ID,StoreName,Address_ID
from [Retail store].dbo.store
end
Go

CREATE or Alter procedure FillStaginSupplier as


	  truncate table Supplier
 
begin	  
	insert into [Retail Store SA].dbo.Supplier(
	  Supplier_ID,SupplierName, Address_ID)
	
	select Supplier_ID,SupplierName, Address_ID
	from [Retail Store].dbo.supplier
end

Go
CREATE or Alter procedure FillStaginStorePaymentMode as
 begin

	  truncate table storepaymentmode
 

	insert into [Retail Store SA].dbo.storepaymentmode(
	 StoreModeID,Mode, Discount)
	
	select  StoreModeID,Mode, Discount
	from [Retail Store].dbo.storepaymentmode
end


Go
CREATE or Alter procedure FillStaginStoreOrderDetails as
	 begin

	  truncate table store_order_details
 

	insert into [Retail Store SA].dbo.store_order_details(
	 Order_ID,Amount, Quantity,StoreOrder_ID,Product_ID)
	
	select Order_ID,Amount, Quantity,StoreOrder_ID,Product_ID
	from [Retail Store].dbo.store_order_details
	where StoreOrder_ID in (select StoreOrder_ID from store_order)
end
Go

CREATE or Alter procedure FillStaginStorePaymentDetails as
	   begin

	  truncate table store_payment_details
 

	insert into [Retail Store SA].dbo.store_payment_details(
	 StorePayment_ID,NetAmount, StoreModeID, Store_ID)
	
	select  StorePayment_ID,NetAmount, StoreModeID, Store_ID
	from [Retail Store].dbo.store_payment_details
	where Store_ID is not NULL 
end
GO
CREATE or Alter procedure FillStaginStoreOrder as


	  truncate table store_order
 
	  begin
	insert into [Retail Store SA].dbo.store_order(
	StoreOrder_ID,Status, Supplier_ID, Store_ID, StorePayment_ID,Date)
	
	select StoreOrder_ID,Status, Supplier_ID, Store_ID, StorePayment_ID,Date
	from [Retail Store].dbo.store_order
	where Date is not null and Supplier_ID is not null and StorePayment_ID is not null and Store_ID is not null 
	and Status is not null and StorePayment_ID in (select StorePayment_ID from store_payment_details)

end
 
 go
CREATE or Alter procedure FillStaginStoreHasSupplier as
	  begin

	  truncate table store_has_Supplier
 

	insert into [Retail Store SA].dbo.store_has_Supplier(
	Store_Id,Supplier_ID)
	
	select Store_Id,Supplier_ID
	from [Retail Store].dbo.store_has_Supplier
end
GO

Create or Alter Procedure ETL as
begin
exec drop_const;

EXEC FillStaginAddress;
EXEC FillStaginStore;
EXEC FillStaginEmployee;
EXEC FillStaginCustomer;
Exec FillStaginCustomerPaymentMode;
EXEC FillStaginCustomerPaymentDetails;
EXEC FillStaginCustomerOrder;
EXEC FillStaginProductCategory;
EXEC FillStaginProductSubCategory;
EXEC FillStaginProduct;
EXEC FillStaginCustomerOrderDetails;
EXEC FillStaginSupplier;
EXEC FillStaginStorePaymentMode;
EXEC FillStaginStorePaymentDetails;
Exec FillStaginStoreOrder;
Exec FillStaginStoreOrderDetails;
EXEC FillStaginStoreHasSupplier;
EXEC FillStaginInventory;
EXEC FillStaginProductInventory;

exec add_const;
end
GO

exec etl;
--select * from [Retail store SA].dbo.store_payment_details


