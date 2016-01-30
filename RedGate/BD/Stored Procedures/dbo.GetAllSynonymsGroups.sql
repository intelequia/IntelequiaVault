SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetAllSynonymsGroups]
	@PortalID int,
	@CultureCode nvarchar(50)
AS
BEGIN
	SELECT   
	  [SynonymsGroupID],  
	  [SynonymsTags],  
	  [PortalID],
	  [CreatedByUserID],  
	  [CreatedOnDate],  
	  [LastModifiedByUserID],  
	  [LastModifiedOnDate]
	FROM dbo.SynonymsGroups 
	WHERE [PortalID] = @PortalID
	AND [CultureCode] = @CultureCode
	ORDER BY LastModifiedOnDate DESC
END
GO
