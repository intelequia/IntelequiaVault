SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_SaveMessage]
    @MessageID INT,
	@PortalID INT,
	@To nvarchar(2000),
	@From nvarchar(200),
    @Subject nvarchar(400),
    @Body nvarchar(max),
    @ConversationID int,
    @ReplyAllAllowed bit,
    @SenderUserID int,
	@CreateUpdateUserID INT
    
AS 
    IF ( @MessageID = -1 ) 
        BEGIN
            INSERT dbo.CoreMessaging_Messages(                    
  					[PortalID],
					[To],
					[From],					
					[Subject],
					[Body],
					[ConversationID],
					[ReplyAllAllowed],
					[SenderUserID],
                    [CreatedByUserID],
                    [CreatedOnDate],
                    [LastModifiedByUserID],
                    [LastModifiedOnDate]			        
                    )
            VALUES  (       
     			    @PortalID,
					@To,
					@From,
				    @Subject,			
					@Body,
					NULL,
					@ReplyAllAllowed,
					@SenderUserID,
                    @CreateUpdateUserID , -- CreatedBy - int
                    GETUTCDATE(), -- CreatedOn - datetime
                    @CreateUpdateUserID , -- LastModifiedBy - int
                    GETDATE() -- LastModifiedOn - datetime			        
                    )
                    
            SELECT  @MessageID = SCOPE_IDENTITY()
			UPDATE  dbo.CoreMessaging_Messages SET [ConversationID] = @MessageID WHERE [MessageID] = @MessageID 
        END
    ELSE 
        BEGIN
            UPDATE  dbo.CoreMessaging_Messages
            SET     [To] = @To,
					[From] = @From,
					[Subject] = @Subject,			
					[Body] = @Body,
					[ConversationID] = @ConversationID,
					[ReplyAllAllowed] = @ReplyAllAllowed,
					[SenderUserID] = SenderUserID,
                    LastModifiedByUserID = @CreateUpdateUserID,
                    LastModifiedOnDate = GETDATE()
            WHERE   MessageID = @MessageID
        END
        
    SELECT  @MessageID
GO
