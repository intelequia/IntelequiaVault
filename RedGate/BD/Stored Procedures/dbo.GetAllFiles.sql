SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAllFiles]
AS
BEGIN
	SELECT   
	  FileId,  
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
	FROM dbo.[vw_Files] 	
END
GO
