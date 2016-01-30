SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DeleteSkinControl]
	@SkinControlId int
AS
    DELETE
    FROM   dbo.SkinControls
    WHERE  SkinControlId = @SkinControlId
GO
