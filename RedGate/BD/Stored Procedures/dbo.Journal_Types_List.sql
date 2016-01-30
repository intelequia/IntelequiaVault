SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Types_List]
@PortalId int
AS
SELECT * 
FROM dbo.[Journal_Types]
WHERE (PortalId = -1 OR PortalId = @PortalId)
GO
