SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Journal_Comment_Save]
	@JournalId int,
	@CommentId int,
	@UserId int,
	@Comment nvarchar(max),
	@CommentXML xml,
	@DateUpdated datetime
AS

DECLARE @cxml xml
DECLARE @xml xml
DECLARE @cdataComment nvarchar(max)

IF EXISTS(SELECT * FROM dbo.[Journal_Comments] WHERE JournalId = @JournalId AND CommentId = @CommentId)
BEGIN
	IF (LEN(@Comment) < 2000)
	BEGIN
		UPDATE dbo.[Journal_Comments]
		SET Comment = @Comment,
			CommentXML = @CommentXML,
			DateUpdated = IsNull(@DateUpdated, GETUTCDATE())
		WHERE JournalId = @JournalId AND CommentId = @CommentId
	END
	ELSE
	BEGIN		
		SET @cxml = (SELECT CommentXML FROM dbo.[Journal_Comments] WHERE CommentId = @CommentId AND JournalId = @JournalId)
		IF @cxml IS NULL 
		BEGIN
			SET @xml = '<root></root>';
			UPDATE dbo.[Journal_Comments]
			SET CommentXML = @xml
			WHERE JournalId = @JournalId AND CommentId = @CommentId
		END

		IF NOT EXISTS(SELECT CommentId FROM dbo.[Journal_Comments] WHERE JournalId = @JournalId AND CommentId = @CommentID AND CommentXML.exist('/root/comment') = 1)
		BEGIN
			UPDATE dbo.[Journal_Comments]
			SET CommentXML.modify('insert <comment>NULL</comment> as last into (/root)[1]') 
			WHERE JournalId = @JournalId AND CommentId = @CommentId AND CommentXML.exist('/root') = 1
		END
		
		SET @cdataComment = '<![CDATA[' + @Comment + ']]>'
		UPDATE dbo.[Journal_Comments]
		SET CommentXML.modify('replace value of (/root/comment[1]/text())[1] with sql:variable("@cdataComment")'),
			Comment = NULL,
			DateUpdated = IsNull(@DateUpdated, GETUTCDATE())
		WHERE JournalId = @JournalId AND CommentId = @CommentId AND CommentXML.exist('/root/comment') = 1
	END
END
ELSE
BEGIN
	IF (LEN(@Comment) < 2000)
	BEGIN
		INSERT INTO dbo.[Journal_Comments]
			(JournalId, UserId, Comment, CommentXML, DateCreated, DateUpdated)
			VALUES
			(@JournalId, @UserId, @Comment, @CommentXML, GETUTCDATE(), GETUTCDATE())
		SET @CommentId = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		INSERT INTO dbo.[Journal_Comments]
			(JournalId, UserId, Comment, CommentXML, DateCreated, DateUpdated)
			VALUES
			(@JournalId, @UserId, NULL, NULL, GETUTCDATE(), GETUTCDATE())
		SET @CommentId = SCOPE_IDENTITY()		
		
		SET @cxml = (SELECT CommentXML FROM dbo.[Journal_Comments] WHERE CommentId = @CommentId AND JournalId = @JournalId)
		IF @cxml IS NULL 
		BEGIN			
			SET @xml = '<root></root>';
			UPDATE dbo.[Journal_Comments]
			SET CommentXML = @xml
			WHERE JournalId = @JournalId AND CommentId = @CommentId
		END

		IF NOT EXISTS(SELECT CommentId FROM dbo.[Journal_Comments] WHERE JournalId = @JournalId AND CommentId = @CommentID AND CommentXML.exist('/root/comment') = 1)
		BEGIN
			UPDATE dbo.[Journal_Comments]
			SET CommentXML.modify('insert <comment>NULL</comment> as last into (/root)[1]') 
			WHERE JournalId = @JournalId AND CommentId = @CommentId AND CommentXML.exist('/root') = 1
		END
		
		SET @cdataComment = '<![CDATA[' + @Comment + ']]>'
		UPDATE dbo.[Journal_Comments]
		SET CommentXML.modify('replace value of (/root/comment[1]/text())[1] with sql:variable("@cdataComment")'),
			Comment = NULL
		WHERE JournalId = @JournalId AND CommentId = @CommentId AND CommentXML.exist('/root/comment') = 1
	END		
END
SELECT @CommentId
GO
