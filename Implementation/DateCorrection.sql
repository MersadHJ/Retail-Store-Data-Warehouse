update product 
set Manufactured_Date  = DATEADD(year, -10, manufactured_Date)

update product 
set Expiry_Date  = DATEADD(year, -10, Expiry_Date)

update customer_order 
set Date  = DATEADD(year, -10, Date)

update store_order 
set Date  = DATEADD(year, -10, Date)
