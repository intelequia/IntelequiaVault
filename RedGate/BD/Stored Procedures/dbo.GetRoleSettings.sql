SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetRoleSettings]
	@RoleId     int

AS
	SELECT *
	FROM dbo.RoleSettings
	WHERE  RoleID = @RoleId
GO
