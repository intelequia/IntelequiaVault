SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdatePortalSetup]
	@PortalId				INT,
	@AdministratorId		INT,
	@AdministratorRoleId	INT,
	@RegisteredRoleId		INT,
	@SplashTabId			INT,
	@HomeTabId				INT,
	@LoginTabId				INT,
	@RegisterTabId			INT,
	@UserTabId				INT,
	@SearchTabId            INT,
    @Custom404TabId         INT,
    @Custom500TabId         INT,
	@AdminTabId				INT,
	@CultureCode			NVARCHAR(50)

AS
	UPDATE dbo.Portals
		SET    
			AdministratorId = @AdministratorId, 
			AdministratorRoleId = @AdministratorRoleId, 
			RegisteredRoleId = @RegisteredRoleId
	WHERE  PortalId = @PortalId

	UPDATE dbo.PortalLocalization
		SET 
			HomeTabId = @HomeTabId,
			LoginTabId = @LoginTabId,
			UserTabId = @UserTabId,
			RegisterTabId = @RegisterTabId,
			AdminTabId = @AdminTabId,
			SplashTabId = @SplashTabId,
			SearchTabId = @SearchTabId,
            Custom404TabId = @Custom404TabId,
            Custom500TabId = @Custom500TabId
      WHERE portalID = @PortalID
GO
