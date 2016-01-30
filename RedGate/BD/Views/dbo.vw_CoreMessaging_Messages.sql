SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_CoreMessaging_Messages]
AS
	SELECT
		M.MessageID, 
		M.PortalID, 
		M.NotificationTypeID, 
		M.[To], 
		M.[From],
		M.Subject,
		M.Body,
		M.ConversationID, 
		M.ReplyAllAllowed, 
		M.SenderUserID,
		M.ExpirationDate, 
        M.Context, 
		M.IncludeDismissAction,
		M.CreatedByUserID, 
		M.CreatedOnDate, 
		M.LastModifiedByUserID, 
		M.LastModifiedOnDate, 
		MR.RecipientID,
		MR.UserID, 
        MR.[Read], 
		MR.Archived, 
		MR.EmailSent, 
		MR.EmailSentDate, 
		MR.EmailSchedulerInstance
	FROM       dbo.[CoreMessaging_MessageRecipients] MR
	INNER JOIN dbo.[CoreMessaging_Messages]          M ON mr.MessageID = m.MessageID
GO
