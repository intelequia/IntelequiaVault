SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_Files]
AS
	SELECT	fi.FileId, 
			fi.PortalId, 
			fi.FileName, 
			fi.Extension, 
			fi.Size, 
			fi.Width, 
			fi.Height, 
			fi.ContentType, 
			fi.FolderID, 
			fi.[Content], 
			fi.CreatedByUserID, 
			fi.CreatedOnDate, 
			fi.LastModifiedByUserID, 
			fi.LastModifiedOnDate, 
			fi.UniqueId, 
			fi.VersionGuid, 
			fi.SHA1Hash, 
			fi.LastModificationTime, 
			fi.Title, 
			fi.StartDate, 
			fi.EnablePublishPeriod, 
			fi.EndDate, 
			fi.ContentItemID, 
			fi.PublishedVersion, 
			fo.FolderPath AS Folder,
			fo.IsCached,
			fo.FolderMappingID,
			fo.StorageLocation
	FROM         dbo.[Files] AS fi 
	INNER JOIN dbo.[Folders] AS fo 
		ON fi.FolderID = fo.FolderID
GO
