SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Mobile_GetPreviewProfiles] @PortalId INT
AS 
    SELECT  Id, PortalId, Name, Width, Height, UserAgent, SortOrder, CreatedByUserID, CreatedOnDate, LastModifiedByUserID, LastModifiedOnDate
    FROM    dbo.Mobile_PreviewProfiles
    WHERE   PortalId = @PortalId
	ORDER BY SortOrder ASC
GO
