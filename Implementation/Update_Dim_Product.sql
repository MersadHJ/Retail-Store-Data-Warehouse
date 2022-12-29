go
Create or alter procedure Update_Dim_Product
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