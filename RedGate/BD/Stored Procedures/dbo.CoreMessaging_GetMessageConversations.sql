SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetMessageConversations]
	@UserID int,
	@PortalID int,
	@AfterMessageID int,
	@NumberOfRecords int,
	@SortField nvarchar(25) = 'CreatedOnDate',
	@SortAscending bit = 0,
	@Read bit = 0,
	@Archived bit = 0,
	@SentOnly bit = 0
AS
BEGIN
	--Get the top message for each conversation
	;WITH RollUpMessageIDs AS
	(
		SELECT MAX(m.MessageID) AS TopMessageID
		FROM dbo.[CoreMessaging_MessageRecipients] mr
		INNER JOIN dbo.[CoreMessaging_Messages] m ON mr.MessageID = m.MessageID
		WHERE ((Archived = @Archived) or (@Archived is null AND [Archived] IS NOT null))
		AND (([Read] = @Read) or (@Read is null AND [READ] IS NOT null))
		AND ((@SentOnly = 1 AND SenderUserID = @UserID) or (@SentOnly is NULL AND UserID = @UserID) or (@SentOnly = 0 AND UserID = @UserID))
		AND m.NotificationTypeID IS NULL AND m.PortalID=@PortalID
		GROUP BY ConversationID
	)
	,Conversations  AS
	(
		SELECT  DISTINCT [MessageID], [ConversationID], [Subject], convert(nvarchar(50), [Body]) AS Body,
				[To], [From], [ReplyAllAllowed], [SenderUserID],
				[CreatedByUserID], [CreatedOnDate],
				[LastModifiedByUserID], [LastModifiedOnDate],
				(SELECT COUNT(*) FROM dbo.CoreMessaging_MessageAttachments WHERE MessageID IN (SELECT MessageID FROM dbo.CoreMessaging_Messages WHERE ConversationID = m.ConversationID)) AS AttachmentCount,
				(SELECT COUNT(*) FROM dbo.CoreMessaging_MessageRecipients WHERE MessageID IN (SELECT MessageID FROM dbo.CoreMessaging_Messages WHERE ConversationID = m.ConversationID) AND UserID = @UserID AND [READ] = 0) AS NewThreadCount,
				(SELECT COUNT(*) FROM dbo.CoreMessaging_MessageRecipients WHERE MessageID IN (SELECT MessageID FROM dbo.CoreMessaging_Messages WHERE ConversationID = m.ConversationID) AND UserID = @UserID) AS ThreadCount,
				ROW_NUMBER() OVER(ORDER BY
					 CASE WHEN @SortField = 'CreatedOnDate' AND @SortAscending = 1 THEN [CreatedOnDate] END ASC,
					 CASE WHEN @SortField = 'CreatedOnDate' AND @SortAscending = 0 THEN [CreatedOnDate] END DESC,
					 CASE WHEN @SortField = 'From' AND @SortAscending = 1 THEN [From] END ASC,
					 CASE WHEN @SortField = 'From' AND @SortAscending = 0 THEN [From] END DESC,
					 CASE WHEN @SortField = 'Subject' AND @SortAscending = 1 THEN [Subject] END ASC,
					 CASE WHEN @SortField = 'Subject' AND @SortAscending = 0 THEN [Subject] END DESC
					) AS RowNumber
		FROM dbo.CoreMessaging_Messages AS m
		WHERE MessageID IN (SELECT TopMessageID FROM RollUpMessageIDs)
	)
	SELECT * FROM Conversations
	WHERE (@AfterMessageID > 0 AND RowNumber BETWEEN (SELECT RowNumber + 1 FROM Conversations WHERE [MessageID] = @AfterMessageID) AND (SELECT RowNumber + @NumberOfRecords FROM Conversations WHERE [MessageID] = @AfterMessageID)) OR
	(@AfterMessageID = -1 AND RowNumber BETWEEN 1 AND @NumberOfRecords)
	ORDER BY RowNumber ASC
END
GO
