SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Mobile_DeletePreviewProfile] @Id INT
AS 
		
    DELETE  FROM dbo.Mobile_PreviewProfiles
    WHERE   Id = @Id
GO
