SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- new function to return RoleID for Administrators of the Portal passed in as parameter
CREATE FUNCTION [dbo].[AdministratorRoleId](
    @PortalId	 		 Int -- Needs to be >= 0, otherwise false is returned
) 
	RETURNS 			 int
AS
	BEGIN
		DECLARE @adminRoleId int = 0
		SELECT  @adminRoleId = AdministratorRoleId FROM dbo.[Portals] WHERE PortalID = @PortalId
		RETURN  @adminRoleId
	END
GO
