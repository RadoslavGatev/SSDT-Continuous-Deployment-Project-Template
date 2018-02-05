SET NOCOUNT ON

SET IDENTITY_INSERT [Person].[ContactType] ON

MERGE INTO [Person].[ContactType] AS Target
USING (VALUES
  (1,N'Accounting Manager','2008-04-30T00:00:00')
 ,(2,N'Assistant Sales Agent','2008-04-30T00:00:00')
 ,(3,N'Assistant Sales Representative','2008-04-30T00:00:00')
 ,(4,N'Coordinator Foreign Markets','2008-04-30T00:00:00')
 ,(5,N'Export Administrator','2008-04-30T00:00:00')
 ,(6,N'International Marketing Manager','2008-04-30T00:00:00')
 ,(7,N'Marketing Assistant','2008-04-30T00:00:00')
 ,(8,N'Marketing Manager','2008-04-30T00:00:00')
 ,(9,N'Marketing Representative','2008-04-30T00:00:00')
 ,(10,N'Order Administrator','2008-04-30T00:00:00')
 ,(11,N'Owner','2008-04-30T00:00:00')
 ,(12,N'Owner/Marketing Assistant','2008-04-30T00:00:00')
 ,(13,N'Product Manager','2008-04-30T00:00:00')
 ,(14,N'Purchasing Agent','2008-04-30T00:00:00')
 ,(15,N'Purchasing Manager','2008-04-30T00:00:00')
 ,(16,N'Regional Account Representative','2008-04-30T00:00:00')
 ,(17,N'Sales Agent','2008-04-30T00:00:00')
 ,(18,N'Sales Associate','2008-04-30T00:00:00')
 ,(19,N'Sales Manager','2008-04-30T00:00:00')
 ,(20,N'Sales Representative','2008-04-30T00:00:00')
) AS Source ([ContactTypeID],[Name],[ModifiedDate])
ON (Target.[ContactTypeID] = Source.[ContactTypeID])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[ModifiedDate], Target.[ModifiedDate]) IS NOT NULL OR NULLIF(Target.[ModifiedDate], Source.[ModifiedDate]) IS NOT NULL) THEN
 UPDATE SET
  [Name] = Source.[Name], 
  [ModifiedDate] = Source.[ModifiedDate]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ContactTypeID],[Name],[ModifiedDate])
 VALUES(Source.[ContactTypeID],Source.[Name],Source.[ModifiedDate])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [Person].[ContactType]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[Person].[ContactType] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO

SET IDENTITY_INSERT [Person].[ContactType] OFF
GO
SET NOCOUNT OFF
GO