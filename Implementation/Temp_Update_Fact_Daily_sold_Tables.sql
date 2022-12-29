
CREATE TABLE [dbo].temp_fact_daily_sold_1(
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
	
CREATE TABLE [dbo].temp_fact_daily_sold_2(
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
	CREATE TABLE [dbo].temp_fact_daily_sold_3(
     product_ID [int]   NOT NULL,
     Store_ID [int]   NOT NULL,
     Employee_ID [int]   NOT NULL,
     Date [int] Not NULL,
     ThisDayQuantity int NULL,
     TotalAmount numeric(25,3) NULL,
     AmountPaid numeric(25,3) NULL,
     Price numeric(25,3) NULL,
	
     AverageDiscount numeric(5,2) NULL ,
     Profit numeric(25,3) NULL ,
    );

	
CREATE TABLE [dbo].temp_fact_daily_sold_4(
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
	