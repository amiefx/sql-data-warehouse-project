/*
    File: init_database.sql
    Purpose: Create a DataWarehouse database and three staging/processing schemas:
                     bronze (raw), silver (cleansed), gold (curated/optimized)
    Notes:
        - Run with an account that has CREATE DATABASE permission (typically a sysadmin).
        - This script switches context to master to create the database, then uses the new DB.
        - GO is a batch separator understood by SQL Server tools (sqlcmd/SSMS).
        - Adjust schema owners or add permissions as required for your environment.
    Author: [Amin]
    Created: [2025-10-04]
*/

-- Ensure we're in the master database to create a new database
USE master;
GO

-- Create the DataWarehouse database if it does not already exist
-- Consider adding file location/size options in production deployments
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
        ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
        DROP DATABASE DataWarehouse;
END
GO

CREATE DATABASE DataWarehouse;
GO

-- Switch to the newly created database context
USE DataWarehouse; 
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

