-- ==============================
-- Create External Table Template
-- ==============================


CREATE EXTERNAL TABLE [ext].[FactRides] 
(
	[DateID] [int],
	[MedallionID] [int],
	[HackneyLicenseID] [int] NULL,
	[PickupTimeID] [int] NULL,
	[DropoffTimeID] [int] NULL,
	[PickupGeographyID] [int] NULL,
	[DropoffGeographyID] [int] NULL,
	[PickupLatitude] [float] NULL,
	[PickupLongitude] [float] NULL,
	[PickupLatLong] [nvarchar](4000) NULL,
	[DropoffLatitude] [float] NULL,
	[DropoffLongitude] [float] NULL,
	[DropoffLatLong] [nvarchar](4000) NULL,
	[PassengerCount] [int] NULL,
	[TripDurationSeconds] [int] NULL,
	[TripDistanceMiles] [float] NULL,
	[PaymentType] [nvarchar](4000) NULL,
	[FareAmount] [numeric](19, 4) NULL,
	[SurchargeAmount] [numeric](19, 4) NULL,
	[TaxAmount] [numeric](19, 4) NULL,
	[TipAmount] [numeric](19, 4) NULL,
	[TollsAmount] [numeric](19, 4) NULL,
	[TotalAmount] [numeric](19, 4) NULL
)
WITH ( LOCATION ='data-import/rides-import/rides2.parquet',
    DATA_SOURCE = datalake_stg,  
    FILE_FORMAT = Parquet,
);

	/*
	CREATE EXTERNAL TABLE [ext].[fact_StockHolding] (
    [Stock Holding Key] [bigint] NOT NULL,
    [Stock Item Key] [int] NOT NULL,
    [Quantity On Hand] [int] NOT NULL,
    [Bin Location] [nvarchar](20) NOT NULL,
    [Last Stocktake Quantity] [int] NOT NULL,
    [Last Cost Price] [decimal](18, 2) NOT NULL,
    [Reorder Level] [int] NOT NULL,
    [Target Stock Level] [int] NOT NULL,
    [Lineage Key] [int] NOT NULL
)
WITH ( LOCATION ='/v1/fact_StockHolding/',
    DATA_SOURCE = WWIStorage,  
    FILE_FORMAT = TextFileFormat,
    REJECT_TYPE = VALUE,
    REJECT_VALUE = 0
);