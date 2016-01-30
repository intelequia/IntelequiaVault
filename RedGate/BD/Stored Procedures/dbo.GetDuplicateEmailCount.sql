SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDuplicateEmailCount]
    @PortalId INT
AS 
	SELECT ISNULL((SELECT COUNT(*) TotalCount FROM dbo.[Users] U Inner Join dbo.[UserPortals] UP on UP.[UserId] = U.[UserId] WHERE UP.PortalId = @PortalId  GROUP BY U.[Email] HAVING COUNT(*) > 1), 0)
GO
