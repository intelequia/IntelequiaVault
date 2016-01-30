SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[AddDefaultFolderTypes]
	@PortalID int
AS
BEGIN
	INSERT INTO dbo.[FolderMappings] (PortalID, MappingName, FolderProviderType, Priority)
	SELECT @PortalID, 'Standard', 'StandardFolderProvider', 1
	UNION ALL
	SELECT @PortalID, 'Secure', 'SecureFolderProvider', 2
	UNION ALL
	SELECT @PortalID, 'Database', 'DatabaseFolderProvider', 3
END
GO
