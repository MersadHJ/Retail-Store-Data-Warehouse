create or alter procedure drop_const
as 
ALTER TABLE [dbo].[customer] DROP CONSTRAINT [FK_Customer_ID_Address_ID];
ALTER TABLE [dbo].[customer_order] DROP CONSTRAINT [FK__customer___Store__619B8048];
ALTER TABLE [dbo].[customer_order] DROP CONSTRAINT [FK_CustomerOrder_ID_Customer_ID];
ALTER TABLE [dbo].[customer_order] DROP CONSTRAINT [FK_CustomerOrder_ID_CustomerPayment_ID];
ALTER TABLE [dbo].[customer_order] DROP CONSTRAINT [FK_CustomerOrder_ID_Employee_ID];
ALTER TABLE [dbo].[customer_order_details] DROP CONSTRAINT [FK_CustomerOrder_ID_CustomerOrderDetails_ID];
ALTER TABLE [dbo].[customer_order_details] DROP CONSTRAINT [FK_Product_ID_CustomerOrderDetails_ID];
ALTER TABLE [dbo].[customer_payment_details] DROP CONSTRAINT [FK_CustomerModeID_CustomerPayment_ID];
ALTER TABLE [dbo].[employee] DROP CONSTRAINT [FK_Employee_ID_Address_ID];
ALTER TABLE [dbo].[employee] DROP CONSTRAINT [FK_Employee_ID_Store_ID];
ALTER TABLE [dbo].[inventory] DROP CONSTRAINT [FK_Store_ID_Inventory_ID];
ALTER TABLE [dbo].[product] DROP CONSTRAINT [FK__product__Subcate__6B24EA82];
ALTER TABLE [dbo].[product_inventory] DROP CONSTRAINT [FK_Product_Inventory_Inventory_ID];
ALTER TABLE [dbo].[product_inventory] DROP CONSTRAINT [FK_Product_Inventory_Product_ID];
ALTER TABLE [dbo].[product_subcategory] DROP CONSTRAINT [FK_Subcategory_ID_Category_ID];
ALTER TABLE [dbo].[store] DROP CONSTRAINT [FK_Store_ID_Address_ID];
ALTER TABLE [dbo].[store_has_supplier] DROP CONSTRAINT [FK_store_has_supplier_Store_ID];
ALTER TABLE [dbo].[store_has_supplier] DROP CONSTRAINT [FK_store_has_supplier_Supplier_ID];
ALTER TABLE [dbo].[store_order] DROP CONSTRAINT [FK_StoreOrder_ID_Store_ID];
ALTER TABLE [dbo].[store_order] DROP CONSTRAINT [FK_StoreOrder_ID_Supplier_ID];
ALTER TABLE [dbo].[store_order] DROP CONSTRAINT [FK_StorePayment_ID_StoreOrder_ID];
ALTER TABLE [dbo].[store_order_details] DROP CONSTRAINT [FK_StoreOrder_ID_Order_ID];
ALTER TABLE [dbo].[store_payment_details] DROP CONSTRAINT [FK_StoreModeID_StorePayment_ID];
ALTER TABLE [dbo].[store_payment_details] DROP CONSTRAINT [FK_StorePayment_ID_Store_ID];
ALTER TABLE [dbo].[supplier] DROP CONSTRAINT [FK_supplier_ID_Address_ID];
go


