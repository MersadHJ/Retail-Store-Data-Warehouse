
go
CREATE or alter PROCEDURE Update_Fact_Trans_Purchase @to date
AS


DECLARE @from date;

SELECT @from = max(datetime) from [Retail Store DW].dbo.fact_trans_Purchase


if(@from is null)
begin
	SELECT @from = min(date) from [Retail store SA].dbo.store_order
end

else
begin
Set @from = DATEADD(day, +1, @from)
end

if(@from is null)
begin
   return;
end

DECLARE @CurrentDate date;

SET @CurrentDate = @from;
truncate table Temp_Fact_Trans_Purchase;

while (@CurrentDate <= @to)
begin
	insert into Temp_Fact_Trans_Purchase(
		[Store_ID] ,
		[Store_Order_ID] ,
		[Product_ID] ,
		[Supplier_ID],
		[Date] ,
		[DateTime] ,
		[Quantity] ,
		[Total Amount] ,
		[Amount Paid] ,
		[Price] ,
		[Status] ,
		[Discount],
		[Payment Mode] 
	)
	select so.[Store_ID],sod.[StoreOrder_ID] ,p.[Product_ID] ,dso.[Supplier_ID], CONVERT(CHAR(8),so.[Date],112) as [Date] ,so.[Date]  as [DateTime],[Quantity] ,
	[Amount] as [Total Amount], [Amount] * (1-(CONVERT(DECIMAL(25,2),[Discount] ) /100)) as [Amount Paid], [Price], so.[Status], [Discount], [Mode] 

	from [Retail store SA].[dbo].store_order_details as sod
	inner join [Retail store SA].[dbo].store_order as so on sod.StoreOrder_ID = so.StoreOrder_ID
	inner join [Retail store SA].[dbo].product as p on sod.Product_ID = p.Product_ID
	inner join [Retail store SA].[dbo].store_payment_details as spd on (so.StorePayment_ID = spd.StorePayment_ID)
	inner join [Retail store SA].[dbo].storepaymentmode as spm on (spd.StoreModeID = spm.StoreModeID)
	inner Join Dim_StoreOrder dso on dso.StoreOrder_ID = so.StoreOrder_ID
	where so.Date = @CurrentDate and CurrentFlag=1




	Set @CurrentDate = DATEADD(day, +1, @CurrentDate)
end



insert into Fact_trans_Purchase 
select * from Temp_Fact_Trans_Purchase




GO;
										
exec Update_Fact_Trans_Purchase  @to='2011-01-03'
