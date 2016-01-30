SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSkinControl]
	@SkinControlID	int
AS
    SELECT *
    FROM   dbo.SkinControls
	WHERE SkinControlID = @SkinControlID
GO
