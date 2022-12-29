
CREATE TABLE [dbo].[Dim_Customer](
	[Customer_ID] [int]   NOT NULL,
	[Customer Name] [varchar](120) NOT NULL,
	[PhoneNumber] [char](18) NOT NULL,
	[Address_Field1] [varchar](60) NOT NULL,
	[Address_Field2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL
	);

CREATE TABLE [dbo].[Dim_Store](
	[Store_ID] [int]   NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[Address_Field1] [varchar](60) NOT NULL,
	[Address_Field2] [varchar](60) NULL,
	[Country] [varchar](60) NOT NULL,
	[State] [varchar](60) NOT NULL,
	[City] [varchar](60) NOT NULL,
	[Zipcode] [char](10) NOT NULL);


CREATE TABLE [dbo].[Dim_Product](
[Product_ID] [int]   NOT NULL,
[ProductName] [varchar](120) NOT NULL,
[Price] [numeric](15, 3) NOT NULL,
[Manufactured_Date] [int] NULL,
[Expiry_Date] [int] NULL,
[Subcategory_ID] [int]   NOT NULL,
[SubcategoryName] [varchar](60) NOT NULL,
[Category_ID] [int] NOT NULL,
[Category] [varchar](60) NOT NULL);


CREATE TABLE [dbo].[Dim_Supplier](
	[Supplier_ID] [int]   NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar] (60) NOT NULL,
	[State] [varchar] (60) NOT NULL,
	[City] [varchar] (60) NOT NULL,
	[Zipcode] [char] (10) NOT NULL)


	CREATE TABLE [dbo].[Dim_Employee](
	[Employee_ID] [int]   NOT NULL,
	[Name] [varchar](110) NOT NULL,
	[Current_Store_ID] [int] NOT NULL,
	[Previous_Store_ID] [int] NULL,
	[Effective_Date] [DateTime] NOT NULL,
	[PhoneNumber] [char](15) NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar] (60) NOT NULL,
	[State] [varchar] (60) NOT NULL,
	[City] [varchar] (60) NOT NULL,
	[Zipcode] [char] (10) NOT NULL
	)

CREATE TABLE [dbo].[Dim_SubCategory](
	[Subcategory_ID] [int]   NOT NULL,
	[SubcategoryName] [varchar](60) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Category_Name] [varchar](60) NOT NULL
	)

CREATE TABLE [dbo].[Dim_Payment](
	[PaymentID] [int]   NOT NULL,
	[PaymentMode] [char](20) NOT NULL)


CREATE TABLE [dbo].[Dim_CustomOrder](
	[CustomerOrder_ID_SurrogateKey] [int]   NOT NULL,
	[CustomerOrder_ID] [int]   NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerFirstName] [varchar](60) NOT NULL,
	[CustomerLastName] [varchar](60) NOT NULL,

	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] numeric(20,4) NOT NULL,
	[CustomerPayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
)



CREATE TABLE [dbo].[Dim_StoreOrder](
	[StoreOrder_ID_SurrogateKey] [int]   NOT NULL,
	[StoreOrder_ID] [int]   NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar] (60) NOT NULL,
	[State] [varchar] (60) NOT NULL,
	[City] [varchar] (60) NOT NULL,
	[Zipcode] [char] (10) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] numeric(20,4) NOT NULL,
	[StorePayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
)


--TEMP
CREATE TABLE [dbo].[Temp_Dim_Supplier](
	[Supplier_ID] [int]   NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar] (60) NOT NULL,
	[State] [varchar] (60) NOT NULL,
	[City] [varchar] (60) NOT NULL,
	[Zipcode] [char] (10) NOT NULL)


	CREATE TABLE [dbo].[Temp_Dim_Employee](
	[Employee_ID] [int]   NOT NULL,
	[Name] [varchar](110) NOT NULL,
	[Current_Store_ID] [int] NOT NULL,
	[Previous_Store_ID] [int] NULL,
	[Effective_Date] [DateTime] NOT NULL,
	[PhoneNumber] [char](15) NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar] (60) NOT NULL,
	[State] [varchar] (60) NOT NULL,
	[City] [varchar] (60) NOT NULL,
	[Zipcode] [char] (10) NOT NULL
	)

CREATE TABLE [dbo].[Temp_Dim_SubCategory](
	[Subcategory_ID] [int]   NOT NULL,
	[SubcategoryName] [varchar](60) NOT NULL,
	[Category_ID] [int] NOT NULL,
	[Category_Name] [varchar](60) NOT NULL
	)

