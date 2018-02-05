/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*						
--------------------------------------------------------------------------------------				
Post-Deployment Script - START
--------------------------------------------------------------------------------------
*/

	/*
	--------------------------------------------------------
	2.PostDeployment.StaticTablesList.sql - START
	--------------------------------------------------------
	*/
		PRINT '		2.PostDeployment.StaticTablesList.sql - START'
		GO

		:r ..\ContinuousDeployment\2.PostDeployment.StaticTablesList.sql
		GO

		PRINT '		2.PostDeployment.StaticTablesList.sql - END'
		GO

	/*
	--------------------------------------------------------
	2.PostDeployment.StaticTablesList.sql - END
	--------------------------------------------------------
	*/

	/*
	--------------------------------------------------------
	3.PostDeployment.Updates.sql - START
	--------------------------------------------------------
	*/
		PRINT '		3.PostDeployment.Updates.sql - START'
		GO

		:r ..\ContinuousDeployment\3.PostDeployment.Updates.sql
		GO

		PRINT '		3.PostDeployment.Updates.sql - END'
		GO
	/*
	--------------------------------------------------------
	3.PostDeployment.Updates.sql - END
	--------------------------------------------------------
	*/


/*						
--------------------------------------------------------------------------------------				
Post-Deployment Script - END
--------------------------------------------------------------------------------------
*/
