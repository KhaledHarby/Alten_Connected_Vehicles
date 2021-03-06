/*
   Monday, June 5, 20179:15:43 PM
   User: 
   Server: TFAWAZ\TIKASQL
   Database: Alten_Connected_Vehicles
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Customer
	(
	ID uniqueidentifier NOT NULL,
	Name varchar(50) NOT NULL,
	Address varchar(255) NULL,
	Active bit NULL,
	Deleted bit NULL,
	CreatedOn datetime NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	DF_Customer_Active DEFAULT 1 FOR Active
GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	DF_Customer_Deleted DEFAULT 0 FOR Deleted
GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	DF_Customer_CreatedOn DEFAULT getdate() FOR CreatedOn
GO
ALTER TABLE dbo.Customer ADD CONSTRAINT
	PK_Customer PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Customer SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Customer', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Customer', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Customer', 'Object', 'CONTROL') as Contr_Per 