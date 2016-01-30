SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Comment_Get]
@CommentId int
AS
SELECT jc.*, u.* FROM dbo.[Journal_Comments] as jc 
	INNER JOIN dbo.[Users] as u ON jc.UserId = u.UserId
WHERE jc.CommentId = @CommentId
GO
