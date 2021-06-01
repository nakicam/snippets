-- ========================================================================================
-- Create User as DBO template for Azure SQL Database and Azure SQL Data Warehouse Database
-- ========================================================================================
-- For login <login_name, sysname, login_name>, create a user in the database
CREATE USER gast
	FOR LOGIN gast
GO

-- Add user to the database owner role
EXEC sp_addrolemember N'db_datareader', N'gast01'
GO
