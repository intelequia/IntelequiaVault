SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateIPFilter]
	@IPFilterID		int,
	@IPAddress		nvarchar(50),
	@SubnetMask		nvarchar(50),
	@RuleType		tinyint,
	@LastModifiedByUserID		int
AS 
	BEGIN
		UPDATE dbo.IPFilter 
			SET 
				IPAddress = @IPAddress,
				SubnetMask = @SubnetMask,
				RuleType = @RuleType,
				LastModifiedByUserID = @LastModifiedByUserID,
				LastModifiedOnDate = getdate()
			WHERE IPFilterID = @IPFilterID
	END
GO
