SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Messaging_GetNextMessageForDispatch] 
	@SchedulerInstance uniqueidentifier
AS
	Declare  @target_messageID int

	SELECT @target_messageID =  MessageID FROM Messaging_Messages WHERE EmailSent = 0  AND  
	(EmailSchedulerInstance is NULL or EmailSchedulerInstance= '00000000-0000-0000-0000-000000000000') 
	AND status not in  (0,3) ORDER BY Date DESC

Update Messaging_Messages set EmailSchedulerInstance = @SchedulerInstance  where MessageID = @target_messageID
select * from Messaging_Messages where MessageID = @target_messageID
GO
