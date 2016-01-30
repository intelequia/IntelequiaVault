SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddIPFilter]
	@IPAddress nvarchar(50),
	@SubnetMask nvarchar(50),
	@RuleType tinyint,
	@CreatedByUserID			int
AS 
	BEGIN
		INSERT INTO dbo.IPFilter  
		(
		[IPAddress]
           ,[SubnetMask]
           ,[RuleType]
           ,[CreatedByUserID]
           ,[CreatedOnDate]
           ,[LastModifiedByUserID]
           ,[LastModifiedOnDate]
		)  
		VALUES  
		( 
			@IPAddress , 
			@SubnetMask , 
			@RuleType,
			@CreatedByUserID , 
			getdate() , 
			@CreatedByUserID , 
			getdate() 
		) 
		 
		SELECT SCOPE_IDENTITY()
	END
GO
