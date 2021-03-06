/*
   Wednesday, June 14, 20176:56:03 PM
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
CREATE TABLE dbo.Tmp_Transactions
	(
	RegNo varchar(6) NOT NULL,
	EntryDate datetime NOT NULL,
	Status bit NOT NULL,
	ID int NOT NULL IDENTITY (1, 1)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Transactions SET (LOCK_ESCALATION = TABLE)
GO
SET IDENTITY_INSERT dbo.Tmp_Transactions OFF
GO
IF EXISTS(SELECT * FROM dbo.Transactions)
	 EXEC('INSERT INTO dbo.Tmp_Transactions (RegNo, EntryDate, Status)
		SELECT RegNo, EntryDate, Status FROM dbo.Transactions WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.Transactions
GO
EXECUTE sp_rename N'dbo.Tmp_Transactions', N'Transactions', 'OBJECT' 
GO
ALTER TABLE dbo.Transactions ADD CONSTRAINT
	PK_Transactions_1 PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.Transactions', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Transactions', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Transactions', 'Object', 'CONTROL') as Contr_Per 