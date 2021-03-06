/*
   Wednesday, June 14, 20176:54:38 PM
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
ALTER TABLE dbo.RawTransctions
	DROP CONSTRAINT DF_RawTransctions_EntryDate
GO
CREATE TABLE dbo.Tmp_RawTransctions
	(
	ID int NOT NULL IDENTITY (1, 1),
	RawData varbinary(MAX) NULL,
	EntryDate datetime NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_RawTransctions SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_RawTransctions ADD CONSTRAINT
	DF_RawTransctions_EntryDate DEFAULT (getdate()) FOR EntryDate
GO
SET IDENTITY_INSERT dbo.Tmp_RawTransctions OFF
GO
IF EXISTS(SELECT * FROM dbo.RawTransctions)
	 EXEC('INSERT INTO dbo.Tmp_RawTransctions (RawData, EntryDate)
		SELECT RawData, EntryDate FROM dbo.RawTransctions WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.RawTransctions
GO
EXECUTE sp_rename N'dbo.Tmp_RawTransctions', N'RawTransctions', 'OBJECT' 
GO
ALTER TABLE dbo.RawTransctions ADD CONSTRAINT
	PK_RawTransctions_1 PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
select Has_Perms_By_Name(N'dbo.RawTransctions', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.RawTransctions', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.RawTransctions', 'Object', 'CONTROL') as Contr_Per 