go
Create or alter procedure Update_Dim_SubCategory
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