create or alter procedure add_const as
ALTER TABLE [dbo].[customer_order] ADD CONSTRAINT [FK_CustomerOrder_ID_CustomerPayment_ID] FOREIGN KEY ([Payment_ID]) REFERENCES [dbo].[customer_payment_details]([CustomerPayment_ID]);
ALTER TABLE [dbo].[customer_order_details] ADD CONSTRAINT [FK_CustomerOrder_ID_CustomerOrderDetails_ID] FOREIGN KEY ([CustomerOrder_ID]) REFERENCES [dbo].[customer_order]([CustomerOrder_ID]);
ALTER TABLE [dbo].[store_order_details] ADD CONSTRAINT [FK_StoreOrder_ID_Order_ID] FOREIGN KEY ([StoreOrder_ID]) REFERENCES [dbo].[store_order]([StoreOrder_ID]);
ALTER TABLE [dbo].[customer] ADD CONSTRAINT [FK_Customer_ID_Address_ID] FOREIGN KEY ([Address_ID]) REFERENCES [dbo].[address]([Address_ID]);
ALTER TABLE [dbo].[employee] ADD CONSTRAINT [FK_Employee_ID_Address_ID] FOREIGN KEY ([Address_ID]) REFERENCES [dbo].[address]([Address_ID]);
ALTER TABLE [dbo].[store] ADD CONSTRAINT [FK_Store_ID_Address_ID] FOREIGN KEY ([Address_ID]) REFERENCES [dbo].[address]([Address_ID]);
ALTER TABLE [dbo].[supplier] ADD CONSTRAINT [FK_supplier_ID_Address_ID] FOREIGN KEY ([Address_ID]) REFERENCES [dbo].[address]([Address_ID]);
ALTER TABLE [dbo].[customer_order] ADD CONSTRAINT [FK_CustomerOrder_ID_Customer_ID] FOREIGN KEY ([Customer_ID]) REFERENCES [dbo].[customer]([Customer_ID]);
ALTER TABLE [dbo].[customer_payment_details] ADD CONSTRAINT [FK_CustomerModeID_CustomerPayment_ID] FOREIGN KEY ([CustomerModeID]) REFERENCES [dbo].[customerpaymentmode]([CustomerModeID]);
ALTER TABLE [dbo].[customer_order] ADD CONSTRAINT [FK_CustomerOrder_ID_Employee_ID] FOREIGN KEY ([Employee_ID]) REFERENCES [dbo].[employee]([Employee_ID]);
ALTER TABLE [dbo].[product_inventory] ADD CONSTRAINT [FK_Product_Inventory_Inventory_ID] FOREIGN KEY ([Inventory_ID]) REFERENCES [dbo].[inventory]([Inventory_ID]);
ALTER TABLE [dbo].[customer_order_details] ADD CONSTRAINT [FK_Product_ID_CustomerOrderDetails_ID] FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[product]([Product_ID]);
ALTER TABLE [dbo].[product_inventory] ADD CONSTRAINT [FK_Product_Inventory_Product_ID] FOREIGN KEY ([Product_ID]) REFERENCES [dbo].[product]([Product_ID]);
ALTER TABLE [dbo].[product] ADD CONSTRAINT [FK__product__Subcate__6B24EA82] FOREIGN KEY ([Subcategory_ID]) REFERENCES [dbo].[product_subcategory]([Subcategory_ID]);
ALTER TABLE [dbo].[product_subcategory] ADD CONSTRAINT [FK_Subcategory_ID_Category_ID] FOREIGN KEY ([Category_ID]) REFERENCES [dbo].[productcategory]([Category_ID]);
ALTER TABLE [dbo].[customer_order] ADD CONSTRAINT [FK__customer___Store__619B8048] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[employee] ADD CONSTRAINT [FK_Employee_ID_Store_ID] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[inventory] ADD CONSTRAINT [FK_Store_ID_Inventory_ID] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[store_has_supplier] ADD CONSTRAINT [FK_store_has_supplier_Store_ID] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[store_order] ADD CONSTRAINT [FK_StoreOrder_ID_Store_ID] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[store_payment_details] ADD CONSTRAINT [FK_StorePayment_ID_Store_ID] FOREIGN KEY ([Store_ID]) REFERENCES [dbo].[store]([Store_ID]);
ALTER TABLE [dbo].[store_order] ADD CONSTRAINT [FK_StorePayment_ID_StoreOrder_ID] FOREIGN KEY ([StorePayment_ID]) REFERENCES [dbo].[store_payment_details]([StorePayment_ID]);
ALTER TABLE [dbo].[store_payment_details] ADD CONSTRAINT [FK_StoreModeID_StorePayment_ID] FOREIGN KEY ([StoreModeID]) REFERENCES [dbo].[storepaymentmode]([StoreModeID]);
ALTER TABLE [dbo].[store_has_supplier] ADD CONSTRAINT [FK_store_has_supplier_Supplier_ID] FOREIGN KEY ([Supplier_ID]) REFERENCES [dbo].[supplier]([Supplier_ID]);
ALTER TABLE [dbo].[store_order] ADD CONSTRAINT [FK_StoreOrder_ID_Supplier_ID] FOREIGN KEY ([Supplier_ID]) REFERENCES [dbo].[supplier]([Supplier_ID]);
go