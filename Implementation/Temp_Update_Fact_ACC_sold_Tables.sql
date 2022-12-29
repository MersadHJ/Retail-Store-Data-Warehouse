CREATE TABLE [dbo].temp_fact_acc_sold_1(
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
);

CREATE TABLE [dbo].temp_fact_acc_sold_2(
     product_ID [int]   NOT NULL,
     Store_ID [int]   NOT NULL,
     Employee_ID [int]   NOT NULL,
     TotalSoldQuantity int NULL,
     TotalSoldAmount numeric(25,3) NULL,
     TotalSoldAmountAVG numeric(25,3) NULL,
     TotalPaidAmount numeric(25,3) NULL,
     TotalPaidAmountAVG numeric(25,3) NULL,
     TotalPriceAverage numeric(25,3) NULL ,
     AverageDiscount numeric(5,2) NULL ,
     TotalProfit numeric(25,3) NULL ,
);



