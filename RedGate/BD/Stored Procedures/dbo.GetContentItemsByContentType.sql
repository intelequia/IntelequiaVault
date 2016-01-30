SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetContentItemsByContentType] 
	@ContentTypeId int
AS
	SELECT * FROM dbo.ContentItems WHERE ContentTypeID = @ContentTypeId
GO
