SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_GetStatsForGroup]
	@PortalId INT,
	@GroupId INT
AS
SELECT Count(j.JournalTypeId) as JournalTypeCount, 
	   jt.JournalType 
	   FROM dbo.[Journal] AS j 
	   INNER JOIN dbo.[Journal_Types] AS jt ON jt.JournalTypeId = j.JournalTypeId
	WHERE j.GroupId = @GroupId AND j.PortalId = @PortalId AND j.IsDeleted = 0
	Group BY j.JournalTypeId, jt.JournalType
GO
