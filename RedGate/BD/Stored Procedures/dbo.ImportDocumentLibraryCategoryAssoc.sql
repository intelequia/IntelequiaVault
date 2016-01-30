SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ImportDocumentLibraryCategoryAssoc]
AS
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.[dlfp_Category]') AND type in (N'U'))
	BEGIN
	SELECT     dlc.CategoryName, dbo.Files.FileId
	FROM         dbo.dlfp_Category AS dlc INNER JOIN
                      dbo.dlfp_DocumentCategoryAssoc AS dlca ON dlc.CategoryID = dlca.CategoryID INNER JOIN
                      dbo.dlfp_Document AS dld ON dlca.DocumentID = dld.ID INNER JOIN
                      dbo.Files ON dld.ID = dbo.Files.FileId
	END
GO
