SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFolderMappingByMappingName]
	@PortalID int,
	@MappingName nvarchar(50)
AS
BEGIN
	SELECT *
	FROM dbo.[FolderMappings]
	WHERE ISNULL(PortalID, -1) = ISNULL(@PortalID, -1) AND MappingName = @MappingName
END
GO
