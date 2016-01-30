SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Comment_ListByJournalIds]
@JounalIds nvarchar(max) = ''
AS
SELECT jc.*, u.* FROM dbo.[Journal_Comments] as jc 
	INNER JOIN dbo.[Users] as u ON jc.UserId = u.UserId
	INNER JOIN dbo.[Journal_Split](@JounalIds,';') as j ON j.id = jc.JournalId
ORDER BY jc.CommentId ASC
GO
