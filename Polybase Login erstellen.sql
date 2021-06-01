use master;
CREATE LOGIN Loader WITH PASSWORD = 'Deal@2013';
CREATE USER Loader FOR LOGIN Loader;

--use ncsqlpool;
CREATE USER Loader FOR LOGIN Loader;
GRANT CONTROL ON DATABASE::ncsqlpool to Loader;
EXEC sp_addrolemember 'Loader';











