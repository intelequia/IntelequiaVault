SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFileById]
	@FileId int	,
	@RetrieveUnpublishedFiles bit = 0
AS
BEGIN
	IF @RetrieveUnpublishedFiles = 0 BEGIN
		SELECT FileId,
			   PortalId,
			   [FileName],
			   Extension,
			   Size,
			   Width,
			   Height,
			   ContentType,
			   FolderID,
			   Folder,
			   StorageLocation,
			   IsCached,
			   UniqueId,
			   VersionGuid,
			   SHA1Hash,
			   FolderMappingID,
			   LastModificationTime,
			   Title,
			   EnablePublishPeriod,
			   StartDate,
			   EndDate,
			   CreatedByUserID,
			   CreatedOnDate,
			   LastModifiedByUserID,
			   LastModifiedOnDate,
			   PublishedVersion,
			   ContentItemID
		FROM dbo.[vw_PublishedFiles]
		WHERE FileId = @FileId
	END
	ELSE BEGIN
		SELECT FileId,
			   PortalId,
			   [FileName],
			   Extension,
			   Size,
			   Width,
			   Height,
			   ContentType,
			   FolderID,
			   Folder,
			   StorageLocation,
			   IsCached,
			   [UniqueId],
			   [VersionGuid],
			   SHA1Hash,
			   FolderMappingID,
			   LastModificationTime,
			   Title,
			   EnablePublishPeriod,
			   StartDate,
			   EndDate,
			   CreatedByUserID,
			   CreatedOnDate,
			   LastModifiedByUserID,
			   LastModifiedOnDate,
			   PublishedVersion,
			   ContentItemID
		FROM dbo.[vw_Files] 
		WHERE FileId = @FileId
	END	
END
GO
