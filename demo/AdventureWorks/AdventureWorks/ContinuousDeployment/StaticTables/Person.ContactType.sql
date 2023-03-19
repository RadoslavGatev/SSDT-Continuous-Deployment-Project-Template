SET NOCOUNT ON

SET IDENTITY_INSERT [Person].[ContactType] ON

DECLARE @mergeOutput TABLE ( [DMLAction] VARCHAR(6) );
MERGE INTO [Person].[ContactType] AS [Target]
USING (VALUES
  (1,N'Accounting Manager','2008-04-30T00:00:00',1)
 ,(2,N'Assistant Sales Agent','2008-04-30T00:00:00',0)
 ,(3,N'Assistant Sales Representative','2008-04-30T00:00:00',0)
 ,(4,N'Coordinator Foreign Markets','2008-04-30T00:00:00',0)
 ,(5,N'Export Administrator','2008-04-30T00:00:00',0)
 ,(6,N'International Marketing Manager','2008-04-30T00:00:00',1)
 ,(7,N'Marketing Assistant','2008-04-30T00:00:00',0)
 ,(8,N'Marketing Manager','2008-04-30T00:00:00',1)
 ,(9,N'Marketing Representative','2008-04-30T00:00:00',0)
 ,(10,N'Order Administrator','2008-04-30T00:00:00',0)
 ,(11,N'Owner','2008-04-30T00:00:00',0)
 ,(12,N'Owner/Marketing Assistant','2008-04-30T00:00:00',0)
 ,(13,N'Product Manager','2008-04-30T00:00:00',1)
 ,(14,N'Purchasing Agent','2008-04-30T00:00:00',0)
 ,(15,N'Purchasing Manager','2008-04-30T00:00:00',1)
 ,(16,N'Regional Account Representative','2008-04-30T00:00:00',0)
 ,(17,N'Sales Agent','2008-04-30T00:00:00',0)
 ,(18,N'Sales Associate','2008-04-30T00:00:00',0)
 ,(19,N'Sales Manager','2008-04-30T00:00:00',1)
 ,(20,N'Sales Representative','2008-04-30T00:00:00',0)
) AS [Source] ([ContactTypeID],[Name],[ModifiedDate],[IsManager])
ON ([Target].[ContactTypeID] = [Source].[ContactTypeID])
WHEN MATCHED AND (
	NULLIF([Source].[Name], [Target].[Name]) IS NOT NULL OR NULLIF([Target].[Name], [Source].[Name]) IS NOT NULL OR 
	NULLIF([Source].[ModifiedDate], [Target].[ModifiedDate]) IS NOT NULL OR NULLIF([Target].[ModifiedDate], [Source].[ModifiedDate]) IS NOT NULL OR 
	NULLIF([Source].[IsManager], [Target].[IsManager]) IS NOT NULL OR NULLIF([Target].[IsManager], [Source].[IsManager]) IS NOT NULL) THEN
 UPDATE SET
  [Target].[Name] = [Source].[Name], 
  [Target].[ModifiedDate] = [Source].[ModifiedDate], 
  [Target].[IsManager] = [Source].[IsManager]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ContactTypeID],[Name],[ModifiedDate],[IsManager])
 VALUES([Source].[ContactTypeID],[Source].[Name],[Source].[ModifiedDate],[Source].[IsManager])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
OUTPUT $action INTO @mergeOutput;

DECLARE @mergeError int
 , @mergeCount int, @mergeCountIns int, @mergeCountUpd int, @mergeCountDel int
SELECT @mergeError = @@ERROR
SELECT @mergeCount = COUNT(1), @mergeCountIns = SUM(IIF([DMLAction] = 'INSERT', 1, 0)), @mergeCountUpd = SUM(IIF([DMLAction] = 'UPDATE', 1, 0)), @mergeCountDel = SUM (IIF([DMLAction] = 'DELETE', 1, 0)) FROM @mergeOutput
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [Person].[ContactType]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[Person].[ContactType] rows affected by MERGE: ' + CAST(COALESCE(@mergeCount,0) AS VARCHAR(100)) + ' (Inserted: ' + CAST(COALESCE(@mergeCountIns,0) AS VARCHAR(100)) + '; Updated: ' + CAST(COALESCE(@mergeCountUpd,0) AS VARCHAR(100)) + '; Deleted: ' + CAST(COALESCE(@mergeCountDel,0) AS VARCHAR(100)) + ')' ;
 END
GO



SET IDENTITY_INSERT [Person].[ContactType] OFF
SET NOCOUNT OFF
GO