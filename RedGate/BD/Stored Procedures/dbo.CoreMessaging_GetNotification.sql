SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetNotification]
	@NotificationId int
AS
BEGIN
	SELECT
		M.[MessageID],
		M.[NotificationTypeId],
		M.[To],
		M.[From],
		M.[Subject],
		M.[Body],
		M.[SenderUserID],
		M.[ExpirationDate],
        M.[IncludeDismissAction],
		M.[CreatedByUserID],
		M.[CreatedOnDate],
		M.[LastModifiedByUserID],
		M.[LastModifiedOnDate],
        M.[Context]
	FROM dbo.[CoreMessaging_Messages] AS M
	WHERE [NotificationTypeId] IS NOT NULL
	AND M.MessageID = @NotificationId
END
GO
