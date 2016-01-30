SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetRoles]
AS
BEGIN
    SELECT R.*,
          (SELECT COUNT(*) FROM dbo.[UserRoles] U WHERE U.RoleID = R.RoleID) AS UserCount
     FROM dbo.[Roles] AS R
     WHERE RoleID >= 0 -- ignore virtual roles. Note: might be removed, after controller has been adjusted
END
GO
