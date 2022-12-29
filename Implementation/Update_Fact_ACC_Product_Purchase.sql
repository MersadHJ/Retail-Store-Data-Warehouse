

go
CREATE or alter PROCEDURE Update_Fact_ACC_Product_Purchase @from date, @to date
AS

truncate table Temp_Fact_ACC_Product_Purchase;


	insert into Temp_Fact_ACC_Product_Purchase(
		[Product_ID] ,
		[Supplier_ID],
		[Store_ID] ,
		[Total Purchased Quantity],
		[Total Purchased Amount],
		[Total Amount Average],
		[Total Paid Amount],
		[Total Paid Amount Average],
		[Total Price Average] ,
		[Average Discount]

	)
	select Product_ID , Supplier_ID, Store_ID,sum(Quantity), Sum([total Amount]),avg([total Amount]), Sum([amount paid]), avg([amount paid]), AVG(price), AVG(discount)
	from Fact_trans_Purchase
	where CONVERT(date, convert(char(8),Fact_trans_Purchase.date))   >=@from and CONVERT(date, convert(char(8),Fact_trans_Purchase.date))<= @to
	group by Product_ID , Supplier_ID, Store_ID
	
  insert into Fact_ACC_Product_Purchase
 select * from Temp_Fact_ACC_Product_Purchase

GO


exec Update_Fact_ACC_Product_Purchase @from = '2011-04-03',@to='2013-04-03' 						