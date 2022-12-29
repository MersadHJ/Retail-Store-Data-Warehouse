Create table Temp_Fact_Monthly_Product_Purchase(
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


create table Temp_Fact_Monthly_Product_Purchase_2(
[Store_ID] int not null,
[Product_ID] int not null,
[Supplier_ID] int not null,
[Quantity till This month] int not null,
[Average Amount] numeric(25,3) NOT NULL,
[Average Paid Amount] numeric(25,3) Null,
[Average Discount] numeric(25,3) NULL,
[Price Average] numeric(25,3) NULL,
)

create table Temp_Fact_Monthly_Product_Purchase_1(
  [Store_ID] int not null,
[Product_ID] int not null,
[Supplier_ID] int not null,
[Date] int NOT NULL,
[This Month Quantity] int Null,
[Total Amount] numeric(25,3) NULL,
[Total Paid Amount] numeric(25,3) NULL,
AverageDiscount numeric(25,3) NULL,
PriceAverage numeric(25,3) NULL,
)