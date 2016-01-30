SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Mobile_GetRedirections] @PortalId INT
AS 
    SELECT  Id ,
            PortalId ,
            Name ,
            [Type] ,
            SortOrder ,
            SourceTabId ,
			IncludeChildTabs ,
            TargetType ,
            TargetValue ,
			Enabled ,
            CreatedByUserID ,
            CreatedOnDate ,
            LastModifiedByUserID ,
            LastModifiedOnDate
    FROM    dbo.Mobile_Redirections
    WHERE   PortalId = @PortalId
	ORDER BY SortOrder ASC
GO
