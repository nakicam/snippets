
use AdventureWorksDW2019

MERGE [dm].[Sales02] AS t
USING
(

SELECT *
FROM [dbo].[FactInternetSales]

)AS s

ON (
t.SalesOrderNumber= s.SalesOrderNumber and
t.[SalesOrderLineNumber] = s.[SalesOrderLineNumber]

)

WHEN MATCHED THEN
UPDATE SET 
t.SalesOrderNumber = s.SalesOrderNumber,
t.[SalesOrderLineNumber] = s.[SalesOrderLineNumber]

WHEN NOT MATCHED BY Target THEN

INSERT ([ProductKey]
           ,[OrderDateKey]
           ,[DueDateKey]
           ,[ShipDateKey]
           ,[CustomerKey]
           ,[PromotionKey]
           ,[CurrencyKey]
           ,[SalesTerritoryKey]
           ,[SalesOrderNumber]
           ,[SalesOrderLineNumber]
           ,[RevisionNumber]
           ,[OrderQuantity]
           ,[UnitPrice]
           ,[ExtendedAmount]
           ,[UnitPriceDiscountPct]
           ,[DiscountAmount]
           ,[ProductStandardCost]
           ,[TotalProductCost]
           ,[SalesAmount]
           ,[TaxAmt]
           ,[Freight]
           ,[CarrierTrackingNumber]
           ,[CustomerPONumber]
           ,[OrderDate]
           ,[DueDate]
           ,[ShipDate])
VALUES (s.[ProductKey]
           ,s.[OrderDateKey]
           ,s.[DueDateKey]
           ,s.[ShipDateKey]
           ,[CustomerKey]
           ,s.[PromotionKey]
           ,s.[CurrencyKey]
           ,s.[SalesTerritoryKey]
           ,s.[SalesOrderNumber]
           ,s.[SalesOrderLineNumber]
           ,s.[RevisionNumber]
           ,s.[OrderQuantity]
           ,s.[UnitPrice]
           ,s.[ExtendedAmount]
           ,s.[UnitPriceDiscountPct]
           ,s.[DiscountAmount]
           ,s.[ProductStandardCost]
           ,s.[TotalProductCost]
           ,s.[SalesAmount]
           ,s.[TaxAmt]
           ,s.[Freight]
           ,s.[CarrierTrackingNumber]
           ,s.[CustomerPONumber]
           ,s.[OrderDate]
           ,s.[DueDate]
           ,s.[ShipDate])
;