/*
Project: Uber Trip Analytics
Purpose: Database and raw data setup
*/

create database UberTripAnalytics

use UberTripAnalytics

select * from [dbo].['Trip Details$']
select * from [dbo].['Location Table$']



SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'


EXEC sp_help 'dbo.''Trip Details$'''
GO

EXEC sp_help 'dbo.''Location Table$'''
GO
