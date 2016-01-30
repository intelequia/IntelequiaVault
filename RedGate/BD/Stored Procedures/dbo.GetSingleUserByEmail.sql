SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetSingleUserByEmail]
    @PortalId INT,
	@Email nvarchar(255)
AS 
	SELECT ISNULL((SELECT TOP 1 U.UserId from dbo.[Users] U Inner Join dbo.[UserPortals] UP on UP.[UserId] = U.[UserId] Where U.Email = @Email and UP.[PortalId] = @PortalId), -1)
GO
