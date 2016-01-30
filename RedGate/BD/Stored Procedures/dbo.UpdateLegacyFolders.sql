SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateLegacyFolders]
AS
	UPDATE TOP (500) dbo.Folders
		SET ParentID = (COALESCE(	
				(SELECT TOP 1
					F2.FolderID 
					FROM dbo.Folders AS F2
					WHERE SUBSTRING (F1.FolderPath, 1, LEN(F1.FolderPath) - 
						(CASE 
							WHEN CHARINDEX ('/', REVERSE(SUBSTRING(F1.FolderPath, 0, LEN(F1.FolderPath)))) != 0 
							THEN CHARINDEX ('/', REVERSE(SUBSTRING(F1.FolderPath, 0, LEN(F1.FolderPath)))) 
							ELSE LEN(F1.FolderPath) END
						 )) = F2.FolderPath
						AND (F2.PortalID = F1.PortalID OR (F1.PortalID IS NULL AND F2.PortalID IS NULL))
						AND LEN(F1.FolderPath) > LEN(F2.FolderPath)
					ORDER BY LEN(F2.FolderPath) DESC
					), -1))
	FROM dbo.Folders AS F1
	WHERE F1.ParentID IS NULL AND FolderPath <> ''
GO
