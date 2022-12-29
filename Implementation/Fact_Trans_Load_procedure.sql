CREATE or Alter PROCEDURE Fact_Trans_Sold_Load @to Date
AS
begin
DECLARE @from Date 

SELECT @from = max(datetime) from [Retail Store DW].dbo.fact_trans_Sold
 SET @from  = DATEADD(day,1,@from);

if(@from is null)
begin
    SELECT @from = min(date) from [Retail store SA].dbo.store_order
end

if(@from is null)
begin
   return;
end
truncate table temp_fact_trans_sold_1;
insert into log (message) values ('After truncate Fact Trans sold temp table');

WHILE ( @from <= @to)
BEGIN
insert into temp_fact_trans_sold_1
	select co.[Customer_ID] ,dco.customerorder_id_surrogateKey,cod.[Product_ID] ,co.[Store_ID] ,[Employee_Id] ,
CONVERT(CHAR(8),co.Date,112) as Date ,[FullDateAlternateKey] as [Datetime],[Quantity],Amount as [total amount],
[Amount] * (1-(CONVERT(DECIMAL(25,2),[Discount] ) /100))as AmountPaid ,[Price] ,co.[Status] ,[Discount] ,[Mode] as [PaymentMode],[Margin] ,[Amount]*(margin-discount)/100 as[Profit]
from  [Retail store SA].dbo.customer_order co 
join [Retail store SA].dbo.customer_order_details as cod on co.CustomerOrder_ID = cod.CustomerOrder_ID
join [Retail store SA].dbo.product p on p.Product_ID = cod.Product_ID
join Dim_Date d on d.TimeKey = CONVERT(CHAR(8),co.Date,112) 
join [Retail store SA].dbo.customer_payment_details cpd on cpd.CustomerPayment_ID= co.Payment_ID
join [Retail store SA].dbo.customerpaymentmode cpm on cpm.CustomerModeID=cpd.CustomerModeID
Join Dim_CustomerOrder dco on dco.CustomerOrder_ID=co.CustomerOrder_ID
where co.Date>= @from and co.Date<DATEADD(day,1,@from) and CurrentFlag=1
order by Datetime,co.CustomerOrder_ID
insert into log (message) values ('After insert into temp_fact_trans_sold_1');

    SET @from  = DATEADD(day,1,@from);
END
insert into Fact_Trans_sold Select * from temp_fact_trans_sold_1
insert into log (message) values ('After insert into Fact_Trans_sold');

end


