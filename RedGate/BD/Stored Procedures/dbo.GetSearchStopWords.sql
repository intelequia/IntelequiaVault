SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSearchStopWords]
	@PortalID int,
	@CultureCode nvarchar(50)
AS
BEGIN
	SELECT   
	  [StopWordsID],  
	  [StopWords],  
	  [CreatedByUserID],  
	  [CreatedOnDate],  
	  [LastModifiedByUserID],  
	  [LastModifiedOnDate],
	  [PortalID],
	  [CultureCode]
	FROM dbo.SearchStopWords 
	WHERE [PortalID] = @PortalID AND [CultureCode] = @CultureCode
END
GO
