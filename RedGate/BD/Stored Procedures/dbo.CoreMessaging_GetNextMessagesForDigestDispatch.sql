SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_GetNextMessagesForDigestDispatch]
	@Frequency INT ,
	@SchedulerInstance UNIQUEIDENTIFIER ,
	@BatchSize INT
AS 
	BEGIN
		UPDATE  dbo.[CoreMessaging_MessageRecipients]
		SET     EmailSchedulerInstance = @SchedulerInstance
		WHERE   RecipientID IN (
				SELECT 
						RecipientID
				FROM    dbo.[vw_MessagesForDispatch] MFD
				WHERE UserID IN (
							SELECT TOP ( @BatchSize  )
									UserID
							FROM    dbo.[vw_MessagesForDispatch] MFD
							WHERE   EmailSent = 0
									AND [Read] = 0
									AND Archived = 0
									AND EmailFrequency = @Frequency
									AND ( ( EmailSchedulerInstance IS NULL
											AND EmailSentDate IS NULL
										  )
										  OR EmailSchedulerInstance = '00000000-0000-0000-0000-000000000000'
										)        
							GROUP BY UserID
							ORDER BY UserID      
						)  
						AND EmailSent = 0
						AND [Read] = 0
						AND Archived = 0
						AND EmailFrequency = @Frequency
						AND ( ( EmailSchedulerInstance IS NULL
								AND EmailSentDate IS NULL
							  )
							  OR EmailSchedulerInstance = '00000000-0000-0000-0000-000000000000'
							))

		SELECT  *
		FROM    dbo.[CoreMessaging_MessageRecipients] CMR
				INNER JOIN dbo.[CoreMessaging_Messages] CMM ON CMR.MessageID = CMM.MessageID
		WHERE   EmailSent = 0
				AND EmailSentDate IS NULL
				AND [Read] = 0
				AND Archived = 0
				AND ( EmailSchedulerInstance = @SchedulerInstance )
		ORDER BY UserID ,
				CMM.CreatedOnDate DESC                      
	END
GO
