/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*						
--------------------------------------------------------------------------------------				
Pre-Deployment Script - START
--------------------------------------------------------------------------------------
*/
	
	/*
	--------------------------------------------------------
	1.PreDeployment.Updates.sql - START
	--------------------------------------------------------
	*/
		PRINT '		1.PreDeployment.Updates.sql - START'
		GO

		:r ..\ContinuousDeployment\1.PreDeployment.Updates.sql
		GO

		PRINT '		1.PreDeployment.Updates.sql - END'
		GO
	/*
	--------------------------------------------------------
	1.PreDeployment.Updates.sql - END
	--------------------------------------------------------
	*/

/*						
--------------------------------------------------------------------------------------				
Pre-Deployment Script - END
--------------------------------------------------------------------------------------
*/
