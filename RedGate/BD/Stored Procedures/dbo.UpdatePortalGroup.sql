SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdatePortalGroup]
	@PortalGroupID				int,
	@PortalGroupName			nvarchar(100),
	@PortalGroupDescription		nvarchar(2000),
	@AuthenticationDomain		nvarchar(200),
	@LastModifiedByUserID		int
AS 
	BEGIN
		UPDATE dbo.PortalGroups 
			SET 
				PortalGroupName = @PortalGroupName,
				PortalGroupDescription = @PortalGroupDescription,
				AuthenticationDomain = @AuthenticationDomain,
				LastModifiedByUserID = @LastModifiedByUserID,
				LastModifiedOnDate = getdate()
			WHERE PortalGroupID = @PortalGroupID
	END
GO
