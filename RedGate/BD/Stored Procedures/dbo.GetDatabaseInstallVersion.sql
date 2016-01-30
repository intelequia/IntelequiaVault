SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[GetDatabaseInstallVersion]
AS
SELECT  TOP 1 Major ,
        Minor ,
        Build
FROM    dbo.Version V
WHERE   VersionId IN ( SELECT   MAX(VersionId) AS VersionID
                       FROM     dbo.[Version]
                       GROUP BY CONVERT(NVARCHAR(8), CreatedDate, 112) )
GO
