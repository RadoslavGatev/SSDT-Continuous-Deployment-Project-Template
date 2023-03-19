CREATE PROCEDURE [dbo].[sp_execute_script]
	@sql nvarchar(MAX),
	@author nvarchar(250),
	@build nvarchar(50) = NULL
AS
	DECLARE @sqlHash binary(64) = HASHBYTES('SHA2_512', @sql);

	IF NOT EXISTS (
		SELECT 1 
		FROM [dbo].[__MigrationLog]
		WHERE [SqlHash] = @sqlHash
			AND [WasSuccessful] = 1
	)
	BEGIN
		BEGIN TRY
			IF NOT EXISTS (
				SELECT 1 
				FROM [dbo].[__MigrationLog]
				WHERE [SqlHash] = @sqlHash
			)
			BEGIN
				INSERT INTO [dbo].[__MigrationLog]
					([SqlHash], [StartTime], [SqlText], [Author], [Build])
				VALUES(@sqlHash, SYSUTCDATETIME(), @sql, @author, @build)     
			END
			ELSE BEGIN
				UPDATE [dbo].[__MigrationLog]
				SET [StartTime] = SYSUTCDATETIME(),
					--not so likely to change but just in case..
					[SqlText] = @sql,
					[Author] = @author,
					[Build] = @build
				WHERE [SqlHash] = @sqlHash 
			END
			
			BEGIN TRANSACTION
				PRINT 'Executing ' + CONVERT(varchar(max), @sqlHash, 1) + 
					': ' + LEFT(@sql, 15) + '...';

				EXECUTE sp_executesql @sql;
			
				UPDATE [dbo].[__MigrationLog]
				SET [EndTime] = SYSUTCDATETIME(),
					[Error] = NULL,
					[WasSuccessful] = 1
				WHERE [SqlHash] = @sqlHash

			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION;

			UPDATE [dbo].[__MigrationLog]
			SET [EndTime] = SYSUTCDATETIME(),
				[WasSuccessful] = 0,
				[Error] = FORMATMESSAGE('%d: %s. ', ERROR_NUMBER(), ERROR_MESSAGE())
			WHERE [SqlHash] = @sqlHash; 
			-- throw again
			THROW
		END CATCH
	END