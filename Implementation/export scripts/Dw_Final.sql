USE [Retail Store DW]
GO
/****** Object:  Table [dbo].[Dim_Customer]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Customer](
	[Customer_ID] [int] NOT NULL,
	[Customer Name] [varchar](120) NOT NULL,
	[PhoneNumber] [char](18) NOT NULL,
	[Address_Field1] [varchar](60) NOT NULL,
	[Address_Field2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_CustomerOrder]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_CustomerOrder](
	[CustomerOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerFirstName] [varchar](60) NOT NULL,
	[CustomerLastName] [varchar](60) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NULL,
	[CustomerPayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[customerorder_id_surrogateKey] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_CustomOrder]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_CustomOrder](
	[CustomerOrder_ID_SurrogateKey] [int] NOT NULL,
	[CustomerOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerFirstName] [varchar](60) NOT NULL,
	[CustomerLastName] [varchar](60) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[CustomerPayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[TimeKey] [float] NULL,
	[FullDateAlternateKey] [datetime] NULL,
	[PersianFullDateAlternateKey] [nvarchar](255) NULL,
	[DayNumberOfWeek] [float] NULL,
	[PersianDayNumberOfWeek] [float] NULL,
	[EnglishDayNameOfWeek] [nvarchar](255) NULL,
	[PersianDayNameOfWeek] [nvarchar](255) NULL,
	[DayNumberOfMonth] [float] NULL,
	[PersianDayNumberOfMonth] [float] NULL,
	[DayNumberOfYear] [float] NULL,
	[PersianDayNumberOfYear] [float] NULL,
	[WeekNumberOfYear] [float] NULL,
	[PersianWeekNumberOfYear] [float] NULL,
	[EnglishMonthName] [nvarchar](255) NULL,
	[PersianMonthName] [nvarchar](255) NULL,
	[MonthNumberOfYear] [float] NULL,
	[PersianMonthNumberOfYear] [float] NULL,
	[CalendarQuarter] [float] NULL,
	[PersianCalendarQuarter] [float] NULL,
	[CalendarYear] [float] NULL,
	[PersianCalendarYear] [float] NULL,
	[CalendarSemester] [float] NULL,
	[PersianCalendarSemester] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Employee]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Employee](
	[Employee_ID] [int] NOT NULL,
	[Name] [varchar](110) NOT NULL,
	[Current_Store_ID] [int] NOT NULL,
	[Previous_Store_ID] [int] NULL,
	[Effective_Date] [datetime] NOT NULL,
	[PhoneNumber] [char](15) NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Payment]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Payment](
	[PaymentID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Product]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Product](
	[Product_ID] [int] NOT NULL,
	[ProductName] [varchar](120) NOT NULL,
	[Price] [numeric](15, 3) NOT NULL,
	[Manufactured_Date] [int] NULL,
	[Expiry_Date] [int] NULL,
	[Subcategory_ID] [int] NOT NULL,
	[SubcategoryName] [varchar](60) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Category] [varchar](60) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Store]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Store](
	[Store_ID] [int] NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[Address_Field1] [varchar](60) NOT NULL,
	[Address_Field2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_StoreOrder]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_StoreOrder](
	[StoreOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NULL,
	[StorePayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL,
	[StoreOrder_id_surrogateKey] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_SubCategory]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_SubCategory](
	[Subcategory_ID] [int] NOT NULL,
	[SubcategoryName] [varchar](60) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Category_Name] [varchar](60) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Supplier]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Supplier](
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_ACC_Product_Purchase]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_ACC_Product_Purchase](
	[Store_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[Total Purchased Quantity] [int] NULL,
	[Total Purchased Amount] [numeric](25, 3) NULL,
	[Total Amount Average] [numeric](25, 3) NULL,
	[Total Paid Amount] [numeric](25, 3) NULL,
	[Total Paid Amount Average] [numeric](25, 3) NULL,
	[Total Price Average] [numeric](15, 3) NULL,
	[Average Discount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_ACC_Product_Sold]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_ACC_Product_Sold](
	[product_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[TotalSoldQuantity] [int] NULL,
	[TotalSoldAmount] [numeric](25, 3) NULL,
	[TotalSoldAmountAVG] [numeric](25, 3) NULL,
	[TotalPaidAmount] [numeric](25, 3) NULL,
	[TotalPaidAmountAVG] [numeric](25, 3) NULL,
	[TotalPrice] [numeric](25, 3) NULL,
	[TotalPriceAverage] [numeric](25, 3) NULL,
	[AverageDiscount] [numeric](5, 2) NULL,
	[TotalProfit] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Daily_Product_Sold]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Daily_Product_Sold](
	[product_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[ThisDayQuantity] [int] NULL,
	[QuantityTillThisDay] [int] NULL,
	[TotalAmount] [numeric](25, 3) NULL,
	[AverageAmount] [numeric](25, 3) NULL,
	[AmountPaid] [numeric](25, 3) NULL,
	[AverageAmountPaid] [numeric](25, 3) NULL,
	[Price] [numeric](25, 3) NULL,
	[AveragePrice] [numeric](25, 3) NULL,
	[AverageDiscount] [numeric](5, 2) NULL,
	[Profit] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Monthly_Product_Purchase]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Monthly_Product_Purchase](
	[Store_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[This Month Quantity] [int] NULL,
	[Quantity Till This Month] [int] NULL,
	[Total Amount] [numeric](25, 3) NULL,
	[Average Amount] [numeric](25, 3) NULL,
	[Total Paid Amount] [numeric](25, 3) NULL,
	[Average Paid Amount] [numeric](25, 3) NULL,
	[Price Average] [numeric](15, 3) NULL,
	[Average Discount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_trans_Purchase]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_trans_Purchase](
	[Store_ID] [int] NOT NULL,
	[Store_Order_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Quantity] [int] NULL,
	[Total Amount] [numeric](25, 3) NULL,
	[Amount Paid] [numeric](25, 3) NULL,
	[Price] [numeric](15, 3) NULL,
	[Status] [varchar](15) NULL,
	[Discount] [int] NULL,
	[Payment Mode] [char](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_trans_Sold]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_trans_Sold](
	[Customer_ID] [int] NOT NULL,
	[Customer_Order_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Employee_Id] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Quantity] [int] NULL,
	[Total Amount] [numeric](25, 3) NULL,
	[Amount Paid] [numeric](25, 3) NULL,
	[Price] [numeric](15, 3) NULL,
	[Status] [varchar](15) NULL,
	[Discount] [int] NULL,
	[Payment Mode] [char](20) NULL,
	[Margin] [int] NULL,
	[Profit] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Log_ID] [int] IDENTITY(1,1) NOT NULL,
	[LogTime] [datetime] NOT NULL,
	[ProcedureName] [nvarchar](255) NULL,
	[Message] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Log_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Dim_Customer]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Dim_Customer](
	[Customer_ID] [int] NOT NULL,
	[Customer Name] [varchar](120) NOT NULL,
	[PhoneNumber] [char](18) NOT NULL,
	[Address_Field1] [varchar](60) NOT NULL,
	[Address_Field2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Dim_CustomerOrder]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Dim_CustomerOrder](
	[CustomerOrder_ID_SurrogateKey] [int] NOT NULL,
	[CustomerOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerFirstName] [varchar](60) NOT NULL,
	[CustomerLastName] [varchar](60) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[CustomerPayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Dim_Employee]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Dim_Employee](
	[Employee_ID] [int] NOT NULL,
	[Name] [varchar](110) NOT NULL,
	[Current_Store_ID] [int] NOT NULL,
	[Previous_Store_ID] [int] NULL,
	[Effective_Date] [datetime] NOT NULL,
	[PhoneNumber] [char](15) NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Dim_Payment]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Dim_Payment](
	[PaymentID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Dim_Product]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Dim_Product](
	[Product_ID] [int] NOT NULL,
	[ProductName] [varchar](120) NOT NULL,
	[Price] [numeric](15, 3) NOT NULL,
	[Manufactured_Date] [int] NULL,
	[Expiry_Date] [int] NULL,
	[Subcategory_ID] [int] NOT NULL,
	[SubcategoryName] [varchar](60) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Category] [varchar](60) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Dim_Store]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Dim_Store](
	[Store_ID] [int] NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[Address_Field1] [varchar](60) NOT NULL,
	[Address_Field2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Dim_StoreOrder]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Dim_StoreOrder](
	[StoreOrder_ID_SurrogateKey] [int] NOT NULL,
	[StoreOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[StorePayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Dim_SubCategory]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Dim_SubCategory](
	[Subcategory_ID] [int] NOT NULL,
	[SubcategoryName] [varchar](60) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Category_Name] [varchar](60) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Dim_Supplier]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Dim_Supplier](
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Fact_ACC_Product_Purchase]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Fact_ACC_Product_Purchase](
	[Store_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[Total Purchased Quantity] [int] NULL,
	[Total Purchased Amount] [numeric](25, 3) NULL,
	[Total Amount Average] [numeric](25, 3) NULL,
	[Total Paid Amount] [numeric](25, 3) NULL,
	[Total Paid Amount Average] [numeric](25, 3) NULL,
	[Total Price Average] [numeric](15, 3) NULL,
	[Average Discount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Fact_ACC_Product_Purchase_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Fact_ACC_Product_Purchase_1](
	[Store_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[Total Purchased Quantity] [int] NULL,
	[Total Purchased Amount] [numeric](25, 3) NULL,
	[Total Amount Average] [numeric](25, 3) NULL,
	[Total Paid Amount] [numeric](25, 3) NULL,
	[Total Paid Amount Average] [numeric](25, 3) NULL,
	[Total Price Average] [numeric](15, 3) NULL,
	[Average Discount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_fact_acc_sold_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_fact_acc_sold_1](
	[Customer_ID] [int] NOT NULL,
	[Customer_Order_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Employee_Id] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Quantity] [int] NULL,
	[Total Amount] [numeric](25, 3) NULL,
	[Amount Paid] [numeric](25, 3) NULL,
	[Price] [numeric](15, 3) NULL,
	[Status] [varchar](15) NULL,
	[Discount] [int] NULL,
	[Payment Mode] [char](20) NULL,
	[Margin] [int] NULL,
	[Profit] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_fact_acc_sold_2]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_fact_acc_sold_2](
	[product_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[TotalSoldQuantity] [int] NULL,
	[TotalSoldAmount] [numeric](25, 3) NULL,
	[TotalSoldAmountAVG] [numeric](25, 3) NULL,
	[TotalPaidAmount] [numeric](25, 3) NULL,
	[TotalPaidAmountAVG] [numeric](25, 3) NULL,
	[TotalPriceAverage] [numeric](25, 3) NULL,
	[AverageDiscount] [numeric](5, 2) NULL,
	[TotalProfit] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_fact_daily_sold_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_fact_daily_sold_1](
	[product_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[ThisDayQuantity] [int] NULL,
	[QuantityTillThisDay] [int] NULL,
	[TotalAmount] [numeric](25, 3) NULL,
	[AverageAmount] [numeric](25, 3) NULL,
	[AmountPaid] [numeric](25, 3) NULL,
	[AverageAmountPaid] [numeric](25, 3) NULL,
	[Price] [numeric](25, 3) NULL,
	[AveragePrice] [numeric](25, 3) NULL,
	[AverageDiscount] [numeric](5, 2) NULL,
	[Profit] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_fact_daily_sold_2]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_fact_daily_sold_2](
	[Customer_ID] [int] NOT NULL,
	[Customer_Order_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Employee_Id] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Quantity] [int] NULL,
	[Total Amount] [numeric](25, 3) NULL,
	[Amount Paid] [numeric](25, 3) NULL,
	[Price] [numeric](15, 3) NULL,
	[Status] [varchar](15) NULL,
	[Discount] [int] NULL,
	[Payment Mode] [char](20) NULL,
	[Margin] [int] NULL,
	[Profit] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_fact_daily_sold_3]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_fact_daily_sold_3](
	[product_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[ThisDayQuantity] [int] NULL,
	[TotalAmount] [numeric](25, 3) NULL,
	[AmountPaid] [numeric](25, 3) NULL,
	[Price] [numeric](25, 3) NULL,
	[AverageDiscount] [numeric](5, 2) NULL,
	[Profit] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_fact_daily_sold_4]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_fact_daily_sold_4](
	[product_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[ThisDayQuantity] [int] NULL,
	[QuantityTillThisDay] [int] NULL,
	[TotalAmount] [numeric](25, 3) NULL,
	[AverageAmount] [numeric](25, 3) NULL,
	[AmountPaid] [numeric](25, 3) NULL,
	[AverageAmountPaid] [numeric](25, 3) NULL,
	[Price] [numeric](25, 3) NULL,
	[AveragePrice] [numeric](25, 3) NULL,
	[AverageDiscount] [numeric](5, 2) NULL,
	[Profit] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Fact_Monthly_Product_Purchase]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Fact_Monthly_Product_Purchase](
	[Store_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[This Month Quantity] [int] NULL,
	[Quantity Till This Month] [int] NULL,
	[Total Amount] [numeric](25, 3) NULL,
	[Average Amount] [numeric](25, 3) NULL,
	[Total Paid Amount] [numeric](25, 3) NULL,
	[Average Paid Amount] [numeric](25, 3) NULL,
	[Price Average] [numeric](15, 3) NULL,
	[Average Discount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Fact_Monthly_Product_Purchase_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Fact_Monthly_Product_Purchase_1](
	[Store_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[This Month Quantity] [int] NULL,
	[Total Amount] [numeric](25, 3) NULL,
	[Total Paid Amount] [numeric](25, 3) NULL,
	[AverageDiscount] [numeric](25, 3) NULL,
	[PriceAverage] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Fact_Monthly_Product_Purchase_2]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Fact_Monthly_Product_Purchase_2](
	[Store_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[Quantity till This month] [int] NOT NULL,
	[Average Amount] [numeric](25, 3) NOT NULL,
	[Average Paid Amount] [numeric](25, 3) NULL,
	[Average Discount] [numeric](25, 3) NULL,
	[Price Average] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Fact_Trans_Purchase]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Fact_Trans_Purchase](
	[Store_ID] [int] NOT NULL,
	[Store_Order_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Quantity] [int] NULL,
	[Total Amount] [numeric](25, 3) NULL,
	[Amount Paid] [numeric](25, 3) NULL,
	[Price] [numeric](15, 3) NULL,
	[Status] [varchar](15) NULL,
	[Discount] [int] NULL,
	[Payment Mode] [char](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_fact_trans_sold_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_fact_trans_sold_1](
	[Customer_ID] [int] NOT NULL,
	[Customer_Order_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Employee_Id] [int] NOT NULL,
	[Date] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Quantity] [int] NULL,
	[Total Amount] [numeric](25, 3) NULL,
	[Amount Paid] [numeric](25, 3) NULL,
	[Price] [numeric](15, 3) NULL,
	[Status] [varchar](15) NULL,
	[Discount] [int] NULL,
	[Payment Mode] [char](20) NULL,
	[Margin] [int] NULL,
	[Profit] [numeric](25, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_Customer_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_Customer_1](
	[Customer_ID] [int] NOT NULL,
	[Customer Name] [varchar](120) NOT NULL,
	[PhoneNumber] [char](18) NOT NULL,
	[Address_Field1] [varchar](60) NOT NULL,
	[Address_Field2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_Customer_2]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_Customer_2](
	[Customer_ID] [int] NOT NULL,
	[Customer Name] [varchar](120) NOT NULL,
	[PhoneNumber] [char](18) NOT NULL,
	[Address_Field1] [varchar](60) NOT NULL,
	[Address_Field2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_CustomerOrder_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_CustomerOrder_1](
	[CustomerOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerFirstName] [varchar](60) NOT NULL,
	[CustomerLastName] [varchar](60) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[CustomerPayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_CustomerOrder_2]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_CustomerOrder_2](
	[CustomerOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerFirstName] [varchar](60) NOT NULL,
	[CustomerLastName] [varchar](60) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[CustomerPayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_CustomerOrder_3]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_CustomerOrder_3](
	[CustomerOrder_ID_SurrogateKey] [int] NOT NULL,
	[CustomerOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerFirstName] [varchar](60) NOT NULL,
	[CustomerLastName] [varchar](60) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[CustomerPayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_CustomerOrder_4]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_CustomerOrder_4](
	[CustomerOrder_ID_SurrogateKey] [int] NOT NULL,
	[CustomerOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerFirstName] [varchar](60) NOT NULL,
	[CustomerLastName] [varchar](60) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[CustomerPayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_CustomerOrder_5]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_CustomerOrder_5](
	[CustomerOrder_ID_SurrogateKey] [int] NOT NULL,
	[CustomerOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerFirstName] [varchar](60) NOT NULL,
	[CustomerLastName] [varchar](60) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[CustomerPayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_Employee_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_Employee_1](
	[Employee_ID] [int] NOT NULL,
	[Name] [varchar](110) NOT NULL,
	[Current_Store_ID] [int] NOT NULL,
	[Previous_Store_ID] [int] NULL,
	[Effective_Date] [datetime] NOT NULL,
	[PhoneNumber] [char](15) NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_Employee_2]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_Employee_2](
	[Employee_ID] [int] NOT NULL,
	[Name] [varchar](110) NOT NULL,
	[Current_Store_ID] [int] NOT NULL,
	[Previous_Store_ID] [int] NULL,
	[Effective_Date] [datetime] NOT NULL,
	[PhoneNumber] [char](15) NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_Employee_3]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_Employee_3](
	[Employee_ID] [int] NOT NULL,
	[Name] [varchar](110) NOT NULL,
	[Current_Store_ID] [int] NOT NULL,
	[Previous_Store_ID] [int] NULL,
	[Effective_Date] [datetime] NOT NULL,
	[PhoneNumber] [char](15) NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_Product_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_Product_1](
	[Product_ID] [int] NOT NULL,
	[ProductName] [varchar](120) NOT NULL,
	[Price] [numeric](15, 3) NOT NULL,
	[Manufactured_Date] [int] NULL,
	[Expiry_Date] [int] NULL,
	[Subcategory_ID] [int] NOT NULL,
	[SubcategoryName] [varchar](60) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Category] [varchar](60) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_Product_2]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_Product_2](
	[Product_ID] [int] NOT NULL,
	[ProductName] [varchar](120) NOT NULL,
	[Price] [numeric](15, 3) NOT NULL,
	[Manufactured_Date] [int] NULL,
	[Expiry_Date] [int] NULL,
	[Subcategory_ID] [int] NOT NULL,
	[SubcategoryName] [varchar](60) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Category] [varchar](60) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_Store_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_Store_1](
	[Store_ID] [int] NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[Address_Field1] [varchar](60) NOT NULL,
	[Address_Field2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_Store_2]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_Store_2](
	[Store_ID] [int] NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[Address_Field1] [varchar](60) NOT NULL,
	[Address_Field2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_StoreOrder_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_StoreOrder_1](
	[StoreOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[StorePayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_StoreOrder_2]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_StoreOrder_2](
	[StoreOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[StorePayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_StoreOrder_3]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_StoreOrder_3](
	[StoreOrder_ID_SurrogateKey] [int] NOT NULL,
	[StoreOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[StorePayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_StoreOrder_4]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_StoreOrder_4](
	[StoreOrder_ID_SurrogateKey] [int] NOT NULL,
	[StoreOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[StorePayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_StoreOrder_5]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_StoreOrder_5](
	[StoreOrder_ID_SurrogateKey] [int] NOT NULL,
	[StoreOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [numeric](20, 4) NOT NULL,
	[StorePayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_SubCategory_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_SubCategory_1](
	[Subcategory_ID] [int] NOT NULL,
	[SubcategoryName] [varchar](60) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Category_Name] [varchar](60) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_SubCategory_2]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_SubCategory_2](
	[Subcategory_ID] [int] NOT NULL,
	[SubcategoryName] [varchar](60) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Category_Name] [varchar](60) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_Supplier_1]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_Supplier_1](
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Update_Supplier_2]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Update_Supplier_2](
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Log] ADD  DEFAULT (getdate()) FOR [LogTime]
GO
/****** Object:  StoredProcedure [dbo].[Fact_ACC_Product_Sold_Load]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Fact_ACC_Product_Sold_Load] @to Date
AS
begin
DECLARE @from date;

SELECT @from = max(datetime) from [Retail Store DW].dbo.fact_trans_Purchase

if(@from is null)
begin
    SELECT @from = min(date) from [Retail store SA].dbo.store_order
end

if(@from is null)
begin
   return;
end
BEGIN
truncate table temp_fact_acc_sold_1;
truncate table temp_fact_acc_sold_2;
insert into log (message) values ('After Truncate ACC Sold Fact Temp_Tables');

insert into temp_fact_acc_sold_1 --sale information till given that
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
where co.Date>= @from and co.Date<DATEADD(day,1,@to) and CurrentFlag=1
order by Datetime,co.CustomerOrder_ID
insert into log (message) values ('After insert into temp_fact_acc_sold_1');
insert into temp_fact_acc_sold_2
select Product_Id,Store_ID,Employee_ID,SUM(Quantity)as TotalSoldQuantity,SUM([Total Amount])as TotalSoldAmount,AVG([Total Amount]) as TotalSoldAmountAVG,
SUM([Amount Paid]) as TotalPaidAmount,AVG([Amount Paid]) as TotalPaidAmountAVG,AVG(Price) as TotalPriceAverage,AVG(discount) as AverageDiscount,SUM(Profit) as TotalProfit
from temp_fact_acc_sold_1
group by Product_Id,Store_ID,Employee_ID

insert into log (message) values ('After insert into temp_fact_acc_sold_2');
END
insert into fact_acc_product_sold
select * from temp_fact_acc_sold_2
insert into log (message) values ('After insert into ACC Product sold Fact');
end


GO
/****** Object:  StoredProcedure [dbo].[Fact_Daily_Product_Sold_Load]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Fact_Daily_Product_Sold_Load] @from Date,@to Date
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

GO
/****** Object:  StoredProcedure [dbo].[Fact_Trans_Sold_Load]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Fact_Trans_Sold_Load] @to Date
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


GO
/****** Object:  StoredProcedure [dbo].[FirstLoad_Dim_Customer]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   procedure [dbo].[FirstLoad_Dim_Customer]
as
begin
	insert into [Retail Store DW].[dbo].[Dim_Customer]
	select 
		c.[Customer_ID] ,
		c.[First_Name] +' ' + c.[LastName],
		c.[PhoneNumber],
		a.[Address_Field1],
		a.[Address_Field2],
		a.[Country],
		a.[State],
		a.[City],
		a.[Zipcode]
	
	from [Retail store SA].[dbo].[customer] as c inner join
	[Retail store SA].[dbo].[address] as a on (c.Address_ID = a.Address_ID) 
	insert into log (message) values ('After insert into [Dim_Customer]')
end		  
GO
/****** Object:  StoredProcedure [dbo].[FirstLoad_Dim_CustomerOrder]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   procedure [dbo].[FirstLoad_Dim_CustomerOrder]
as
begin

insert into [Retail Store DW].[dbo].Dim_CustomerOrder(

	CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag

)  

SELECT c.CustomerOrder_ID,s.Store_ID,s.StoreName,cu.Customer_ID,First_Name as CustomerFirstName,LastName as CustomerLastName
,CONVERT(CHAR(8),[Date],112) as 'Date',Status,NetAmount as [Total Payment],Payment_ID as CustomerPayment_ID,pm.Mode as PaymentMode,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as endDate,1 as CurrentFlag
from [Retail store SA].dbo.customer_order c Join [Retail store SA].dbo.Store s  
on c.Store_ID = s.Store_ID
join [Retail store SA].dbo.customer cu on cu.Customer_ID = c.Customer_ID
join [Retail store SA].dbo.customer_payment_details p on p.CustomerPayment_ID= c.Payment_ID
join [Retail store SA].dbo.customerpaymentmode pm on pm.CustomerModeID = p.CustomerModeID  
insert into log (message) values ('After insert into [Dim_CustomerOrder]');
end
GO
/****** Object:  StoredProcedure [dbo].[FirstLoad_Dim_Employee]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   procedure [dbo].[FirstLoad_Dim_Employee]
as
begin
insert into [Retail Store DW].[dbo].dim_Employee  
SELECT Employee_ID,First_Name+' '+LastName as Name,Store_ID as Current_Store_Id,NULL as Previous_Store_ID,GETDATE() as Effective_Date,PhoneNumber,Address_Field1,Address_Field2,Country,State,City,Zipcode
from [Retail store SA].dbo.employee e Join [Retail store SA].dbo.address a 
on a.Address_ID = e.Address_ID	
insert into log (message) values ('After insert into [dim_Employee]');
end
GO
/****** Object:  StoredProcedure [dbo].[FirstLoad_Dim_Product]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   procedure [dbo].[FirstLoad_Dim_Product]
as
begin
	insert into [Retail Store DW].[dbo].[Dim_Product]
	
		select 
			p.[Product_ID],
			p.[ProductName],
			p.[Price],
			CONVERT(CHAR(8),[Manufactured_Date],112) as 'Manufactured_Date',
			CONVERT(CHAR(8),[Expiry_Date],112) as 'Manufactured_Date',
			sc.[Subcategory_ID],
			sc.[SubcategoryName],
			c.[Category_ID],
			c.[Category]
	
		from [Retail store SA].[dbo].[product] as p inner join
		[Retail store SA].[dbo].product_subcategory as sc on (p.Subcategory_ID = sc.Subcategory_ID) 
		inner join [Retail store SA].[dbo].[productcategory] as c on (sc.Category_ID = c.Category_ID)
	
	insert into log (message) values ('After insert into dim_product');

end
GO
/****** Object:  StoredProcedure [dbo].[FirstLoad_Dim_Store]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   procedure [dbo].[FirstLoad_Dim_Store]
as
begin
	insert into [Retail Store DW].[dbo].Dim_Store
	select 
		s.[Store_ID] ,
		s.[StoreName],
		a.[Address_Field1],
		a.[Address_Field2],
		a.[Country],
		a.[State],
		a.[City],
		a.[Zipcode]
	
	from [Retail store SA].[dbo].[store] as s inner join
	[Retail store SA].[dbo].[address] as a on (s.Address_ID = a.Address_ID) 

	insert into log (message) values ('After insert into [Dim_Store]') 
end
GO
/****** Object:  StoredProcedure [dbo].[FirstLoad_Dim_StoreOrder]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create   procedure [dbo].[FirstLoad_Dim_StoreOrder]
as
begin

insert into [Retail Store DW].[dbo].Dim_StoreOrder
(
   StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag
)
SELECT s.StoreOrder_ID,st.Store_ID,st.StoreName,su.Supplier_ID,su.SupplierName,Address_Field1,Address_Field2,
Country,State,City,Zipcode,CONVERT(CHAR(8),[Date],112) as 'Date',Status,NetAmount as [Total Payment],
pm.StoreModeID as StorePayment_ID,pm.Mode as PaymentMode,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as endDate,1 as CurrentFlag
from [Retail store SA].dbo.store_order s Join [Retail store SA].dbo.Store st
on s.Store_ID = st.Store_ID
join [Retail store SA].dbo.supplier su on su.Supplier_ID=s.Supplier_ID
join [Retail store SA].dbo.address a on a.Address_ID = st.Address_ID
join [Retail store SA].dbo.store_payment_details p on p.StorePayment_ID= s.StorePayment_ID
join [Retail store SA].dbo.storepaymentmode pm on pm.StoreModeID= p.StoreModeID	   
insert into log (message) values ('After insert into [Dim_StoreOrder]');
end
GO
/****** Object:  StoredProcedure [dbo].[FirstLoad_Dim_SubCategory]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[FirstLoad_Dim_SubCategory]
as
begin
insert into [Retail Store DW].[dbo].dim_SubCategory  SELECT Subcategory_ID,SubcategoryName,c.Category_ID,Category as Category_Name
from [Retail store SA].dbo.product_subcategory s Join [Retail store SA].dbo.productcategory c
on s.Category_ID = c.Category_ID	  
insert into log (message) values ('After insert into [dim_SubCategory]');
end
GO
/****** Object:  StoredProcedure [dbo].[FirstLoad_Dim_Supplier]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create   procedure [dbo].[FirstLoad_Dim_Supplier]
as
begin
insert into [Retail Store DW].[dbo].dim_supplier  SELECT Supplier_ID as SupplierID,SupplierName,Address_Field1,Address_Field2,Country,State,City,Zipcode
from [Retail store SA].dbo.supplier s Join [Retail store SA].dbo.address a 
on a.Address_ID = s.Address_ID

insert into log (message) values ('After insert into [dim_supplier]'); 
end
GO
/****** Object:  StoredProcedure [dbo].[FirstLoadOfDimentions]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   procedure [dbo].[FirstLoadOfDimentions]
as
begin
BEGIN TRAN
exec FirstLoad_Dim_Customer
exec FirstLoad_Dim_Store
exec FirstLoad_Dim_Product
exec FirstLoad_Dim_Supplier
exec FirstLoad_Dim_Employee
exec FirstLoad_Dim_SubCategory
exec FirstLoad_Dim_CustomerOrder
exec FirstLoad_Dim_StoreOrder
COMMIT TRAN 
end
GO
/****** Object:  StoredProcedure [dbo].[Update_Dim_Customer]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   procedure [dbo].[Update_Dim_Customer]
as
begin
IF(EXISTS(SELECT 1 FROM dbo.Dim_Customer))
BEGIN
TRUNCATE TABLE Temp_Dim_Customer
TRUNCATE TABLE Temp_Update_Customer_1
TRUNCATE TABLE Temp_Update_Customer_2
insert into log (message) values ('After Truncate Customer Temp_Tables');

insert into Temp_Dim_Customer
select 

   Customer_ID,[Customer Name],PhoneNumber,Address_Field1,Address_Field2,
   Country,State,City,Zipcode
from Dim_Customer
insert into log (message) values ('After Insert Temp_Dim_Customer');
-- Temp_Update_Customer_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_Customer_1
(
  
   Customer_ID,[Customer Name],PhoneNumber,Address_Field1,Address_Field2,
   Country,State,City,Zipcode
)
SELECT 
   Customer_ID,First_Name+' '+LastName as [Customer Name],PhoneNumber,Address_Field1,Address_Field2,
Country,State,City,Zipcode
from [Retail store SA].dbo.customer c join [Retail store SA].dbo.address a 
on c.Address_ID=a.Address_ID
insert into log (message) values ('After Insert Temp_Update_Customer_1');
-- Temp_Update_Customer_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_Customer_2
(
  
   Customer_ID,[Customer Name],PhoneNumber,Address_Field1,Address_Field2,
   Country,State,City,Zipcode
)
select 
  
   Customer_ID,[Customer Name],PhoneNumber,Address_Field1,Address_Field2,
   Country,State,City,Zipcode

from  Temp_Update_Customer_1 t1
where t1.Customer_ID not in ( select Customer_ID from Temp_Dim_Customer);

insert into log (message) values ('After Insert Temp_Update_Customer_2');

insert into Temp_Dim_Customer
select * from temp_update_customer_2


insert into log (message) values ('After Insert temp_update_customer_2');


truncate table [Retail Store DW].[dbo].[Dim_Customer];

insert into log (message) values ('After Truncate Dim_Customer');


insert into [Retail Store DW].[dbo].[Dim_Customer]
select * from temp_dim_customer
insert into log (message) values ('After Insert Dim_Customer');
end;


else 
begin
insert into log (message) values ('Customer Dimension is Empty');
end;


end;

--select * from [Retail store SA].[dbo].[store_order]
--update [Retail store SA].[dbo].[store_order]
--set Status = 'failed' where Customer_ID = 2
GO
/****** Object:  StoredProcedure [dbo].[Update_Dim_CustomerOrder]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   procedure [dbo].[Update_Dim_CustomerOrder]
as
begin

IF(EXISTS(SELECT 1 FROM dbo.Dim_CustomerOrder))
BEGIN

TRUNCATE TABLE Temp_Dim_CustomerOrder
insert into log (message) values ('After TRUNCATE Temp_Dim_CustomerOrder');
TRUNCATE TABLE Temp_Update_CustomerOrder_1
insert into log (message) values ('After TRUNCATE Temp_Update_CustomerOrder_1');
TRUNCATE TABLE Temp_Update_CustomerOrder_2
insert into log (message) values ('After TRUNCATE Temp_Update_CustomerOrder_2');
TRUNCATE TABLE Temp_Update_CustomerOrder_3
insert into log (message) values ('After TRUNCATE Temp_Update_CustomerOrder_3');
TRUNCATE TABLE Temp_Update_CustomerOrder_4
insert into log (message) values ('After TRUNCATE Temp_Update_CustomerOrder_4');
TRUNCATE TABLE Temp_Update_CustomerOrder_5
insert into log (message) values ('After TRUNCATE Temp_Update_CustomerOrder_5');

insert into Temp_Dim_CustomerOrder
select 

     customerorder_id_surrogateKey,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
from Dim_CustomerOrder

insert into log (message) values ('After insert Temp_Dim_CustomerOrder');

-- Temp_Update_StoreOrder_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_CustomerOrder_1
(
   CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
)
SELECT c.CustomerOrder_ID,s.Store_ID,s.StoreName,cu.Customer_ID,First_Name as CustomerFirstName,LastName as CustomerLastName
,CONVERT(CHAR(8),[Date],112) as 'Date',Status,NetAmount as [Total Payment],Payment_ID as CustomerPayment_ID,pm.Mode as PaymentMode,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as endDate,1 as CurrentFlag
from [Retail store SA].dbo.customer_order c Join [Retail store SA].dbo.Store s  
on c.Store_ID = s.Store_ID
join [Retail store SA].dbo.customer cu on cu.Customer_ID = c.Customer_ID
join [Retail store SA].dbo.customer_payment_details p on p.CustomerPayment_ID= c.Payment_ID
join [Retail store SA].dbo.customerpaymentmode pm on pm.CustomerModeID = p.CustomerModeID  
insert into log (message) values ('After insert Temp_Update_CustomerOrder_1');


-- Temp_Update_StoreOrder_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_CustomerOrder_2
(
	CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
)
select 
   CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag

from  Temp_Update_CustomerOrder_1
where Temp_Update_CustomerOrder_1.CustomerOrder_ID not in ( select CustomerOrder_ID from Temp_Dim_CustomerOrder);

insert into log (message) values ('After insert Temp_Update_CustomerOrder_2');

with max_SurrogateKey as (
select max(customerorder_id_surrogateKey) + 2 as max_Key from Temp_Dim_CustomerOrder
)													

-- Temp_Update_StoreOrder_3 - New Data with Considering scd
insert into Temp_Update_CustomerOrder_3(
	   customerorder_id_surrogateKey,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag

)

select max_Key ,t2.CustomerOrder_ID,t2.Store_ID,t2.Store_Name  ,t2.Customer_ID,t2.CustomerFirstName,t2.CustomerLastName,t2.[Date],t2.[Status],
	t2.[Total Payment],t2.CustomerPayment_ID,t2.PaymentMode,
   CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from Temp_Update_CustomerOrder_2 as t2, max_SurrogateKey
insert into log (message) values ('After insert Temp_Update_CustomerOrder_3');

--truncate table temp4; -- for all current valid datas in dimension

insert into Temp_Update_CustomerOrder_4
select customerorder_id_surrogateKey,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
		[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
from Temp_Dim_CustomerOrder
where CurrentFlag = 1
;

insert into log (message) values ('After insert Temp_Update_CustomerOrder_4');

insert into Temp_Update_CustomerOrder_5 (
   customerorder_id_surrogateKey,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
		[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
)
select customerorder_id_surrogateKey,t1.CustomerOrder_ID,t1.Store_ID,t1.Store_Name  ,t1.Customer_ID,t1.CustomerFirstName,t1.CustomerLastName,t1.[Date],t1.[Status],
		t1.[Total Payment],t1.CustomerPayment_ID,t1.PaymentMode,t4.StartDate,t4.EndDate,t4.CurrentFlag
from Temp_Update_CustomerOrder_1 as t1 inner join Temp_Update_CustomerOrder_4 as t4 
on t1 .CustomerOrder_ID = t4.CustomerOrder_ID   
where t1.status != t4.status ;

insert into log (message) values ('After insert Temp_Update_CustomerOrder_5');


with max_SurrogateKey as (
select max(CustomerOrder_ID_SurrogateKey) + 2 as max_Key from Temp_Dim_CustomerOrder
)
insert into Temp_Update_CustomerOrder_3 
select max_Key,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,
    CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from Temp_Update_CustomerOrder_5,max_SurrogateKey
insert into log (message) values ('After inserting into Temp_Update_CustomerOrder_3 again ');


update Temp_Dim_CustomerOrder 
set CurrentFlag = 0, EndDate = CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112)
from Temp_Update_CustomerOrder_5
where Temp_Update_CustomerOrder_5.customerorder_id_surrogateKey = Temp_Dim_CustomerOrder.customerorder_id_surrogateKey
insert into log (message) values ('After updating Temp_Dim_CustomerOrder ');


update Temp_Update_CustomerOrder_3
set  StartDate = CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112)
insert into log (message) values ('After updating Temp_Update_CustomerOrder_3 ');

insert into Temp_Dim_CustomerOrder 
select 	customerorder_id_surrogateKey,CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,
    CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from  Temp_Update_CustomerOrder_3;

insert into log (message) values ('finished inserting into Temp_Dim_CustomerOrder');


truncate table [Retail Store DW].[dbo].[Dim_CustomerOrder];
insert into log (message) values ('After truncate [Dim_CustomerOrder]');


insert into [Retail Store DW].[dbo].[Dim_CustomerOrder]
select 
	CustomerOrder_ID,Store_ID,Store_Name  ,Customer_ID,CustomerFirstName,CustomerLastName,[Date],[Status],
	[Total Payment],CustomerPayment_ID,PaymentMode,StartDate,EndDate,CurrentFlag
from Temp_Dim_CustomerOrder
order by customerorder_id_surrogateKey asc
insert into log (message) values ('updating [Dim_CustomerOrder] is finnished');

END

else
begin
   insert into log (message) values (' [Dim_CustomerOrder] is empty')

END;

END
GO
/****** Object:  StoredProcedure [dbo].[Update_Dim_Employee]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[Update_Dim_Employee]
as
begin

IF(EXISTS(SELECT 1 FROM dbo.Dim_CustomerOrder))
BEGIN


truncate table	Temp_Dim_Employee
insert into log (message) values ('After TRUNCATE Temp_Dim_Employee');
truncate table Temp_Update_Employee_1
insert into log (message) values ('After TRUNCATE Temp_Update_Employee_1');
truncate table Temp_Update_Employee_2
insert into log (message) values ('After TRUNCATE Temp_Update_Employee_2');
truncate table Temp_Update_Employee_3
insert into log (message) values ('After TRUNCATE Temp_Update_Employee_3');


insert into Temp_Dim_Employee
select 

   [Employee_ID]
      ,[Name]
      ,[Current_Store_ID]
      ,[Previous_Store_ID]
      ,[Effective_Date]
      ,[PhoneNumber]
      ,[AddressField1]
      ,[AddressField2]
      ,[Country]
      ,[State]
      ,[City]
      ,[Zipcode]
from Dim_Employee
insert into log (message) values ('After insert Temp_Dim_Employee');


insert into Temp_Update_Employee_1
SELECT Employee_ID,First_Name+' '+LastName as Name,Store_ID as Current_Store_Id,
NULL as Previous_Store_ID,DATEADD(year, -10, GETDATE()) as Effective_Date,
PhoneNumber,Address_Field1,Address_Field2,Country,State,City,Zipcode
from [Retail store SA].dbo.employee e Join [Retail store SA].dbo.address a 
on a.Address_ID = e.Address_ID	

insert into log (message) values ('After insert Temp_Update_Employee_1');



-- new records that are not in dimension
insert into Temp_Update_Employee_2
select 

   [Employee_ID]
      ,[Name]
      ,[Current_Store_ID]
      ,[Previous_Store_ID]
      ,[Effective_Date]
      ,[PhoneNumber]
      ,[AddressField1]
      ,[AddressField2]
      ,[Country]
      ,[State]
      ,[City]
      ,[Zipcode]
from Temp_Update_Employee_1 as t1
where t1.employee_Id not in ( select [Employee_ID]  from Temp_Dim_Employee)
insert into log (message) values ('After insert Temp_Update_Employee_2');




insert into Temp_Update_Employee_3	(
	 [Employee_ID]
      ,[Name]
      ,[Current_Store_ID]
      ,[Previous_Store_ID]
      ,[Effective_Date]
      ,[PhoneNumber]
      ,[AddressField1]
      ,[AddressField2]
      ,[Country]
      ,[State]
      ,[City]
      ,[Zipcode]

)
select t1.[Employee_ID]
      ,t1.[Name]
      ,t1.[Current_Store_ID]
      ,td.[Current_Store_ID]
      ,DATEADD(year, -10, GETDATE()) as [Effective_Date]
      ,t1.[PhoneNumber]
      ,t1.[AddressField1]
      ,t1.[AddressField2]
      ,t1.[Country]
      ,t1.[State]
      ,t1.[City]
      ,t1.[Zipcode]

from Temp_Dim_Employee as td inner join Temp_Update_Employee_1 as t1 on (td.Employee_ID = t1.Employee_ID)
where td.[Current_Store_ID] != t1.[Current_Store_ID]
 insert into log (message) values ('After insert Temp_Update_Employee_3');



update Temp_Dim_Employee
set [Previous_Store_ID] = t1.[Previous_Store_ID],
[Current_Store_ID] = t1.[Current_Store_ID]
, [Effective_Date] = t1.[Effective_Date]
from Temp_Update_Employee_3 as t1
where Temp_Dim_Employee.[Employee_ID] = t1.[Employee_ID] 

insert into log (message) values ('After updating changed records in temp dimension');

insert into Temp_Dim_Employee
select * from Temp_Update_Employee_2

insert into log (message) values ('After inserting new records in temp dimension');


truncate table [Retail Store DW].[dbo].[Dim_Employee];
insert into log (message) values ('After truncate [Dim_Employee]');



insert into [Retail Store DW].[dbo].[Dim_Employee]
select 
	   [Employee_ID]
      ,[Name]
      ,[Current_Store_ID]
      ,[Previous_Store_ID]
      ,[Effective_Date]
      ,[PhoneNumber]
      ,[AddressField1]
      ,[AddressField2]
      ,[Country]
      ,[State]
      ,[City]
      ,[Zipcode]
from Temp_Dim_Employee
order by [Employee_ID] asc
insert into log (message) values ('updating [Dim_Employee] is finnished');


end
else
begin
   insert into log (message) values (' [Dim_Employee] is empty')

END;

END


-- this procedured is tested for addin new record and updating a previous record .









GO
/****** Object:  StoredProcedure [dbo].[Update_Dim_Product]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   procedure [dbo].[Update_Dim_Product]
as
begin
IF(EXISTS(SELECT 1 FROM dbo.Dim_Product))
BEGIN
  

TRUNCATE TABLE Temp_Dim_Product
TRUNCATE TABLE Temp_Update_Product_1
TRUNCATE TABLE Temp_Update_Product_2

insert into log (message) values ('After Truncate Product Temp_Tables');



insert into Temp_Dim_Product
select 

   Product_ID,[ProductName],Price,Manufactured_Date,
  Expiry_Date,SubCategory_ID,SubCategoryName,Category_ID,Category
from Dim_Product
insert into log (message) values ('After Insert Temp_Dim_Product');

-- Temp_Update_Product_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_Product_1
(
  
   Product_ID,[ProductName],Price,Manufactured_Date,
  Expiry_Date,SubCategory_ID,SubCategoryName,Category_ID,Category
)
SELECT 
  
      Product_ID,[ProductName],Price,CONVERT(CHAR(8),Manufactured_Date,112)as Manufactured_Date,
  CONVERT(CHAR(8),Expiry_Date,112)as expiry_Date,ps.SubCategory_ID,SubCategoryName,ps.Category_ID,Category
from [Retail Store SA].dbo.Product p join [Retail Store SA].dbo.product_subCategory ps
on p.Subcategory_ID = ps.Subcategory_ID
join [Retail Store SA].dbo.productcategory pc
on pc.Category_ID = ps.Category_ID 
insert into log (message) values ('After Insert Temp_Update_Product_1');
-- Temp_Update_Product_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_Product_2
(
  
 
      Product_ID,[ProductName],Price,Manufactured_Date,
  Expiry_Date,SubCategory_ID,SubCategoryName,Category_ID,Category
)
select 
  
      Product_ID,[ProductName],Price,Manufactured_Date,
  Expiry_Date,SubCategory_ID,SubCategoryName,Category_ID,Category
from  Temp_Update_Product_1 t1
where t1.Product_ID not in ( select Product_ID from Temp_Dim_Product);
insert into log (message) values ('After Insert Temp_Update_Product_2');

insert into Temp_Dim_Product
select * from temp_update_Product_2
insert into log (message) values ('After Insert Temp_Dim_Product');

truncate table [Retail Store DW].[dbo].[Dim_Product];
insert into log (message) values ('After Truncate Dim_Product');

insert into [Retail Store DW].[dbo].[Dim_Product]
select * from temp_dim_Product
insert into log (message) values ('After Insert Dim_Product');
end;


else 
begin
insert into log (message) values ('Product Dimension is Empty');
end;
end;
--select * from [Retail Product SA].[dbo].[Product_order]
--update [Retail Product SA].[dbo].[Product_order]
--set Status = 'failed' where Product_ID = 2
GO
/****** Object:  StoredProcedure [dbo].[Update_Dim_Store]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   procedure [dbo].[Update_Dim_Store]
as
begin
IF(EXISTS(SELECT 1 FROM dbo.Dim_store))
BEGIN
  

TRUNCATE TABLE Temp_Dim_Store
TRUNCATE TABLE Temp_Update_Store_1
TRUNCATE TABLE Temp_Update_Store_2
insert into log (message) values ('After Truncate Store Temp_Tables');
insert into Temp_Dim_Store
select 

   Store_ID,[StoreName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
from Dim_Store
insert into log (message) values ('After Insert Temp_Dim_Store');
-- Temp_Update_Store_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_Store_1
(
  
   Store_ID,[StoreName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
)
SELECT 
  
   Store_ID,[StoreName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
from [Retail store SA].dbo.Store s join [Retail store SA].dbo.address a 
on s.Address_ID=a.Address_ID
insert into log (message) values ('After Insert Temp_Update_Store_1');
-- Temp_Update_Store_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_Store_2
(
  
   
   Store_ID,[StoreName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
)
select 
  
   Store_ID,[StoreName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
from  Temp_Update_Store_1 t1
where t1.Store_ID not in ( select Store_ID from Temp_Dim_Store);
insert into log (message) values ('After Insert Temp_Update_Store_2');


insert into Temp_Dim_Store
select * from temp_update_Store_2

insert into log (message) values ('After Insert Temp_Dim_Store');



truncate table [Retail Store DW].[dbo].[Dim_Store];

insert into log (message) values ('After Truncate Dim_Store');
insert into [Retail Store DW].[dbo].[Dim_Store]
select * from temp_dim_Store

insert into log (message) values ('After Insert Dim_Store');
end;
--select * from [Retail store SA].[dbo].[store_order]
--update [Retail store SA].[dbo].[store_order]
--set Status = 'failed' where Store_ID = 2
else 
begin
insert into log (message) values ('Store Dimension is Empty');
end;
end;
GO
/****** Object:  StoredProcedure [dbo].[Update_Dim_StoreOrder]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   procedure [dbo].[Update_Dim_StoreOrder]
as
begin

IF(EXISTS(SELECT 1 FROM dbo.Dim_StoreOrder))
BEGIN
  



TRUNCATE TABLE Temp_Dim_StoreOrder
insert into log (message) values ('After TRUNCATE Temp_Dim_StoreOrder');

TRUNCATE TABLE Temp_Update_StoreOrder_1
insert into log (message) values ('After TRUNCATE Temp_Update_StoreOrder_1');
TRUNCATE TABLE Temp_Update_StoreOrder_2
insert into log (message) values ('After TRUNCATE Temp_Update_StoreOrder_2');
TRUNCATE TABLE Temp_Update_StoreOrder_3
insert into log (message) values ('After TRUNCATE Temp_Update_StoreOrder_3');
TRUNCATE TABLE Temp_Update_StoreOrder_4
insert into log (message) values ('After TRUNCATE Temp_Update_StoreOrder_4');
TRUNCATE TABLE Temp_Update_StoreOrder_5
insert into log (message) values ('After TRUNCATE Temp_Update_StoreOrder_5');

insert into Temp_Dim_StoreOrder
select 

   StoreOrder_ID_SurrogateKey,StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag
from Dim_StoreOrder
insert into log (message) values ('After insert Temp_Dim_StoreOrder');


-- Temp_Update_StoreOrder_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_StoreOrder_1
(
   StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag
)
SELECT s.StoreOrder_ID,st.Store_ID,st.StoreName,su.Supplier_ID,su.SupplierName,Address_Field1,Address_Field2,
Country,State,City,Zipcode,CONVERT(CHAR(8),[Date],112) as 'Date',Status,NetAmount as [Total Payment],
pm.StoreModeID as StorePayment_ID,pm.Mode as PaymentMode,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as endDate,1 as CurrentFlag
from [Retail store SA].dbo.store_order s Join [Retail store SA].dbo.Store st
on s.Store_ID = st.Store_ID
join [Retail store SA].dbo.supplier su on su.Supplier_ID=s.Supplier_ID
join [Retail store SA].dbo.address a on a.Address_ID = st.Address_ID
join [Retail store SA].dbo.store_payment_details p on p.StorePayment_ID= s.StorePayment_ID
join [Retail store SA].dbo.storepaymentmode pm on pm.StoreModeID= p.StoreModeID

insert into log (message) values ('After insert Temp_Update_StoreOrder_1');

-- Temp_Update_StoreOrder_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_StoreOrder_2
(
   StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag
)
select 
   StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag

from  Temp_Update_StoreOrder_1
where Temp_Update_StoreOrder_1.storeOrder_ID not in ( select storeOrder_ID from Temp_Dim_StoreOrder);


insert into log (message) values ('After insert Temp_Update_StoreOrder_2');


with max_SurrogateKey as (
select max(StoreOrder_id_surrogateKey) + 2 as max_Key from Temp_Dim_StoreOrder
)
-- Temp_Update_StoreOrder_3 - New Data with Considering scd
insert into Temp_Update_StoreOrder_3

select max_Key,t2.StoreOrder_ID,t2.Store_ID,t2.Store_Name,t2.Supplier_ID,t2.SupplierName ,t2.AddressField1,t2.AddressField2,
   t2.Country,t2.State,t2.City,t2.Zipcode,t2.Date,t2.Status,t2.[Total Payment],t2.StorePayment_ID,t2.PaymentMode,
   CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from Temp_Update_StoreOrder_2 as t2,max_SurrogateKey


insert into log (message) values ('After insert Temp_Update_StoreOrder_3');


-- temp4; -- for all current valid datas in dimension

insert into Temp_Update_StoreOrder_4
select StoreOrder_ID_SurrogateKey,StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag
from Temp_Dim_StoreOrder
where CurrentFlag = 1
;

insert into log (message) values ('After insert Temp_Update_StoreOrder_4');

insert into Temp_Update_StoreOrder_5 (
   StoreOrder_ID_SurrogateKey,StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
   StartDate,EndDate,CurrentFlag
)
select StoreOrder_ID_SurrogateKey,t1.StoreOrder_ID,t1.Store_ID,t1.Store_Name,t1.Supplier_ID,t1.SupplierName ,t1.AddressField1,t1.AddressField2,
   t1.Country,t1.State,t1.City,t1.Zipcode,t1.Date,t1.Status,t1.[Total Payment],t1.StorePayment_ID,t1.PaymentMode, t4.StartDate,t4.EndDate,t4.CurrentFlag
from Temp_Update_StoreOrder_1 as t1 inner join Temp_Update_StoreOrder_4 as t4 
on t1 .StoreOrder_ID = t4.StoreOrder_ID   
where t1.status != t4.status ;


insert into log (message) values ('After insert Temp_Update_StoreOrder_5');

with max_SurrogateKey as (
select max(StoreOrder_id_surrogateKey) + 2 as max_Key from Temp_Dim_StoreOrder
)
insert into Temp_Update_StoreOrder_3 
select max_Key,StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
    CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from Temp_Update_StoreOrder_5,max_SurrogateKey
 
insert into log (message) values ('After inserting again to Temp_Update_StoreOrder_3');

update Temp_Dim_StoreOrder 
set CurrentFlag = 0, EndDate = CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112)
from Temp_Update_StoreOrder_5
where Temp_Update_StoreOrder_5.StoreOrder_ID_SurrogateKey = Temp_Dim_StoreOrder.StoreOrder_ID_SurrogateKey

insert into log (message) values ('After update Temp_Dim_StoreOrder')

update Temp_Update_StoreOrder_3
set  StartDate = CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112)
						  
insert into log (message) values ('After update Temp_Update_StoreOrder_3')

insert into Temp_Dim_StoreOrder 
select 	StoreOrder_id_surrogateKey,StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
   Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
    CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as StartDate,CONVERT(CHAR(8), DATEADD(year, -10, GETDATE()) ,112) as EndDate,1 as CurrentFlag
from  Temp_Update_StoreOrder_3;

insert into log (message) values ('After insert Temp_Dim_StoreOrder finished')

truncate table [Retail Store DW].[dbo].[Dim_StoreOrder];

insert into log (message) values ('After truncate [Dim_StoreOrder]')

insert into [Retail Store DW].[dbo].[Dim_StoreOrder]
select 
	StoreOrder_ID,Store_ID,Store_Name,Supplier_ID,SupplierName ,AddressField1,AddressField2,
	Country,State,City,Zipcode,Date,Status,[Total Payment],StorePayment_ID,PaymentMode,
	StartDate,EndDate,CurrentFlag
from Temp_Dim_StoreOrder
order by StoreOrder_ID_SurrogateKey asc
 
insert into log (message) values ('updating [Dim_StoreOrder] is finnished')
end
else
begin
   insert into log (message) values (' [Dim_StoreOrder] is empty')

END;



end
GO
/****** Object:  StoredProcedure [dbo].[Update_Dim_SubCategory]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   procedure [dbo].[Update_Dim_SubCategory]
as
begin
IF(EXISTS(SELECT 1 FROM dbo.Dim_SubCategory))
BEGIN
TRUNCATE TABLE Temp_Dim_SubCategory
TRUNCATE TABLE Temp_Update_SubCategory_1
TRUNCATE TABLE Temp_Update_SubCategory_2

insert into log (message) values ('After Truncate SubCategory Temp_Tables');



insert into Temp_Dim_SubCategory
select 

   SubCategory_ID,SubCategoryName,Category_ID,Category_Name
from Dim_SubCategory
insert into log (message) values ('After Insert Temp_Dim_SubCategory');

-- Temp_Update_SubCategory_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_SubCategory_1
(
  
   SubCategory_ID,SubCategoryName,Category_ID,Category_Name
)
SELECT 
  
      
   SubCategory_ID,SubCategoryName,p.Category_ID,Category as Category_Name
from [Retail Store SA].dbo.product_subcategory sc  join [Retail Store SA].dbo.productcategory p
on p.Category_ID = sc.Category_ID
insert into log (message) values ('After Insert Temp_Update_SubCategory_1');
-- Temp_Update_SubCategory_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_SubCategory_2
(
  
   SubCategory_ID,SubCategoryName,Category_ID,Category_Name
)
select 
  
   SubCategory_ID,SubCategoryName,Category_ID,Category_Name
from  Temp_Update_SubCategory_1 t1
where t1.SubCategory_ID not in ( select SubCategory_ID from Temp_Dim_SubCategory);
insert into log (message) values ('After Insert Temp_Update_SubCategory_2');

insert into Temp_Dim_SubCategory
select * from temp_update_SubCategory_2
insert into log (message) values ('After Insert Temp_Dim_SubCategory');

truncate table [Retail Store DW].[dbo].[Dim_SubCategory];
insert into log (message) values ('After Truncate Dim_SubCategory');

insert into [Retail Store DW].[dbo].[Dim_SubCategory]
select * from temp_dim_SubCategory
insert into log (message) values ('After Insert Dim_SubCategory');
end;
--select * from [Retail SubCategory SA].[dbo].[SubCategory_order]
--update [Retail SubCategory SA].[dbo].[SubCategory_order]
--set Status = 'failed' where SubCateogry_ID = 2
else 
begin
insert into log (message) values ('SubCategory Dimension is Empty');
end;
end;
GO
/****** Object:  StoredProcedure [dbo].[Update_Dim_Supplier]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   procedure [dbo].[Update_Dim_Supplier]
as
begin
IF(EXISTS(SELECT 1 FROM dbo.Dim_Supplier))
BEGIN
  

TRUNCATE TABLE Temp_Dim_Supplier;
TRUNCATE TABLE Temp_Update_Supplier_1;
TRUNCATE TABLE Temp_Update_Supplier_2;

insert into log (message) values ('After Truncate Supplier Temp_Tables');


insert into Temp_Dim_Supplier
select 

   Supplier_ID,[SupplierName],AddressField1,AddressField2,
   Country,State,City,Zipcode
from Dim_Supplier;
insert into log (message) values ('After Insert Temp_Dim_Supplier');

-- Temp_Update_Supplier_1 - all of the source Data
insert into [Retail Store DW].[dbo].Temp_Update_Supplier_1

SELECT 
     Supplier_ID,[SupplierName],Address_Field1,Address_Field2,
   Country,State,City,Zipcode
from [Retail Store SA].dbo.Supplier s join [Retail Store SA].dbo.address a 
on a.Address_ID = s.Address_ID;
insert into log (message) values ('After Insert Temp_Update_Supplier_1');
-- Temp_Update_Supplier_2 - Data in Source which is not in Dimension table yet
insert into Temp_Update_Supplier_2

select 
  
       Supplier_ID,[SupplierName],AddressField1,AddressField2,
   Country,State,City,Zipcode
from  Temp_Update_Supplier_1 t1
where t1.Supplier_ID not in ( select Supplier_ID from Temp_Dim_Supplier);
insert into log (message) values ('After Insert Temp_Update_Supplier_2');

insert into Temp_Dim_Supplier
select * from temp_update_Supplier_2;
insert into log (message) values ('After Insert Temp_Dim_Supplier');

truncate table [Retail Store DW].[dbo].[Dim_Supplier];
insert into log (message) values ('After Truncate Dim_Supplier');

insert into [Retail Store DW].[dbo].[Dim_Supplier]
select * from dim_supplier;
insert into log (message) values ('After Insert Dim_Supplier');
end;
else 
begin
insert into log (message) values ('Supplier Dimension is Empty');
end;
END;

--select * from [Retail Supplier SA].[dbo].[Supplier_order]
--update [Retail Supplier SA].[dbo].[Supplier_order]
--set Status = 'failed' where Supplier_ID = 2
GO
/****** Object:  StoredProcedure [dbo].[Update_Fact_ACC_Product_Purchase]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Update_Fact_ACC_Product_Purchase] @from date, @to date
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
/****** Object:  StoredProcedure [dbo].[Update_Fact_Monthly_Product_Purchase]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Update_Fact_Monthly_Product_Purchase] @from date, @to date
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


GO
/****** Object:  StoredProcedure [dbo].[Update_Fact_Trans_Purchase]    Script Date: 6/28/2022 11:50:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Update_Fact_Trans_Purchase] @to date
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
	select so.[Store_ID],sod.[StoreOrder_ID] ,p.[Product_ID] ,[Supplier_ID], CONVERT(CHAR(8),[Date],112) as [Date] ,[Date]  as [DateTime],[Quantity] ,
	[Amount] as [Total Amount], [Amount] * (1-(CONVERT(DECIMAL(25,2),[Discount] ) /100)) as [Amount Paid], [Price], [Status], [Discount], [Mode] 

	from [Retail store SA].[dbo].store_order_details as sod
	inner join [Retail store SA].[dbo].store_order as so on sod.StoreOrder_ID = so.StoreOrder_ID
	inner join [Retail store SA].[dbo].product as p on sod.Product_ID = p.Product_ID
	inner join [Retail store SA].[dbo].store_payment_details as spd on (so.StorePayment_ID = spd.StorePayment_ID)
	inner join [Retail store SA].[dbo].storepaymentmode as spm on (spd.StoreModeID = spm.StoreModeID)
	where so.Date = @CurrentDate

	Set @CurrentDate = DATEADD(day, +1, @CurrentDate)
end

select * from  Temp_Fact_Trans_Purchase

insert into Fact_trans_Purchase 
select * from Temp_Fact_Trans_Purchase




GO;
														   
select * from fact_trans_Purchase

--exec Update_Fact_Trans_Purchase  @to='2011-01-03';

select * from fact_trans_purchase
GO
