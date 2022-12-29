use [Retail Store DW]
go

create or alter procedure Update_Dim_Employee
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









