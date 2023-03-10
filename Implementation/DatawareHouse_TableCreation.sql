USE [Retail Store DW]
GO
/****** Object:  Table [dbo].[Dim_Customer]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Dim_CustomerOrder]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Dim_Employee]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Dim_Payment]    Script Date: 6/27/2022 9:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Payment](
	[PaymentID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_Product]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Dim_Store]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Dim_StoreOrder]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Dim_SubCategory]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Dim_Supplier]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Log]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Dim_Customer]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Dim_CustomOrder]    Script Date: 6/27/2022 9:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Dim_CustomOrder](
	[CustomerOrder_ID_SurrogateKey] [int] NOT NULL,
	[CustomerOrder_ID] [int] NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerFirstName] [varchar](60) NOT NULL,
	[CustomerLastName] [varchar](60) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] [int] NOT NULL,
	[CustomerPayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Dim_Employee]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Dim_Payment]    Script Date: 6/27/2022 9:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Dim_Payment](
	[PaymentID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Dim_Product]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Dim_Store]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Dim_StoreOrder]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Dim_SubCategory]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Dim_Supplier]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Update_StoreOrder_1]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Update_StoreOrder_2]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Update_StoreOrder_3]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Update_StoreOrder_4]    Script Date: 6/27/2022 9:25:10 PM ******/
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
/****** Object:  Table [dbo].[Temp_Update_StoreOrder_5]    Script Date: 6/27/2022 9:25:10 PM ******/
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
ALTER TABLE [dbo].[Log] ADD  DEFAULT (getdate()) FOR [LogTime]
GO