CREATE TABLE [dbo].[Temp_Dim_Payment](
	[PaymentID] [int]   NOT NULL,
	[PaymentMode] [char](20) NOT NULL)


CREATE TABLE [dbo].[Temp_Dim_CustomerOrder](
	[CustomerOrder_ID_SurrogateKey] [int] identity(1,1)  NOT NULL,
	[CustomerOrder_ID] [int]   NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerFirstName] [varchar](60) NOT NULL,
	[CustomerLastName] [varchar](60) NOT NULL,

	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] numeric(20,4) NOT NULL,
	[CustomerPayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
)



CREATE TABLE [dbo].[Temp_Dim_StoreOrder](
	[StoreOrder_ID_SurrogateKey] [int] identity(1,1)  NOT NULL,
	[StoreOrder_ID] [int]   NOT NULL,
	[Store_ID] [int] NOT NULL,
	[Store_Name] [varchar](60) NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[SupplierName] [varchar](60) NOT NULL,
	[AddressField1] [varchar](60) NOT NULL,
	[AddressField2] [varchar](60) NULL,
	[Country] [varchar] (60) NOT NULL,
	[State] [varchar] (60) NOT NULL,
	[City] [varchar] (60) NOT NULL,
	[Zipcode] [char] (10) NOT NULL,
	[Date] [int] NOT NULL,
	[Status] [varchar](15) NOT NULL,
	[Total Payment] numeric(20,4) NOT NULL,
	[StorePayment_ID] [int] NOT NULL,
	[PaymentMode] [char](20) NOT NULL,
	[StartDate] [int] NOT NULL,
	[EndDate] [int] NOT NULL,
	[CurrentFlag] [bit] NOT NULL
)


CREATE TABLE [dbo].[Temp_Dim_Customer](
[Customer_ID] [int]   NOT NULL,
[Customer Name] [varchar](120) NOT NULL,
[PhoneNumber] [char](18) NOT NULL,
[Address_Field1] [varchar](60) NOT NULL,
[Address_Field2] [varchar](60) NULL,
[Country] [varchar](60) NOT NULL,
[State] [varchar](60) NOT NULL,
[City] [varchar](60) NOT NULL,
[Zipcode] [char](10) NOT NULL
);

CREATE TABLE [dbo].[Temp_Dim_Store](
[Store_ID] [int]   NOT NULL,
[StoreName] [varchar](50) NOT NULL,
[Address_Field1] [varchar](60) NOT NULL,
[Address_Field2] [varchar](60) NULL,
[Country] [varchar](60) NOT NULL,
[State] [varchar](60) NOT NULL,
[City] [varchar](60) NOT NULL,
[Zipcode] [char](10) NOT NULL);

CREATE TABLE [dbo].[Temp_Dim_Product](
[Product_ID] [int]   NOT NULL,
[ProductName] [varchar](120) NOT NULL,
[Price] [numeric](15, 3) NOT NULL,
[Manufactured_Date] [int] NULL,
[Expiry_Date] [int] NULL,
[Subcategory_ID] [int]   NOT NULL,
[SubcategoryName] [varchar](60) NOT NULL,
[Category_ID] [int] NOT NULL,
[Category] [varchar](60) NOT NULL);

-- LOG
CREATE TABLE [dbo].[Log](
	[Log_ID] [int] identity(1,1) not null PRIMARY KEY,
	[LogTime] [datetime] default current_timestamp NOT NULL,
	[ProcedureName] nvarchar(255),
	[Message] nvarchar(255),

);
go;

-- Trigger that adds the precedure which inserted into the log table
Create or alter TRIGGER [dbo].[LogProcedureName]
ON dbo.[Log]
after insert
AS
BEGIN

    DECLARE @ExecStr varchar(50), @Qry nvarchar(255)

    CREATE TABLE #inputbuffer 
    (
      EventType nvarchar(30), 
      Parameters int, 
      EventInfo nvarchar(255)
    )

    SET @ExecStr = 'DBCC INPUTBUFFER(' + STR(@@SPID) + ')'

    INSERT INTO #inputbuffer 
    EXEC (@ExecStr)

    SET @Qry = (SELECT EventInfo FROM #inputbuffer)

    /*SELECT @Qry AS 'Query that fired the trigger', 
     SYSTEM_USER as LoginName, 
     USER AS UserName, 
     CURRENT_TIMESTAMP AS CurrentTime*/

	update log
	set ProcedureName = (select @Qry from inserted where inserted.Log_ID = log.Log_ID) 

END

-- Example of logging
-- Insert into log (message) values ('this is a test');

