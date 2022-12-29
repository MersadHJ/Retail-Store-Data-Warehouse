Create table Fact_trans_Sold(
[Customer_ID] [int] NOT NULL,
[Customer_Order_ID] int not null,
[Product_ID] int not null,
[Store_ID] int not null,
[Employee_Id] int not null,
[Date] int NOT NULL,
[DateTime] [Datetime] not null,
[Quantity] int Null,
[Total Amount] numeric(25,3) NULL,
[Amount Paid] numeric(25,3) NULL,
[Price] numeric(15,3) null,
[Status] varchar(15) null,
[Discount] int null,
[Payment Mode] [char](20) NULL,
[Margin] int null,
[Profit] numeric(25,3) null
)

Create table Fact_trans_Purchase(
[Store_ID] int not null,
[Store_Order_ID] int not null,
[Product_ID] int not null,
[Supplier_ID] int not null,
[Date] int NOT NULL,
[DateTime] [Datetime] not null,
[Quantity] int Null,
[Total Amount] numeric(25,3) NULL,
[Amount Paid] numeric(25,3) NULL,
[Price] numeric(15,3) null,
[Status] varchar(15) null,
[Discount] int null,
[Payment Mode] [char](20) NULL
)

Create table Fact_ACC_Product_Purchase(
[Store_ID] int not null,
[Product_ID] int not null,
[Supplier_ID] int not null,
[Total Purchased Quantity] int Null,
[Total Purchased Amount] numeric(25,3) NULL,
[Total Amount Average] numeric(25,3) NULL,
[Total Paid Amount] numeric(25,3) NULL,
[Total Paid Amount Average] numeric(25,3) NULL,
[Total Price Average] numeric(15,3) null,
[Average Discount] int null
)

Create table Fact_Monthly_Product_Purchase(
[Store_ID] int not null,
[Product_ID] int not null,
[Supplier_ID] int not null,
[Date] int NOT NULL,
[This Month Quantity] int Null,
[Quantity Till This Month] int Null,
[Total Amount] numeric(25,3) NULL,
[Average Amount]numeric(25,3) NULL,
[Total Paid Amount] numeric(25,3) NULL,
[Average Paid Amount] numeric(25,3) NULL,
[Price Average] numeric(15,3) null,
[Average Discount] int null
)
CREATE TABLE [dbo].[Fact_ACC_Product_Sold](
     product_ID [int]   NOT NULL,
     Store_ID [int]   NOT NULL,
     Employee_ID [int]   NOT NULL,
     TotalSoldQuantity int NULL,
     TotalSoldAmount numeric(25,3) NULL,
     TotalSoldAmountAVG numeric(25,3) NULL,
     TotalPaidAmount numeric(25,3) NULL,
     TotalPaidAmountAVG numeric(25,3) NULL,
     TotalPrice numeric(25,3) NULL,
     TotalPriceAverage numeric(25,3) NULL ,
     AverageDiscount numeric(5,2) NULL ,
     TotalProfit numeric(25,3) NULL ,
    );



CREATE TABLE [dbo].[Fact_Daily_Product_Sold](
     product_ID [int]   NOT NULL,
     Store_ID [int]   NOT NULL,
     Employee_ID [int]   NOT NULL,
     Date [int] Not NULL,
     ThisDayQuantity int NULL,
     QuantityTillThisDay int NULL,
     TotalAmount numeric(25,3) NULL,
     AverageAmount numeric(25,3) NULL,
     AmountPaid numeric(25,3) NULL,
     AverageAmountPaid numeric(25,3) NULL,
     Price numeric(25,3) NULL,
     AveragePrice numeric(25,3) NULL,
     AverageDiscount numeric(5,2) NULL ,
     Profit numeric(25,3) NULL ,
    );
	