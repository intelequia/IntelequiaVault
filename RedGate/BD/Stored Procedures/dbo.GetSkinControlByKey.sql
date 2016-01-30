SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSkinControlByKey]
	@ControlKey	nvarchar(50)
AS
    SELECT *
    FROM   dbo.SkinControls
	WHERE ControlKey = @ControlKey
GO
