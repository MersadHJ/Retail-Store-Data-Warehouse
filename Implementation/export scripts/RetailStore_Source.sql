USE [Retail store]
GO
/****** Object:  Table [dbo].[customer_payment_details]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_payment_details](
	[CustomerPayment_ID] [int] IDENTITY(1,1) NOT NULL,
	[NetAmount] [numeric](14, 2) NULL,
	[CustomerModeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerPayment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_order]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_order](
	[CustomerOrder_ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](10) NULL,
	[Customer_ID] [int] NULL,
	[Payment_ID] [int] NULL,
	[Employee_ID] [int] NULL,
	[Date] [date] NULL,
	[Store_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerOrder_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_order_details]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_order_details](
	[CustomerOrderDetails_ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [numeric](14, 2) NULL,
	[Quantity] [int] NOT NULL,
	[CustomerOrder_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerOrderDetails_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ttt]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ttt] as(select co.CustomerOrder_ID,SUM(amount)as amount
from customer_order co
join customer_order_details as cod
on cod.CustomerOrder_ID = co.CustomerOrder_ID
join customer_payment_details
on customer_payment_details.CustomerPayment_ID =co.Payment_ID
group by co.CustomerOrder_ID
)
GO
/****** Object:  Table [dbo].[store_order]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store_order](
	[StoreOrder_ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [char](20) NULL,
	[Supplier_ID] [int] NULL,
	[Store_ID] [int] NULL,
	[StorePayment_ID] [int] NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreOrder_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[store_order_details]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store_order_details](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [numeric](14, 2) NULL,
	[Quantity] [int] NOT NULL,
	[StoreOrder_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[temp_amount]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[temp_amount] as(
select co.StoreOrder_ID ,SUM(amount) as amount
from store_order co
join store_order_details as cod
on cod.StoreOrder_ID = co.StoreOrder_ID
group by co.StoreOrder_ID
)
GO
/****** Object:  Table [dbo].[address]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[Address_Field1] [varchar](50) NOT NULL,
	[Address_Field2] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Zipcode] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PhoneNumber] [char](15) NULL,
	[Address_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customerpaymentmode]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerpaymentmode](
	[CustomerModeID] [int] IDENTITY(1,1) NOT NULL,
	[Mode] [char](20) NOT NULL,
	[Discount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerModeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[Employee_ID] [int] IDENTITY(1,1) NOT NULL,
	[Store_ID] [int] NULL,
	[First_Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PhoneNumber] [char](15) NULL,
	[Address_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory](
	[Inventory_ID] [int] IDENTITY(1,1) NOT NULL,
	[Store_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Inventory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NULL,
	[Price] [numeric](14, 2) NOT NULL,
	[Manufactured_Date] [date] NULL,
	[Expiry_Date] [date] NULL,
	[Margin] [int] NULL,
	[Subcategory_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_inventory]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_inventory](
	[Inventory_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Inventory_ID] ASC,
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_subcategory]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_subcategory](
	[Subcategory_ID] [int] IDENTITY(1,1) NOT NULL,
	[SubcategoryName] [varchar](50) NOT NULL,
	[Category_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Subcategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productcategory]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productcategory](
	[Category_ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[store]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store](
	[Store_ID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[Address_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Store_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[store_has_supplier]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store_has_supplier](
	[Store_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Store_ID] ASC,
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[store_payment_details]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[store_payment_details](
	[StorePayment_ID] [int] IDENTITY(1,1) NOT NULL,
	[NetAmount] [numeric](14, 2) NULL,
	[StoreModeID] [int] NULL,
	[Store_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StorePayment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storepaymentmode]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storepaymentmode](
	[StoreModeID] [int] IDENTITY(1,1) NOT NULL,
	[Mode] [char](20) NOT NULL,
	[Discount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreModeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier](
	[Supplier_ID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [varchar](50) NOT NULL,
	[Address_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp]    Script Date: 6/28/2022 10:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp](
	[cat_name] [varchar](60) NULL,
	[sub_cat_name] [varchar](59) NULL,
	[counts] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[address] ADD  DEFAULT (NULL) FOR [Address_Field2]
GO
ALTER TABLE [dbo].[customer] ADD  DEFAULT (NULL) FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[customer] ADD  DEFAULT (NULL) FOR [Address_ID]
GO
ALTER TABLE [dbo].[customer_order] ADD  DEFAULT (NULL) FOR [Status]
GO
ALTER TABLE [dbo].[customer_order] ADD  DEFAULT (NULL) FOR [Customer_ID]
GO
ALTER TABLE [dbo].[customer_order] ADD  DEFAULT (NULL) FOR [Payment_ID]
GO
ALTER TABLE [dbo].[customer_order] ADD  DEFAULT (NULL) FOR [Employee_ID]
GO
ALTER TABLE [dbo].[customer_order_details] ADD  DEFAULT (NULL) FOR [Amount]
GO
ALTER TABLE [dbo].[customer_payment_details] ADD  DEFAULT (NULL) FOR [NetAmount]
GO
ALTER TABLE [dbo].[customer_payment_details] ADD  DEFAULT (NULL) FOR [CustomerModeID]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT (NULL) FOR [PhoneNumber]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT (NULL) FOR [Address_ID]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (NULL) FOR [Manufactured_Date]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (NULL) FOR [Expiry_Date]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (NULL) FOR [Margin]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT (NULL) FOR [Subcategory_ID]
GO
ALTER TABLE [dbo].[store_order] ADD  DEFAULT (NULL) FOR [Status]
GO
ALTER TABLE [dbo].[store_order] ADD  DEFAULT (NULL) FOR [Supplier_ID]
GO
ALTER TABLE [dbo].[store_order] ADD  DEFAULT (NULL) FOR [Store_ID]
GO
ALTER TABLE [dbo].[store_order] ADD  DEFAULT (NULL) FOR [StorePayment_ID]
GO
ALTER TABLE [dbo].[store_order_details] ADD  DEFAULT (NULL) FOR [Amount]
GO
ALTER TABLE [dbo].[store_payment_details] ADD  DEFAULT (NULL) FOR [NetAmount]
GO
ALTER TABLE [dbo].[store_payment_details] ADD  DEFAULT (NULL) FOR [StoreModeID]
GO
ALTER TABLE [dbo].[store_payment_details] ADD  DEFAULT (NULL) FOR [Store_ID]
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_ID_Address_ID] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[address] ([Address_ID])
GO
ALTER TABLE [dbo].[customer] CHECK CONSTRAINT [FK_Customer_ID_Address_ID]
GO
ALTER TABLE [dbo].[customer_order]  WITH CHECK ADD FOREIGN KEY([Store_ID])
REFERENCES [dbo].[store] ([Store_ID])
GO
ALTER TABLE [dbo].[customer_order]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrder_ID_Customer_ID] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[customer] ([Customer_ID])
GO
ALTER TABLE [dbo].[customer_order] CHECK CONSTRAINT [FK_CustomerOrder_ID_Customer_ID]
GO
ALTER TABLE [dbo].[customer_order]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrder_ID_CustomerPayment_ID] FOREIGN KEY([Payment_ID])
REFERENCES [dbo].[customer_payment_details] ([CustomerPayment_ID])
GO
ALTER TABLE [dbo].[customer_order] CHECK CONSTRAINT [FK_CustomerOrder_ID_CustomerPayment_ID]
GO
ALTER TABLE [dbo].[customer_order]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrder_ID_Employee_ID] FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[employee] ([Employee_ID])
GO
ALTER TABLE [dbo].[customer_order] CHECK CONSTRAINT [FK_CustomerOrder_ID_Employee_ID]
GO
ALTER TABLE [dbo].[customer_order_details]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrder_ID_CustomerOrderDetails_ID] FOREIGN KEY([CustomerOrder_ID])
REFERENCES [dbo].[customer_order] ([CustomerOrder_ID])
GO
ALTER TABLE [dbo].[customer_order_details] CHECK CONSTRAINT [FK_CustomerOrder_ID_CustomerOrderDetails_ID]
GO
ALTER TABLE [dbo].[customer_order_details]  WITH CHECK ADD  CONSTRAINT [FK_Product_ID_CustomerOrderDetails_ID] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[product] ([Product_ID])
GO
ALTER TABLE [dbo].[customer_order_details] CHECK CONSTRAINT [FK_Product_ID_CustomerOrderDetails_ID]
GO
ALTER TABLE [dbo].[customer_payment_details]  WITH CHECK ADD  CONSTRAINT [FK_CustomerModeID_CustomerPayment_ID] FOREIGN KEY([CustomerModeID])
REFERENCES [dbo].[customerpaymentmode] ([CustomerModeID])
GO
ALTER TABLE [dbo].[customer_payment_details] CHECK CONSTRAINT [FK_CustomerModeID_CustomerPayment_ID]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_ID_Address_ID] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[address] ([Address_ID])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_Employee_ID_Address_ID]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_ID_Store_ID] FOREIGN KEY([Store_ID])
REFERENCES [dbo].[store] ([Store_ID])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_Employee_ID_Store_ID]
GO
ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  CONSTRAINT [FK_Store_ID_Inventory_ID] FOREIGN KEY([Store_ID])
REFERENCES [dbo].[store] ([Store_ID])
GO
ALTER TABLE [dbo].[inventory] CHECK CONSTRAINT [FK_Store_ID_Inventory_ID]
GO
ALTER TABLE [dbo].[product_inventory]  WITH CHECK ADD  CONSTRAINT [FK_Product_Inventory_Inventory_ID] FOREIGN KEY([Inventory_ID])
REFERENCES [dbo].[inventory] ([Inventory_ID])
GO
ALTER TABLE [dbo].[product_inventory] CHECK CONSTRAINT [FK_Product_Inventory_Inventory_ID]
GO
ALTER TABLE [dbo].[product_inventory]  WITH CHECK ADD  CONSTRAINT [FK_Product_Inventory_Product_ID] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[product] ([Product_ID])
GO
ALTER TABLE [dbo].[product_inventory] CHECK CONSTRAINT [FK_Product_Inventory_Product_ID]
GO
ALTER TABLE [dbo].[product_subcategory]  WITH CHECK ADD  CONSTRAINT [FK_Subcategory_ID_Category_ID] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[productcategory] ([Category_ID])
GO
ALTER TABLE [dbo].[product_subcategory] CHECK CONSTRAINT [FK_Subcategory_ID_Category_ID]
GO
ALTER TABLE [dbo].[store]  WITH CHECK ADD  CONSTRAINT [FK_Store_ID_Address_ID] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[address] ([Address_ID])
GO
ALTER TABLE [dbo].[store] CHECK CONSTRAINT [FK_Store_ID_Address_ID]
GO
ALTER TABLE [dbo].[store_has_supplier]  WITH CHECK ADD  CONSTRAINT [FK_store_has_supplier_Store_ID] FOREIGN KEY([Store_ID])
REFERENCES [dbo].[store] ([Store_ID])
GO
ALTER TABLE [dbo].[store_has_supplier] CHECK CONSTRAINT [FK_store_has_supplier_Store_ID]
GO
ALTER TABLE [dbo].[store_has_supplier]  WITH CHECK ADD  CONSTRAINT [FK_store_has_supplier_Supplier_ID] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[supplier] ([Supplier_ID])
GO
ALTER TABLE [dbo].[store_has_supplier] CHECK CONSTRAINT [FK_store_has_supplier_Supplier_ID]
GO
ALTER TABLE [dbo].[store_order]  WITH CHECK ADD  CONSTRAINT [FK_StoreOrder_ID_Store_ID] FOREIGN KEY([Store_ID])
REFERENCES [dbo].[store] ([Store_ID])
GO
ALTER TABLE [dbo].[store_order] CHECK CONSTRAINT [FK_StoreOrder_ID_Store_ID]
GO
ALTER TABLE [dbo].[store_order]  WITH CHECK ADD  CONSTRAINT [FK_StoreOrder_ID_Supplier_ID] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[supplier] ([Supplier_ID])
GO
ALTER TABLE [dbo].[store_order] CHECK CONSTRAINT [FK_StoreOrder_ID_Supplier_ID]
GO
ALTER TABLE [dbo].[store_order]  WITH CHECK ADD  CONSTRAINT [FK_StorePayment_ID_StoreOrder_ID] FOREIGN KEY([StorePayment_ID])
REFERENCES [dbo].[store_payment_details] ([StorePayment_ID])
GO
ALTER TABLE [dbo].[store_order] CHECK CONSTRAINT [FK_StorePayment_ID_StoreOrder_ID]
GO
ALTER TABLE [dbo].[store_order_details]  WITH CHECK ADD  CONSTRAINT [FK_StoreOrder_ID_Order_ID] FOREIGN KEY([StoreOrder_ID])
REFERENCES [dbo].[store_order] ([StoreOrder_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[store_order_details] CHECK CONSTRAINT [FK_StoreOrder_ID_Order_ID]
GO
ALTER TABLE [dbo].[store_payment_details]  WITH CHECK ADD  CONSTRAINT [FK_StoreModeID_StorePayment_ID] FOREIGN KEY([StoreModeID])
REFERENCES [dbo].[storepaymentmode] ([StoreModeID])
GO
ALTER TABLE [dbo].[store_payment_details] CHECK CONSTRAINT [FK_StoreModeID_StorePayment_ID]
GO
ALTER TABLE [dbo].[store_payment_details]  WITH CHECK ADD  CONSTRAINT [FK_StorePayment_ID_Store_ID] FOREIGN KEY([Store_ID])
REFERENCES [dbo].[store] ([Store_ID])
GO
ALTER TABLE [dbo].[store_payment_details] CHECK CONSTRAINT [FK_StorePayment_ID_Store_ID]
GO
ALTER TABLE [dbo].[supplier]  WITH CHECK ADD  CONSTRAINT [FK_supplier_ID_Address_ID] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[address] ([Address_ID])
GO
ALTER TABLE [dbo].[supplier] CHECK CONSTRAINT [FK_supplier_ID_Address_ID]
GO
