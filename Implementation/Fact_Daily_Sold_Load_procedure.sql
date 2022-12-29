CREATE or Alter PROCEDURE Fact_Daily_Product_Sold_Load @from Date,@to Date
AS
begin
Declare @Current Date= @from;
truncate table temp_fact_daily_sold_4;
insert into log (message) values ('After Truncate sold Daily Fact temp 4');

WHILE ( @Current<= @to)
BEGIN
truncate table temp_fact_daily_sold_1;
truncate table temp_fact_daily_sold_2;
truncate table temp_fact_daily_sold_3;
insert into log (message) values ('After truncate other sold daily fact temp tables');

Declare @Date_difference int = DATEDIFF(DAY,  DATEADD(day, -1, @from), @Current);

insert into temp_fact_daily_sold_1 --yesterdays sale information
	select Product_ID,Store_id,Employee_ID,Date,ThisDayQuantity,QuantityTillThisDay,TotalAmount,AverageAmount,AmountPaid,
	AverageAmountPaid,Price,AveragePrice,AverageDiscount,Profit
	from fact_Daily_product_Sold
	where Date = CONVERT(CHAR(8),DateAdd(day,-1,@Current),112);

insert into log (message) values ('After insert into temp_fact_daily_sold_1');


insert into temp_fact_daily_sold_2 --current day sale information
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
where co.Date>= @Current and co.Date<DATEADD(day,1,@Current) and CurrentFlag=1

insert into log (message) values ('After insert into temp_fact_daily_sold_2');

insert into temp_fact_daily_sold_3
select t2.Product_Id,t2.Store_Id,t2.Employee_ID,max(Date),SUM(Quantity) as ThisDayQuantity,SUM([Total amount]) as [Total Amount],SUM([Amount Paid])as [Amount Paid],Max(Price) as Price,
Avg(Discount)as AverageDiscount,SUM(Profit) as Profit
From temp_fact_daily_sold_2 t2
Group by t2.Product_Id,t2.Store_Id,t2.Employee_ID
insert into log (message) values ('After insert into temp_fact_daily_sold_3');


insert into temp_fact_daily_sold_4
select t3.product_ID,t3.Store_ID,t3.Employee_ID,t3.Date,t3.ThisDayQuantity,t3.ThisDayQuantity + isnull(t1.QuantityTillThisDay,0) as QuantityTillThisDay,
 t3.TotalAmount+isnull(t1.TotalAmount,0) as TotalAmount,
( isnull(t1.AverageAmount,t3.TotalAmount)*@Date_difference+t3.TotalAmount)/(@Date_difference+1) as AverageAmount,
isnull(t1.AmountPaid,0)+t3.[AmountPaid] as AmountPaid,
( isnull(t1.AverageAmountpaid,t3.[AmountPaid])*@Date_difference+t3.[AmountPaid])/(@Date_difference+1)as AverageAmountPaid,
t3.Price,
( isnull(t1.AveragePrice,t3.price)*@Date_difference+t3.price)/(@Date_difference+1)as AveragePrice,
( isnull(t1.AverageDiscount,t3.AverageDiscount)*@Date_difference+t3.AverageDiscount)/(@Date_difference+1)as AverageDiscount,
isnull(t1.Profit,0)+t3.profit as profit
from temp_fact_daily_sold_3 t3
left join temp_fact_daily_sold_1 t1
on t3.Product_ID=t1.product_id and t3.Store_id=t1.Store_id and t3.Employee_ID=t1.Employee_ID
insert into log (message) values ('After insert into temp_fact_daily_sold_4');

    SET @Current  = DATEADD(day,1,@Current);
END
insert into fact_daily_product_sold
select * from temp_fact_daily_sold_4
insert into log (message) values ('After insert into Fact Daily Product Sold');

end;

