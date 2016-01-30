SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CheckReplyHasRecipients]
	@ConversationId Int, -- Not Null
	@UserId 		Int  -- Not Null
AS 
BEGIN
	SELECT COUNT(M.UserID)
	FROM       dbo.vw_CoreMessaging_Messages AS M
	INNER JOIN dbo.vw_Users AS U ON M.UserID = U.UserID AND M.PortalID = IsNull(U.PortalID, M.PortalID)
	WHERE (M.MessageID = @ConversationId) 
	  AND (M.UserID   <> @UserId) 
	  AND (U.IsDeleted = 0)
END
GO
