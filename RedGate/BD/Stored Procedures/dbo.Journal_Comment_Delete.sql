SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Comment_Delete]
@JournalId int,
@CommentId int
AS
DELETE FROM dbo.[Journal_Comments] 
	WHERE 
		(JournalId = @JournalId AND CommentId = @CommentId)
		OR
		(JournalId = @JournalId AND CommentId = -1)
GO
