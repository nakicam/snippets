
CREATE SCHEMA airline;
GO

CREATE TABLE airline.Department
(
    DEST_COUNTRY_NAME nvarchar(200) NOT NULL PRIMARY KEY NONCLUSTERED,
    ORIGIN_COUNTRY_NAME nvarchar(200) NOT NULL,
    count INT NULL,
)





