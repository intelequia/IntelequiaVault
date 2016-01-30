SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateFolderMapping]
	@FolderMappingID int,
	@MappingName nvarchar(50),
	@Priority int,
	@LastModifiedByUserID int
AS
BEGIN
	UPDATE dbo.[FolderMappings]
	SET
		MappingName = @MappingName,
		Priority = @Priority,
		LastModifiedByUserID = @LastModifiedByUserID,
		LastModifiedOnDate = GETDATE()
	WHERE FolderMappingID = @FolderMappingID
END
GO
