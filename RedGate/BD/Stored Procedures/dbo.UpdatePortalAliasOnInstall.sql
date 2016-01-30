SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdatePortalAliasOnInstall]
	@PortalAlias			nvarchar(200),
	@LastModifiedByUserID	int
AS
	UPDATE dbo.PortalAlias 
		SET HTTPAlias = @PortalAlias,
			LastModifiedByUserID = @LastModifiedByUserID,
			LastModifiedOnDate = getdate()
	WHERE  HTTPAlias = '_default'
GO
