 use [Retail Store DW]

go
CREATE or alter PROCEDURE Update_Fact_Monthly_Product_Purchase @from date, @to date
AS



truncate table Temp_Fact_Monthly_Product_Purchase

DECLARE @CurrentDate date;

SET @CurrentDate = @from;
SET @CurrentDate = Convert(Date,FORMAT(@CurrentDate, 'yyyyMM01'),121);


while (@CurrentDate <= @to)
begin

truncate table Temp_Fact_Monthly_Product_Purchase_1
truncate table Temp_Fact_Monthly_Product_Purchase_2

insert into Temp_Fact_Monthly_Product_Purchase_1(
	Product_ID, Supplier_ID, Store_ID,[This Month Quantity],Date,[Total Amount] ,[Total Paid Amount] ,
	AverageDiscount, PriceAverage
)

select Product_ID, Supplier_ID, Store_ID, sum(Quantity) as ThisMonthQuantity, CONVERT(CHAR(8),@CurrentDate,112)  as Date, sum([Total Amount]) as TotalAmount,
	sum([amount Paid]) as TotalAmountPaid, avg(Discount) as AverageDiscount , avg(Price) as PriceAverage

from Fact_trans_Purchase
where FORMAT([datetime], 'yyyy-MM-01')  >= @CurrentDate  and FORMAT([datetime], 'yyyy-MM-01') < DATEADD(month, +1, @CurrentDate)
group by Product_ID, Supplier_ID, Store_ID

-- Number of months that are passed
declare @minMonth date;
declare @MonthsPassed int;
select @minMonth = min(CONVERT(date, convert(char(8),date))) from Fact_trans_Purchase
select @MonthsPassed = DATEDIFF(month,  DATEADD(month, -1, @minMonth), @currentDate)

-- prev month date
insert into Temp_Fact_Monthly_Product_Purchase_2
(  
[Store_ID],
[Product_ID] ,
[Supplier_ID] ,
[Quantity till This month],
[Average Amount] ,
[Average Paid Amount],
[Average Discount] ,
[Price Average]
)
select Store_ID,Product_ID, Supplier_ID,[Quantity till This month], [Average Amount] * @MonthsPassed as [Average Amount], [Average Paid Amount] * @MonthsPassed as [Average Paid Amount],[Average Discount]* @MonthsPassed as [Average Discount],[Price Average] * @MonthsPassed as [Price Average] 
from Fact_Monthly_Product_Purchase
where CONVERT(date, convert(char(8),date))  =  DATEADD(month, -1, @CurrentDate)

insert into Temp_Fact_Monthly_Product_Purchase(


[Product_ID] ,
[Supplier_ID] ,
[Store_ID],
[Date] ,
[This Month Quantity] ,

[Total Amount],
[Total Paid Amount] ,
[Quantity Till This Month] ,
[Average Amount],
[Average Paid Amount] ,
[Average Discount], 
[Price Average] 
)
select   t1.product_id, t1.Supplier_ID,t1.store_id, Date, t1.[this month quantity],
t1.[Total Amount], t1.[Total Paid Amount],
(isnull (t2.[Quantity till This month], 0) + [this month quantity]) as [Quantity till This month],
(isnull (t2.[Average Amount], 0) + [Total Paid Amount] / (@MonthsPassed + 1)) as [Average Amount],
(isnull (t2.[Average Paid Amount], 0) + [Total Amount] / (@MonthsPassed + 1)) as [Average Paid Amount],
(isnull (t2.[Average Discount], 0) + AverageDiscount / (@MonthsPassed + 1)) as [Average Discount],
(isnull (t2.[Price Average], 0) + PriceAverage / (@MonthsPassed + 1)) as [Price Average]	 
from Temp_Fact_Monthly_Product_Purchase_1 as t1 left join Temp_Fact_Monthly_Product_Purchase_2 as t2
on t1.Product_ID = t2.product_id and t1.store_ID = t2.store_id and t1.Supplier_id = t2.supplier_id
order by product_ID, date


Set @CurrentDate = DATEADD(month, +1, @CurrentDate)
end



insert into Fact_Monthly_Product_Purchase 
(
  [Product_ID] ,
[Supplier_ID] ,
[Store_ID],
[Date] ,
[This Month Quantity] ,

[Total Amount],
[Total Paid Amount] ,
[Quantity Till This Month] ,
[Average Amount],
[Average Paid Amount] ,
[Average Discount], 
[Price Average]

)
select 
[Product_ID] ,
[Supplier_ID] ,
[Store_ID],
[Date] ,
[This Month Quantity] ,

[Total Amount],
[Total Paid Amount] ,
[Quantity Till This Month] ,
[Average Amount],
[Average Paid Amount] ,
[Average Discount], 
[Price Average]


 from Temp_Fact_Monthly_Product_Purchase


go
-- ta mah sevom rikhte shode
exec Update_Fact_Monthly_Product_Purchase @from='2011-02-03' ,@to='2011-03-01'







